"""Identificação e mapeamento em memória das cinco variantes históricas."""

from dataclasses import dataclass

from .schema import SCHEMA


@dataclass(frozen=True)
class Variante:
    codigo: str
    descricao: str
    mapa: dict[str, str]
    metadados: tuple[str, ...] = ()


VARIANTES = {
    "v1_principal_21": Variante(
        "v1_principal_21", "20 campos + relevancia_estrategica",
        {campo: campo for campo in SCHEMA}, ("relevancia_estrategica",),
    ),
    "v2_data_edicao": Variante(
        "v2_data_edicao", "data_edicao/evento_id",
        {**{campo: campo for campo in SCHEMA if campo not in {
            "id_evento", "data_publicacao", "fonte", "aproximacao_variavel",
            "cod_loteamento", "nivel_confianca_loteamento",
        }}, "data_edicao": "data_publicacao", "evento_id": "id_evento"},
        ("numero_edicao", "relevancia", "descricao_evento", "fonte_arquivo", "status_validacao"),
    ),
    "v3_item_resumo": Variante(
        "v3_item_resumo", "fonte/data/item/resumo",
        {**{campo: campo for campo in SCHEMA if campo not in {
            "id_evento", "data_publicacao", "titulo", "municipio", "aproximacao_variavel",
        }}, "item": "id_evento", "data": "data_publicacao", "resumo": "titulo",
            "municipio_impactado": "municipio"},
        ("origem", "tipo_abrangencia"),
    ),
    "v4_data_classificacao": Variante(
        "v4_data_classificacao", "sem aproximacao_variavel + data_classificacao",
        {campo: campo for campo in SCHEMA if campo != "aproximacao_variavel"},
        ("relevancia_estrategica", "data_classificacao"),
    ),
    "v5_bom_literal": Variante(
        "v5_bom_literal", "BOM literal em id_evento",
        {**{campo: campo for campo in SCHEMA if campo != "id_evento"},
            '\\xEF\\xBB\\xBF"id_evento"': "id_evento"},
        ("relevancia_estrategica",),
    ),
}


def identificar(cabecalho: list[str]) -> Variante | None:
    campos = set(cabecalho)
    if '\\xEF\\xBB\\xBF"id_evento"' in campos:
        return VARIANTES["v5_bom_literal"]
    if {"data_edicao", "evento_id", "status_validacao"} <= campos:
        return VARIANTES["v2_data_edicao"]
    if {"data", "item", "resumo", "municipio_impactado"} <= campos:
        return VARIANTES["v3_item_resumo"]
    if "data_classificacao" in campos and "aproximacao_variavel" not in campos:
        return VARIANTES["v4_data_classificacao"]
    if set(SCHEMA) <= campos:
        return VARIANTES["v1_principal_21"]
    return None


def mapear(original: dict[str, str], variante: Variante) -> dict[str, str]:
    registro = {campo: "" for campo in SCHEMA}
    for origem, destino in variante.mapa.items():
        registro[destino] = (original.get(origem) or "").strip()
    if variante.codigo == "v2_data_edicao":
        registro["fonte"] = "Tribuna Liberal"
    return registro


def plano(variante: Variante, cabecalho: list[str]) -> list[dict[str, str]]:
    itens = []
    for origem, destino in variante.mapa.items():
        if origem != destino:
            itens.append({"variante": variante.codigo, "campo_origem": origem,
                          "campo_destino": destino, "acao": "renomear",
                          "categoria": "normalizacao_deterministica"})
    for campo in variante.metadados:
        if campo in cabecalho:
            itens.append({"variante": variante.codigo, "campo_origem": campo,
                          "campo_destino": "metadados_auxiliares", "acao": "preservar_fora_schema",
                          "categoria": "normalizacao_deterministica"})
    ausentes = set(SCHEMA) - set(variante.mapa.values())
    for campo in sorted(ausentes):
        acao = "preencher_constante_tribuna_liberal" if campo == "fonte" and variante.codigo == "v2_data_edicao" else "criar_vazio"
        categoria = "normalizacao_deterministica" if campo not in {"cod_loteamento", "nivel_confianca_loteamento"} else "revisao_semantica"
        itens.append({"variante": variante.codigo, "campo_origem": "",
                      "campo_destino": campo, "acao": acao, "categoria": categoria})
    return itens
