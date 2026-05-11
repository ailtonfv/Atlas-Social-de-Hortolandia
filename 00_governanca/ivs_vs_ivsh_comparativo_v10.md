[ivs_vs_ivsh_comparativo_v10.md](https://github.com/user-attachments/files/27607698/ivs_vs_ivsh_comparativo_v10.md)
# IVS × IVS-H — Comparativo das 16 Variáveis de Vulnerabilidade Social

**Arquivo:** `00_governanca/ivs_vs_ivsh_comparativo.md`  
**Versão:** v10  
**Data:** "11/05/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia

---

> **Escopo deste documento:** Registro histórico e narrativo da construção metodológica do IVS-H. Inclui resultados operacionais da Fase 1 MVP, pesos hipotéticos e estado das variáveis. O conteúdo permanente foi extraído para o repositório core — ver seção abaixo.

---

## Conteúdo migrado para o core

Os documentos abaixo integram o núcleo metodológico permanente do Atlas Social e estão versionados no repositório `Atlas-Social-de-Hortolandia-core`:

| Arquivo no core | Conteúdo extraído deste documento |
|---|---|
| `metodologia/metodologia_ivsh.md` | Ecossistema analítico, 16 variáveis, pesos por dimensão, conclusão estratégica |
| `outputs_privados/resultados_mvp_2025_12.md` | RT_01, RT_04, CH_06 — resultados calculados sobre CadÚnico dez/2025 |

> O repositório core é privado. O conteúdo aqui permanece como registro histórico completo e rastreável.

---

## ⚠️ Nota Metodológica — Fase do Projeto

Para o MVP (Fase 1), o IVS-H será calculado com base na metodologia original do IPEA,
garantindo comparabilidade nacional e execução imediata.

> ⚠️ Dados do CadÚnico representam apenas a população cadastrada, não a população
> total do município. Isso não é limitação — toda pessoa flagada já está dentro
> do alcance da política municipal.

---

## Nota Arquitetural — Três Instrumentos Complementares

| Instrumento | O que mede | Base | Natureza |
|-------------|------------|------|----------|
| **IVS-H** | Vulnerabilidade estrutural da população | CadÚnico + IBGE | Quantitativo |
| **IPST-H** | Pressão mensurável sobre o Estado — sobrecarga da rede, lacunas de cobertura | Dados administrativos | Quantitativo |
| **IPSO-H** | Pressão social observada — o que está acontecendo agora | Corpus jornalístico (Tribuna Liberal) | Qualitativo / narrativo |

> "O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde ela se transforma em pressão
> mensurável sobre o Estado. O IPSO-H mostra o que está acontecendo agora."

**Os três instrumentos não se mesclam metodologicamente.** A integração é narrativa:
o IPSO-H valida qualitativamente o que o IVS-H e o IPST-H medem em bases quantitativas.

**Matriz de interpretação — IVS-H × IPST-H:**

| IVS | IPST | Interpretação |
|-----|------|---------------|
| Alto | Alto | Alta vulnerabilidade + Estado pressionado |
| Alto | Baixo | Vulnerabilidade alta, rede ainda absorvendo |
| Baixo | Alto | Pressão operacional (fluxo / mobilidade / rede insuficiente) |
| Baixo | Baixo | Situação estável |

> IPST-H: `01_modelagem_conceitual/ipst_h_modelo_v01.md` (a produzir).
> IPSO-H: `00_governanca/corpus_jornalistico/README_corpus_v1.5.md`.
> Detalhamento técnico de fontes: `arquitetura_dados_IVS_IBGE_Horto.md`.

---

## 📘 As 16 Variáveis — Escopo Completo do IVS-H

### 🔹 Dimensão 1 — Infraestrutura Urbana (IU)

Peso IVS-H: **~15–20%** | Peso IPEA: 33%

> Infraestrutura de Hortolândia é predominantemente adequada no município agregado.
> O poder discriminatório de IU é **territorial** — concentra-se nos aglomerados subnormais.
> Ver Seção 6.1.7 do arquivo de arquitetura.

| Código | Variável | Fonte IVS-H | Fase | Status |
|--------|----------|-------------|------|--------|
| IU_01 | Água/esgoto inadequados | IBGE Censo 2022 — domicilio1/2/3 | Fase 2 | pendente (dicionário a mapear) |
| IU_02 | Ausência de coleta de lixo | IBGE Censo 2022 — domicilio1/2/3 | Fase 2 | pendente (dicionário a mapear) |
| IU_03 | Baixa renda + deslocamento > 1h | IBGE Censo 2022 — SIDRA Tab. 10330 | Fase 2 | proxy disponível (RT_mobilidade_pendular_longa = 12,7%) |

---

### 🔹 Dimensão 2 — Capital Humano (CH)

Peso IVS-H: **~40–45%** | Peso IPEA: 33%

> CH é o principal vetor de vulnerabilidade em Hortolândia.
> Dados históricos IPEA: CH caiu de 0,445 (2000) para 0,258 (2010) — maior melhora entre as dimensões.
> Justificativa empírica para peso elevado no IVS-H.

| Código | Variável | Fonte IVS-H | Fase | Status |
|--------|----------|-------------|------|--------|
| CH_01 | Mortalidade infantil | SIM/DATASUS | Fase 2 | pendente — integração Secretaria de Saúde (Renato) |
| CH_02 | Crianças 0–5 fora da escola | IBGE Censo 2022 — demografia | Fase 2 | pendente (dicionário a mapear) |
| CH_03 | Crianças 6–14 fora da escola | IBGE Censo 2022 — demografia | Fase 2 | pendente (dicionário a mapear) |
| CH_04 | Gravidez na adolescência (mães 10–17) | SIM/DATASUS | Fase 2 | pendente — integração Secretaria de Saúde |
| CH_05 | Mães chefes com baixa escolaridade | **CadÚnico** | **Fase 1** | ✅ variável identificada — aguarda cálculo |
| CH_06 | Analfabetismo (15+) | **CadÚnico** | **Fase 1** | ✅ **CALCULADO** — ver Seção de Resultados |
| CH_07 | Baixa escolaridade no domicílio | **CadÚnico** | **Fase 1** | ✅ variável identificada — aguarda cálculo |
| CH_08 | Jovens nem-nem com baixa renda | CadÚnico + CAGED | Fase 2 | pendente — requer cruzamento com CAGED |

---

### 🔹 Dimensão 3 — Renda e Trabalho (RT)

Peso IVS-H: **~35–40%** | Peso IPEA: 33%

> RT é a tensão socioeconômica central de Hortolândia.
> O município integra o Arranjo Populacional de Campinas (integração 0,42) —
> renda, emprego e mobilidade atravessam fronteiras municipais.

| Código | Variável | Fonte IVS-H | Fase | Status |
|--------|----------|-------------|------|--------|
| RT_01 | Renda per capita ≤ 1/2 SM | **CadÚnico** | **Fase 1** | ✅ **CALCULADO** — **58,8%** das famílias cadastradas |
| RT_02 | Desocupação | CadÚnico + CAGED | Fase 2 | pendente |
| RT_03 | Informalidade + baixa escolaridade | CadÚnico + CAGED | Fase 2 | pendente |
| RT_04 | Baixa renda + presença de idoso (≥60) | **CadÚnico** | **Fase 1** | ✅ **CALCULADO** — ver Seção de Resultados |
| RT_05 | Trabalho infantil | CadÚnico / Conselho Tutelar | Fase 2 | pendente |

> **RT_04 — Interpretação:**
> Captura famílias de baixa renda com presença de idoso, indicando maior necessidade
> de cuidados e pressão sobre serviços públicos. Não pressupõe dependência econômica do idoso.

> **Nota — Mobilidade Pendular:**
> As variáveis RT_mobilidade_pendular_saida (~62% proxy) e RT_mobilidade_pendular_longa (12,7%)
> pertencem à dimensão RT — não são variáveis das 16 originais do IPEA, mas complementos
> metodológicos do IVS-H para capturar a dinâmica metropolitana de Hortolândia.
> Detalhamento em `arquitetura_dados_IVS_IBGE_Horto.md`, Seção 2.1.

---

## 📊 Estado da Fase 1 MVP

**Período de referência:** CadÚnico `2025_12`
**Registros disponíveis:** 72.424 indivíduos | 211 colunas
**Bloqueio crítico:** linkage endereço → loteamento (DE-PARA CEP → `cod_loteamento`)

| Variável | Cálculo municipal | Cálculo por loteamento |
|----------|-------------------|------------------------|
| RT_01 | ✅ **58,8%** calculado | 🔴 bloqueado — aguarda linkage |
| RT_04 | ✅ **8,12%** calculado | 🔴 bloqueado — aguarda linkage |
| CH_05 | ⏳ aguarda cálculo | 🔴 bloqueado — aguarda linkage |
| CH_06 | ✅ **8,69%** calculado | 🟡 proxy por `d.nom_localidade_fam` disponível — ver nota |
| CH_07 | ⏳ aguarda cálculo | 🔴 bloqueado — aguarda linkage |

> **Nota CH_06 territorial:** matching fuzzy entre `d.nom_localidade_fam` (CadÚnico) e
> `descbairro` (loteamentosregiao.xls) produziu ranking por loteamento com 97,3% de cobertura
> (4.394 de 4.516 analfabetos identificados). Resultado válido como proxy — não substitui
> o linkage oficial por `cod_loteamento`.

---

## 📋 Resultados Calculados — Fase 1 MVP

### RT_01 — Renda per capita ≤ ½ SM

| Métrica | Valor |
|---|---|
| % famílias com renda per capita ≤ R$ 759,00 | **58,8%** |
| Referência: ½ SM (dez/2025) | R$ 759,00 |
| Fonte | `d.vlr_renda_media_fam` ≤ 759 |
| Período | CadÚnico dez/2025 |

**Complemento analítico:**
- 6.259 famílias com renda declarada igual a zero — desatualização cadastral ou ausência real de renda

---

### RT_04 — Baixa renda + presença de idoso (≥ 60)

| Métrica | Valor |
|---|---|
| % famílias com renda ≤ ½ SM e pelo menos um idoso | **8,12%** |
| Total de famílias estimadas | ~2.465 famílias |
| Fonte | `d.vlr_renda_media_fam` ≤ 759 + `p.idade_memb` ≥ 60 |
| Período | CadÚnico dez/2025 |

---

### CH_06 — Analfabetismo (15 anos ou mais)

| Métrica | Valor |
|---|---|
| Taxa de analfabetismo 15+ | **8,69%** |
| Total de analfabetos 15+ | 4.516 pessoas |
| Total de pessoas 15+ no CadÚnico | 51.983 |
| Fonte | `p.cod_sabe_ler_escrever_memb` == 2 |
| Referência nacional (PNAD 2024) | Brasil 5,3% / Sudeste 2,8% |
| Período | CadÚnico dez/2025 |

**Recorte etário:**

| Faixa | Analfabetos | Taxa |
|---|---|---|
| 15–59 anos (produtiva) | 2.348 | 5,87% |
| 60+ anos (idosos) | 2.168 | — |

**Recorte de gênero:**

| Grupo | Pessoas | % |
|---|---|---|
| Mulheres | **2.608** | 57,7% |
| Homens | 1.912 | 42,3% |

**Trajetória escolar:**

| Trajetória | Pessoas |
|---|---|
| Nunca foram à escola | 1.953 |
| Foram à rede pública e saíram analfabetos | 929 |
| Foram à rede particular e saíram analfabetos | 25 |
| Frequentaram mas saíram sem aprender (código 3) | 1.609 |
| **Total** | **4.516** |

> 2.538 pessoas passaram por alguma escola e continuam analfabetas.

**Distribuição territorial — Top 10 loteamentos (proxy `d.nom_localidade_fam`):**

| Loteamento | Analfabetos | codbairro | RP |
|---|---|---|---|
| Jardim Amanda | **1.045** | 351 | 3 |
| Jardim Boa Vista | 231 | 72 | 3 |
| Novo Ângulo | 173 | 307 | 5 |
| Jardim Nova Hortolândia | 140 | 319 | 6 |
| Jardim Nova Europa | 130 | 360 | 5 |
| Jardim N. Sra. Auxiliadora | 130 | 321 | 6 |
| Jardim Primavera | 114 | 372 | 6 |
| Jardim Santa Clara do Lago | 107 | 317 | 2 |
| Vila Real Continuação | 100 | 64 | 6 |
| Jardim Nova América I | 94 | 358 | 5 |

> Jardim Amanda + Jardim Boa Vista (RP 3) = 1.276 analfabetos = 29,1% do total municipal.
> Cobertura: 4.394 de 4.516 analfabetos com loteamento identificado (97,3%).
> Não matched: Jardim Brasil, Jardim Monte Sinai (irregular), Taquara Branca — 122 pessoas.

**Cruzamentos de vulnerabilidade:**

| Cruzamento | Pessoas | Interpretação |
|---|---|---|
| Analfabetos 15+ em famílias com renda zero | **565** | 12,5% dos analfabetos — dupla invisibilidade |
| Idosos analfabetos com renda ≤ ½ SM | **474** | 21,9% dos idosos analfabetos |
| Idosos analfabetos, pobres, sem BPC nem BF | **298** | Núcleo mais crítico — fora da rede de proteção |

> **298 pessoas** — idosas, analfabetas, pobres e sem acesso a nenhum benefício social.
> O Estado não as alcança. E elas não conseguem chegar ao Estado.

---

## Resumo Executivo por Dimensão

| Dimensão | Peso IVS-H | Peso IPEA | Justificativa |
|----------|------------|-----------|---------------|
| Infraestrutura Urbana | ~15–20% | 33% | Cobertura municipal adequada — poder discriminatório territorial |
| Capital Humano | ~40–45% | 33% | Principal vetor — maior variação histórica (2000→2010) |
| Renda e Trabalho | ~35–40% | 33% | Tensão central — mobilidade pendular amplifica vulnerabilidade |

> 💡 A vulnerabilidade em Hortolândia é predominantemente socioeconômica, não infraestrutural.
> A exceção crítica está nos aglomerados subnormais — ver Seção 6.1.7 do arquivo de arquitetura.

---

## Conclusão Estratégica

O IVS-H permite:
- identificar **onde** atuar (território)
- identificar **para quem** atuar (família / grupo)
- orientar **qual política** aplicar (dimensão)

> O índice não apenas mede vulnerabilidade — orienta decisão.
> O IVS-H sozinho é diagnóstico. O IVS-H + IPST-H é gestão. O IVS-H + IPST-H + IPSO-H é inteligência institucional.

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01–v06 | "03/2026" | Versões iniciais — estruturação das variáveis e pesos |
| v07 | "30/04/2026" | Inclusão da lista completa das 16 variáveis; ajuste RT_04; nota IPST-H |
| v08 | "04/05/2026" | Tabela de variáveis expandida; RT_01 confirmado (~60,5%); arquitetura de três instrumentos |
| v09 | "08/05/2026" | Resultados calculados incorporados: RT_01, RT_04, CH_06 com detalhamento completo; núcleo crítico formalizado (298 idosos analfabetos pobres sem BPC/BF) |
| v10 | "11/05/2026" | Cabeçalho de escopo adicionado; seção "Conteúdo migrado para o core" incluída; referência ao arquivo de arquitetura atualizada para versão sem sufixo |

---

*Documento de governança — 00_governanca/*
*Atlas Social de Hortolândia — uso interno*
