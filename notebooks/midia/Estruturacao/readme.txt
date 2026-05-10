# Estruturação — Mídia

## Objetivo
Scripts de governança, manutenção e migração do corpus jornalístico.

## O que acontece aqui

- Scripts de migração de schema (v0/v1/v3 → v10.4)
- Normalização de valores: `municipio`, `dimensao_analitica`, `tipo_relacao_variavel`
- Validação de integridade dos CSVs
- Utilitários de manutenção do corpus

## Status atual

A migração para **v10.4 foi concluída em 09/05/2026** — todos os 97 arquivos estão no schema correto.

Scripts desta pasta são executados **sob demanda**, não na rotina analítica.

## Observação

Esta pasta não faz parte do pipeline principal de análise.
É a oficina de manutenção do corpus — usada quando há mudança de schema ou correção em lote.

---
*Schema ativo: v10.4 — 20 colunas | Migração concluída: 09/05/2026*
