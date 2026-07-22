"""Orquestração da auditoria v10.5."""

import argparse
import csv
import hashlib
from pathlib import Path

from .regras import validar_ciclos, validar_ids, validar_registro
from .relatorios import gerar
from .variantes import identificar, mapear, plano


def sha256(arquivo: Path) -> str:
    digest = hashlib.sha256()
    with arquivo.open("rb") as entrada:
        for bloco in iter(lambda: entrada.read(1024 * 1024), b""):
            digest.update(bloco)
    return digest.hexdigest()


def ler(arquivo: Path):
    with arquivo.open("r", encoding="utf-8-sig", newline="") as entrada:
        leitor = csv.DictReader(entrada)
        return leitor.fieldnames or [], list(leitor)


def argumentos():
    raiz = Path(__file__).resolve().parents[4]
    parser = argparse.ArgumentParser(description="Validador somente de leitura do corpus v10.5")
    parser.add_argument("--raiz", type=Path, default=raiz)
    parser.add_argument("--saida", type=Path, default=raiz / "outputs" / "validacao_corpus_v10_5")
    return parser.parse_args()


def main() -> int:
    args = argumentos()
    origem = args.raiz / "dados" / "bd_externos" / "imprensa" / "tribuna_liberal"
    saida = args.saida.resolve()
    if saida == origem.resolve() or origem.resolve() in saida.parents:
        raise ValueError("A saída não pode estar dentro da pasta dos CSVs originais.")
    inventario, resultados, transformacoes, registros = [], [], [], []
    planos_vistos = set()
    for arquivo in sorted(origem.glob("*.csv")):
        erro = ""
        try:
            cabecalho, linhas = ler(arquivo)
            variante = identificar(cabecalho)
        except (OSError, UnicodeError, csv.Error) as exc:
            cabecalho, linhas, variante, erro = [], [], None, str(exc)
        inventario.append({"arquivo": arquivo.name, "sha256": sha256(arquivo),
            "bytes": arquivo.stat().st_size, "registros": len(linhas), "colunas": len(cabecalho),
            "variante": variante.codigo if variante else "desconhecida",
            "cabecalho": "|".join(cabecalho), "erro_leitura": erro})
        if not variante:
            continue
        if variante.codigo not in planos_vistos:
            transformacoes.extend(plano(variante, cabecalho))
            planos_vistos.add(variante.codigo)
        for numero, original in enumerate(linhas, 2):
            registro = mapear(original, variante)
            registros.append((arquivo.name, numero, registro))
            resultados.extend(validar_registro(arquivo.name, numero, registro))
    resultados.extend(validar_ids(registros))
    revisoes_ciclos, ciclos = validar_ciclos(registros)
    resultados.extend(revisoes_ciclos)
    unicos = {}
    for item in resultados:
        chave = (item["arquivo"], item["linha"], item["campo"], item["causa_raiz"])
        unicos[chave] = item
    resultados = sorted(unicos.values(), key=lambda x: (x["categoria"], x["arquivo"], str(x["linha"]), x["campo"]))
    texto = gerar(saida, inventario, resultados, transformacoes, ciclos, len(registros))
    print(texto, end="")
    return 0
