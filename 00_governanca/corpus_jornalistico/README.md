# 📰 CORPUS_JORNALISTICO — Evidências Empíricas da Vulnerabilidade Social

**Versão:** v1.1
**Data de atualização:** 2026-04-13
**Responsável:** Ailton Vendramini
**Repositório:** Atlas-Social-de-Hortolândia

---

## 🎯 Objetivo

Este diretório reúne registros estruturados de notícias locais com o objetivo de:

* Capturar **eventos reais** relacionados à vulnerabilidade social;
* Complementar os indicadores estruturais do IVS-H;
* Apoiar a construção do **IPST-H (Índice de Pressão Social Territorial)**.

---

## 🧠 Princípio Conceitual

> **O IVS mede condições estruturais.
> O corpus jornalístico registra manifestações da vulnerabilidade.**

---

## 🧱 Estrutura dos dados

Principais campos:

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

* `infraestrutura_urbana` (IU)
* `capital_humano` (CH)
* `renda_trabalho` (RT)
* `multidimensional`

---

### 2. Uso do campo `codigo_variavel`

> ⚠️ Este campo **não representa necessariamente uma medição direta**.

Ele pode assumir dois papéis:

* **Direta** → variável efetivamente medida pelo evento
* **Associada** → variável potencialmente relacionada ao evento

---

### 3. Tipo de relação com a variável (`tipo_relacao_variavel`)

Campo central da metodologia:

* `direta` → evento mede a variável IVS
* `proxy` → evento indica fortemente a variável
* `contextual` → evento revela ambiente de vulnerabilidade
* `alerta` → evento extremo de alto impacto social

---

## 📌 Regras operacionais (uso combinado)

| Tipo de relação | Uso de `codigo_variavel`                 |
| --------------- | ---------------------------------------- |
| direta          | Obrigatório (1 variável)                 |
| proxy           | Recomendado (1 variável provável)        |
| contextual      | Opcional (1 ou mais variáveis possíveis) |
| alerta          | Opcional (uso com cautela)               |

---

## 📊 Exemplos práticos

### 🟡 Exemplo 1 — Indicador agregado (proxy)

**Evento:**
94 medidas protetivas em jan–fev

**Classificação:**

* `dimensao_ivs`: capital_humano
* `codigo_variavel`: CH_05 *(exemplo de associação — fragilidade familiar)*
* `tipo_relacao_variavel`: proxy
* `tipo_evento`: indicador
* `gravidade`: alta
* `polaridade_evento`: negativo

**Interpretação:**

> O evento não mede diretamente a variável, mas indica risco relevante associado à dimensão.

---

### 🔴 Exemplo 2 — Evento extremo (alerta)

**Evento:**
Caso Nicolly (violência envolvendo adolescentes)

**Classificação:**

* `dimensao_ivs`: capital_humano
* `codigo_variavel`: CH_03, CH_07 *(associação possível)*
* `tipo_relacao_variavel`: alerta
* `tipo_evento`: caso_individual
* `gravidade`: alta
* `polaridade_evento`: negativo

**Interpretação:**

> Evento crítico que revela ambiente de vulnerabilidade, sem medir diretamente uma variável específica.

---

### 🟢 Exemplo 3 — Relação direta (hipotético)

**Evento:**
Relatório oficial aponta taxa de analfabetismo de 12%

**Classificação:**

* `dimensao_ivs`: capital_humano
* `codigo_variavel`: CH_06
* `tipo_relacao_variavel`: direta
* `tipo_evento`: indicador
* `gravidade`: média
* `polaridade_evento`: negativo

**Interpretação:**

> O evento mede diretamente a variável do IVS.

---

## ⚠️ Erros comuns

❌ Forçar correspondência direta com variável IVS
❌ Classificar todos os eventos como “direta”
❌ Omitir `tipo_relacao_variavel`
❌ Confundir evento com indicador estruturado

---

## 📊 Interpretação Analítica

O corpus permite identificar:

* Pressão social por dimensão IVS
* Concentração territorial de eventos
* Sinais antecipados de vulnerabilidade

---

## 🔗 Integração com o IVS-H

* IVS-H → **estoque estrutural de vulnerabilidade**
* Corpus jornalístico → **fluxo de manifestações sociais**

Essa integração fundamenta o:

> **IPST-H — Índice de Pressão Social Territorial**

---

## 📚 Referências

* Instituto de Pesquisa Econômica Aplicada (IPEA). *Atlas da Vulnerabilidade Social*
* Schrodt, P. (2012). *Event Data Analysis*
* Lazer et al. (2009). *Computational Social Science*

---

## 🧭 Observação Final

> Este corpus transforma notícias em evidência estruturada.

Sua força está não apenas na coleta, mas na **consistência da classificação ao longo do tempo**.

---
