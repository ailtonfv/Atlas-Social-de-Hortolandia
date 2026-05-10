# Análise — Mídia

## Objetivo
Produzir insights analíticos a partir do corpus jornalístico consolidado.

## Entrada
`outputs/tabelas/corpus_consolidado.csv` — gerado pela etapa Exploração.

## O que acontece aqui

- Análise de ciclos de pressão social — trajetória, duração, desfecho
- Distribuição territorial por loteamento e Região de Planejamento
- Construção do painel IPST-H (Índice de Pressão Social Territorial)
- Identificação de padrões temporais — sazonalidade, agravamentos recorrentes
- Cruzamentos entre `tipo_camada`, `dimensao_analitica` e `papel_no_ciclo`

## Notebooks previstos

| Arquivo | Status | Descrição |
|---|---|---|
| `02_analise_ciclos_pressao.ipynb` | ⏳ a criar | Trajetória dos ciclos ativos |
| `03_analise_territorial.ipynb` | ⏳ a criar | Pressão por loteamento e RP |
| `04_painel_ipst_h.ipynb` | ⏳ a criar | Painel gerencial IPST-H |

## Observação

Esta etapa **não altera os CSVs** — apenas analisa e gera outputs.
Resultados vão para `outputs/tabelas/` e `outputs/graficos/`.

---
*Schema ativo: v10.4 — 20 colunas | Entrada: outputs/tabelas/corpus_consolidado.csv*
