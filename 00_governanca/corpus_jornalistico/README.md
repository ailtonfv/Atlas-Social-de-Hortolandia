# 📰 CORPUS_JORNALISTICO — Evidências Empíricas da Vulnerabilidade Social

**Versão:** v1.0
**Data de criação:** 2026-04-13
**Responsável:** Ailton Vendramini
**Repositório:** Atlas-Social-de-Hortolândia

---

## 🎯 Objetivo

Este diretório reúne registros estruturados de notícias locais (principalmente da *Tribuna Liberal*) com o objetivo de:

* Capturar **eventos reais** relacionados à vulnerabilidade social;
* Complementar os indicadores estruturais do IVS-H;
* Apoiar a construção do **IPST-H (Índice de Pressão Social Territorial)**.

---

## 🧠 Princípio Conceitual

> **O IVS mede condições estruturais.
> O corpus jornalístico registra manifestações da vulnerabilidade.**

Essa base não substitui indicadores oficiais — ela os complementa, oferecendo uma leitura dinâmica e territorial da realidade social.

---

## 🧱 Estrutura dos dados

Cada registro contém, entre outros, os seguintes campos:

* `fonte`
* `data`
* `dimensao_ivs`
* `codigo_variavel`
* `tipo_relacao_variavel`
* `resumo`
* `tipo_evento`
* `gravidade`
* `polaridade_evento`
* `cod_loteamento`
* `nivel_confianca_loteamento`

---

## 🔎 Metodologia de Classificação

### 1. Dimensão IVS

Cada evento deve ser classificado em uma das dimensões:

* `infraestrutura_urbana` (IU)
* `capital_humano` (CH)
* `renda_trabalho` (RT)
* `multidimensional`

---

### 2. Código de Variável IVS

O campo `codigo_variavel` deve ser utilizado **apenas quando houver correspondência direta** com uma variável do IVS.

> ⚠️ Evitar forçar associações indiretas.

---

### 3. Tipo de Relação com a Variável

Campo crítico para interpretação:

* `direta` → evento mede a variável IVS
* `proxy` → evento indica fortemente a variável
* `contextual` → evento revela ambiente de vulnerabilidade
* `alerta` → evento extremo de alto impacto social

---

### 4. Tipo de Evento

* `problema`
* `caso_individual`
* `politica_publica`
* `indicador`

---

### 5. Gravidade

* `baixa`
* `media`
* `alta`

Critérios:

* impacto social
* recorrência
* risco associado

---

### 6. Polaridade

* `positivo`
* `negativo`

> ⚠️ Classificar como positivo apenas quando houver melhoria concreta.

---

## 📊 Interpretação Analítica

O corpus jornalístico permite identificar:

* Concentração de eventos por dimensão IVS;
* Padrões territoriais emergentes;
* Pressões sociais não capturadas por dados estruturais.

---

## 🔗 Integração com o IVS-H

* O IVS-H representa o **estoque de vulnerabilidade**;
* O corpus jornalístico representa o **fluxo de eventos sociais**.

Essa integração fundamenta o desenvolvimento do:

> **IPST-H — Índice de Pressão Social Territorial**

---

## ⚠️ Limitações

* Viés editorial (notícias tendem a destacar eventos extremos);
* Cobertura incompleta do território;
* Dependência de fontes jornalísticas específicas.

---

## ✅ Boas práticas

* Manter consistência na classificação;
* Revisar amostras periodicamente;
* Evitar sobreinterpretação de eventos isolados;
* Documentar casos ambíguos.

---

## 📚 Referências

* Instituto de Pesquisa Econômica Aplicada (IPEA). *Atlas da Vulnerabilidade Social*
* Schrodt, P. (2012). *Event Data Analysis*
* Lazer et al. (2009). *Computational Social Science*

---

## 🧭 Observação Final

> Este corpus não é apenas uma base de dados.
> É um instrumento de leitura da realidade social em tempo quase real.

Sua correta utilização permite antecipar tendências, identificar pressões territoriais e apoiar decisões estratégicas no âmbito das políticas públicas.

---
