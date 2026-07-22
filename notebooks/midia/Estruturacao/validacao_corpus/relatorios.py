"""Escrita dos relatórios, nunca dos CSVs de origem."""

import csv
from collections import Counter
from pathlib import Path

from .schema import CAMPOS_RESULTADO


def escrever_csv(caminho: Path, campos: list[str], linhas: list[dict]) -> None:
    with caminho.open("w", encoding="utf-8-sig", newline="") as saida:
        escritor = csv.DictWriter(saida, fieldnames=campos, extrasaction="ignore")
        escritor.writeheader()
        escritor.writerows(linhas)


def gerar(pasta: Path, inventario: list[dict], resultados: list[dict],
          transformacoes: list[dict], ciclos: list[dict], total: int) -> str:
    pasta.mkdir(parents=True, exist_ok=True)
    categorias = {
        nome: [r for r in resultados if r["categoria"] == nome]
        for nome in ("erro_confirmado", "normalizacao_deterministica", "revisao_semantica")
    }
    escrever_csv(pasta / "inventario_arquivos.csv",
        ["arquivo", "sha256", "bytes", "registros", "colunas", "variante", "cabecalho", "erro_leitura"], inventario)
    escrever_csv(pasta / "pendencias_validacao.csv", CAMPOS_RESULTADO, resultados)
    for nome, linhas in categorias.items():
        escrever_csv(pasta / f"{nome}.csv", CAMPOS_RESULTADO, linhas)
    escrever_csv(pasta / "plano_transformacao.csv",
        ["variante", "campo_origem", "campo_destino", "acao", "categoria"], transformacoes)
    escrever_csv(pasta / "revisao_ciclos_r28.csv",
        ["id_caso_pressao", "registros", "data_inicial", "data_final", "localidades_distintas",
         "indicios_automaticos", "recorrencia", "territorializacao", "escalada", "persistencia",
         "pressao_institucional", "formato_valido"], ciclos)
    regras = Counter(r["regra"] for r in resultados)
    linhas = [
        "# Resumo executivo — validação do corpus v10.5 (v2)",
        f"- Foram auditados {len(inventario)} CSVs e {total} registros sem alterar as fontes.",
        f"- Erros confirmados: {len(categorias['erro_confirmado'])}.",
        f"- Normalizações determinísticas: {len(categorias['normalizacao_deterministica'])}.",
        f"- Revisões semânticas: {len(categorias['revisao_semantica'])}.",
        f"- R28 foi consolidada em {len(ciclos)} ciclos, uma avaliação por ciclo.",
        f"- Regras mais frequentes após deduplicação: {regras.most_common(5)}.",
        f"- Total após deduplicação por causa-raiz: {len(resultados)} ocorrências.",
        "- Nenhum corpus consolidado foi gerado.",
    ]
    texto = "\n".join(linhas) + "\n"
    (pasta / "resumo_executivo.md").write_text(texto, encoding="utf-8")
    return texto
