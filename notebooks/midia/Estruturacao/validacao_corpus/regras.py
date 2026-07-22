"""Regras de validação, deduplicadas por causa-raiz."""

from __future__ import annotations

import re
from collections import Counter, defaultdict
from datetime import datetime

from .schema import ALIASES, OBRIGATORIOS, VOCABULARIOS


def resultado(categoria, arquivo, linha, registro, campo, regra, causa, mensagem,
              proposto="", afetados=1):
    return {
        "categoria": categoria, "arquivo": arquivo, "linha": linha,
        "id_evento": registro.get("id_evento", ""), "campo": campo,
        "valor_encontrado": registro.get(campo, ""), "valor_proposto": proposto,
        "regra": regra, "causa_raiz": causa, "mensagem": mensagem,
        "registros_afetados": afetados,
    }


def adicionar(saida: dict, item: dict) -> None:
    chave = (item["arquivo"], item["linha"], item["campo"], item["causa_raiz"])
    prioridade = {"erro_confirmado": 1, "normalizacao_deterministica": 2, "revisao_semantica": 3}
    atual = saida.get(chave)
    if not atual or prioridade[item["categoria"]] >= prioridade[atual["categoria"]]:
        saida[chave] = item


def validar_registro(arquivo: str, linha: int, r: dict[str, str]) -> list[dict]:
    saida = {}
    for campo in sorted(OBRIGATORIOS):
        if not r[campo]:
            adicionar(saida, resultado("erro_confirmado", arquivo, linha, r, campo,
                "Schema 22", f"ausencia:{campo}", "Campo obrigatório vazio."))
    if r["data_publicacao"]:
        try:
            datetime.strptime(r["data_publicacao"], "%Y-%m-%d")
        except ValueError:
            adicionar(saida, resultado("erro_confirmado", arquivo, linha, r,
                "data_publicacao", "Schema 22", "formato:data_publicacao",
                "Data inválida ou fora de YYYY-MM-DD."))

    for campo, permitidos in VOCABULARIOS.items():
        valor = r[campo]
        if not valor or valor in permitidos:
            continue
        destino = ALIASES.get(campo, {}).get(valor)
        categoria = "normalizacao_deterministica" if destino else "revisao_semantica"
        adicionar(saida, resultado(categoria, arquivo, linha, r, campo,
            "Vocabulário v10.5", f"classificacao:{campo}",
            "Alias legado com destino inequívoco." if destino else "Valor não canônico sem destino inequívoco.",
            destino or ""))

    if not r["dimensao_analitica"]:
        adicionar(saida, resultado("revisao_semantica", arquivo, linha, r,
            "dimensao_analitica", "R17", "excecao:r17",
            "Confirmar se o evento é puramente narrativo."))
    if r["dimensao_analitica"] == "multidimensional" and not r["nota_analista"]:
        adicionar(saida, resultado("erro_confirmado", arquivo, linha, r,
            "nota_analista", "R05", "integridade:r05", "Justificativa obrigatória ausente."))

    camada, codigo, papel = r["tipo_camada"], r["codigo_variavel"], r["papel_no_ciclo"]
    if camada in {"PRESSAO_SOCIAL", "CONTEXTO"} and codigo != "SMIDS_EXT":
        adicionar(saida, resultado("normalizacao_deterministica", arquivo, linha, r,
            "codigo_variavel", "R18", "classificacao:codigo_variavel",
            "Camada exige SMIDS_EXT.", "SMIDS_EXT"))
    if codigo == "SMIDS_EXT":
        for campo in ("tipo_camada", "dimensao_analitica", "observacao", "entra_ipst"):
            if not r[campo]:
                adicionar(saida, resultado("erro_confirmado", arquivo, linha, r, campo,
                    "R18", f"integridade:r18:{campo}", "Campo obrigatório com SMIDS_EXT."))
    if camada == "GOVERNANCA" and codigo not in {"GOV_MUNICIPAL", "GOV_ESTADUAL", "GOV_FEDERAL"}:
        adicionar(saida, resultado("revisao_semantica", arquivo, linha, r,
            "codigo_variavel", "Seções 3 e 6", "classificacao:codigo_variavel",
            "Determinar a esfera de governo antes de escolher GOV_*."))
    if camada == "PRESSAO_SOCIAL" and papel not in {"emergencia", "agravamento"}:
        adicionar(saida, resultado("revisao_semantica", arquivo, linha, r,
            "papel_no_ciclo", "R19", "classificacao:papel_no_ciclo",
            "Escolher emergência ou agravamento."))
    if camada == "GOVERNANCA" and papel == "resposta":
        adicionar(saida, resultado("revisao_semantica", arquivo, linha, r,
            "papel_no_ciclo", "R22", "revisao:r22",
            "Alerta: confirmar pressão identificável como gatilho."))
    if (camada == "PRESSAO_SOCIAL" and r["nivel_criticidade"] == "alerta"
            and r["observacao"] == "dado_auditavel" and r["entra_ipst"] != "sim"):
        adicionar(saida, resultado("normalizacao_deterministica", arquivo, linha, r,
            "entra_ipst", "Condição A", "classificacao:entra_ipst",
            "Condição A exige sim.", "sim"))

    texto = " ".join((r["titulo"], r["nota_analista"], r["observacao"])).lower()
    if r["tipo_relacao_variavel"] in {"contextual", "contexto", "nao_aplicavel"} and re.search(
        r"\b(morte|morto|morta|homic[ií]dio|feminic[ií]dio|arma de fogo|risco grave)\b", texto):
        adicionar(saida, resultado("revisao_semantica", arquivo, linha, r,
            "tipo_relacao_variavel", "R21", "classificacao:tipo_relacao_variavel",
            "Possível violência letal não pode permanecer contextual."))
    if r["fonte"] and r["fonte"] != "Tribuna Liberal":
        adicionar(saida, resultado("revisao_semantica", arquivo, linha, r,
            "fonte", "R12", "fonte:r12", "Confirmar fonte excepcional."))
    return list(saida.values())


def validar_ids(registros: list[tuple[str, int, dict]]) -> list[dict]:
    grupos = defaultdict(list)
    for arquivo, linha, registro in registros:
        if registro["id_evento"]:
            grupos[registro["id_evento"]].append((arquivo, linha, registro))
    saida = []
    for identificador, itens in grupos.items():
        if len(itens) > 1:
            arquivos = sorted({x[0] for x in itens})
            base = {"id_evento": identificador}
            saida.append(resultado("erro_confirmado", " | ".join(arquivos), "",
                base, "id_evento", "Schema 22", f"duplicidade:id:{identificador}",
                "Identificador global repetido; gerar IDs únicos.", afetados=len(itens)))
    return saida


def validar_ciclos(registros: list[tuple[str, int, dict]]) -> tuple[list[dict], list[dict]]:
    grupos = defaultdict(list)
    for arquivo, linha, r in registros:
        ciclo = r["id_caso_pressao"].strip()
        if ciclo:
            grupos[ciclo].append((arquivo, linha, r))
    revisoes, estatisticas = [], []
    for ciclo, itens in sorted(grupos.items()):
        datas = sorted({
            r["data_publicacao"] for _, _, r in itens
            if re.fullmatch(r"\d{4}-\d{2}-\d{2}", r["data_publicacao"])
            and _data_valida(r["data_publicacao"])
        })
        placeholders = {"", "regional", "nao_identificado", "nao_aplicavel", "vazio", "nulo"}
        locais = {
            r["localidade"] for _, _, r in itens
            if r["localidade"].strip().casefold() not in placeholders
        }
        papeis = Counter(r["papel_no_ciclo"] for _, _, r in itens)
        criterios = {
            "recorrencia": len(itens) > 1,
            "territorializacao": bool(locais),
            "escalada": papeis["agravamento"] > 0,
            "persistencia": len(datas) > 1 and datas[0][:7] != datas[-1][:7],
            "pressao_institucional": any(r["tipo_camada"] == "GOVERNANCA" and r["papel_no_ciclo"] == "resposta" for _, _, r in itens),
        }
        indicios = sum(criterios.values())
        formato = bool(re.fullmatch(r"[A-Z0-9]+(?:_[A-Z0-9]+)+_\d{4}", ciclo))
        estatisticas.append({"id_caso_pressao": ciclo, "registros": len(itens),
            "data_inicial": datas[0] if datas else "", "data_final": datas[-1] if datas else "",
            "localidades_distintas": len(locais), "indicios_automaticos": indicios,
            **{k: "sim" if v else "nao" for k, v in criterios.items()},
            "formato_valido": "sim" if formato else "nao"})
        categoria = "normalizacao_deterministica" if ciclo in {"nao_aplicavel", "REVISAR"} else "revisao_semantica"
        proposto = "" if categoria == "normalizacao_deterministica" else ""
        revisoes.append(resultado(categoria, "AGREGADO_POR_CICLO", "", {"id_evento": "", "id_caso_pressao": ciclo},
            "id_caso_pressao", "R28", f"ciclo:r28:{ciclo}",
            f"Revisar uma vez o ciclo: {len(itens)} registros e {indicios}/5 indícios automáticos; encadeamento causal não é automatizado.",
            proposto, len(itens)))
    return revisoes, estatisticas


def _data_valida(valor: str) -> bool:
    try:
        datetime.strptime(valor, "%Y-%m-%d")
        return True
    except ValueError:
        return False
