# 📄 NT_001 — Crescimento do CadÚnico vs População Total

**Projeto:** Atlas Social de Hortolândia
**Versão:** v01
**Data:** 26/03/2026
**Responsável:** Ailton Vendramini

---

## 🎯 Objetivo

Analisar a relação entre o crescimento da população total do município e a evolução do número de pessoas cadastradas no CadÚnico, com o objetivo de identificar possíveis tendências estruturais de vulnerabilidade social.

---

## 📊 Hipótese de trabalho

> Se o crescimento do número de pessoas no CadÚnico for superior ao crescimento da população total, pode haver aumento relativo da vulnerabilidade social ou mudança na capacidade de identificação dessa população pelo Estado.

---

## 📥 Fontes de dados

* População total: IBGE (Censo 2022 e estimativas intercensitárias)
* Base social: CadÚnico (bases municipais)

---

## 📐 Metodologia proposta

1. Construir série temporal anual com:

   * população total
   * número de pessoas no CadÚnico

2. Calcular:

   ```text
   percentual_cadunico = cadunico / população_total
   ```

3. Gerar:

   * gráfico de evolução absoluta (população vs CadÚnico)
   * gráfico de proporção (% CadÚnico)

---

## ⚠️ Limitações

* O CadÚnico não representa exclusivamente população em situação de pobreza
* A renda é autodeclarada
* O crescimento pode refletir:

  * aumento da vulnerabilidade
  * melhoria da busca ativa
  * incentivos institucionais ao cadastro

---

## 🧠 Interpretação analítica

O crescimento do CadÚnico deve ser interpretado como:

> um indicador combinado de vulnerabilidade social e capacidade estatal de identificação dessa vulnerabilidade

---

## 🚨 Risco estrutural identificado

> Crescimento contínuo do CadÚnico acima da população pode indicar tendência de saturação do sistema de proteção social, exigindo revisão de políticas públicas e critérios de elegibilidade.

---

## 📌 Próximos passos

* Comparar percentual com municípios similares da região
* Cruzar com dados de emprego formal (CAGED)
* Avaliar distribuição por núcleo (análise territorial)
* Monitorar permanência no CadÚnico ao longo do tempo

---

## 🧠 Observação final

> “O Atlas Social não mede apenas vulnerabilidade.
> Ele mede a relação entre vulnerabilidade, capacidade do Estado e qualidade do dado.”
