# Exploração — Mídia

## Objetivo
Carregar, validar e consolidar o corpus jornalístico do Atlas Social de Hortolândia.

## O que acontece aqui

- Leitura dos 97 CSVs em schema v10.4 (20 colunas) de `dados/bd_externos/series_jornalisticas/`
- Verificação de integridade — período coberto, colunas presentes, registros ignorados
- Distribuições por `tipo_camada`, `dimensao_analitica`, `nivel_criticidade`, `papel_no_ciclo`
- Mapeamento dos ciclos de pressão ativos (`id_caso_pressao`)
- Identificação de eventos que alimentam o IPST-H (`entra_ipst = sim`)
- Exportação de `outputs/tabelas/corpus_consolidado.csv`

## Notebook

| Arquivo | Versão | Descrição |
|---|---|---|
| `01_exploracao_cadunico.ipynb` | v02 | Exploração completa do corpus — schema v10.4 |

## Observação

Esta etapa **não altera os CSVs** — apenas lê, consolida e exporta.
O output `corpus_consolidado.csv` é a entrada para os notebooks em `Análise/`.

---
*Schema ativo: v10.4 — 20 colunas | Fonte: dados/bd_externos/series_jornalisticas/*
