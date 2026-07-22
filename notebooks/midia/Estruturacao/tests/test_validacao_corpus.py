"""Testes de regressão do validador v10.5."""

import sys
import unittest
from pathlib import Path

ESTRUTURACAO = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ESTRUTURACAO))

from validacao_corpus.regras import validar_ciclos, validar_registro  # noqa: E402
from validacao_corpus.schema import SCHEMA  # noqa: E402
from validacao_corpus.variantes import VARIANTES, identificar, mapear  # noqa: E402


def registro_base(**alteracoes):
    registro = {campo: "" for campo in SCHEMA}
    registro.update({
        "id_evento": "TL_20260101_001", "data_publicacao": "2026-01-01",
        "fonte": "Tribuna Liberal", "titulo": "Evento", "pagina": "1",
        "municipio": "Hortolândia", "localidade": "nao_identificado",
        "tipo_camada": "CONTEXTO", "dimensao_analitica": "capital_humano",
        "tipo_relacao_variavel": "contextual", "codigo_variavel": "SMIDS_EXT",
        "nivel_criticidade": "baixa", "observacao": "contexto_sociopolitico",
        "cod_loteamento": "nao_identificado", "nivel_confianca_loteamento": "baixo",
        "papel_no_ciclo": "nao_aplicavel", "entra_ipst": "nao",
    })
    registro.update(alteracoes)
    return registro


class VariantesTest(unittest.TestCase):
    def test_identifica_as_cinco_variantes(self):
        for variante in VARIANTES.values():
            cabecalho = list(variante.mapa) + list(variante.metadados)
            self.assertEqual(identificar(cabecalho).codigo, variante.codigo)

    def test_bom_literal_preserva_id(self):
        variante = VARIANTES["v5_bom_literal"]
        original = {campo: "" for campo in variante.mapa}
        original['\\xEF\\xBB\\xBF"id_evento"'] = "TL_20260705_001"
        self.assertEqual(mapear(original, variante)["id_evento"], "TL_20260705_001")


class CategoriasTest(unittest.TestCase):
    def test_r18_e_normalizacao_deterministica(self):
        itens = validar_registro("a.csv", 2, registro_base(codigo_variavel="SEM_VARIAVEL"))
        r18 = next(x for x in itens if x["regra"] == "R18" and x["campo"] == "codigo_variavel")
        self.assertEqual(r18["categoria"], "normalizacao_deterministica")
        self.assertEqual(r18["valor_proposto"], "SMIDS_EXT")

    def test_r22_e_somente_revisao(self):
        r = registro_base(tipo_camada="GOVERNANCA", codigo_variavel="GOV_MUNICIPAL",
                          papel_no_ciclo="resposta")
        r22 = next(x for x in validar_registro("a.csv", 2, r) if x["regra"] == "R22")
        self.assertEqual(r22["categoria"], "revisao_semantica")

    def test_informativo_exige_revisao(self):
        itens = validar_registro("a.csv", 2, registro_base(nivel_criticidade="informativo"))
        item = next(x for x in itens if x["campo"] == "nivel_criticidade")
        self.assertEqual(item["categoria"], "revisao_semantica")


class CiclosTest(unittest.TestCase):
    def test_r28_agrega_uma_vez_e_ignora_placeholders(self):
        ciclo = "CH_TESTE_2026"
        registros = [
            ("a.csv", 2, registro_base(id_caso_pressao=ciclo, data_publicacao="texto inválido", localidade="Regional")),
            ("b.csv", 2, registro_base(id_evento="TL_2", id_caso_pressao=ciclo,
                                        data_publicacao="2026-01-02", localidade="vazio")),
        ]
        revisoes, estatisticas = validar_ciclos(registros)
        self.assertEqual(len(revisoes), 1)
        self.assertEqual(len(estatisticas), 1)
        self.assertEqual(estatisticas[0]["persistencia"], "nao")
        self.assertEqual(estatisticas[0]["territorializacao"], "nao")


if __name__ == "__main__":
    unittest.main()
