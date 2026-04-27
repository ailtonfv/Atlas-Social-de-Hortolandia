# 📊 Metodologia IVS-H (Índice de Vulnerabilidade Social de Hortolândia)

---

## 🧾 Metadados do Documento

- **ID do documento:** IVSH_METODOLOGIA_V01
- **Versão:** v1.0
- **Data de criação:** 2026-04-XX
- **Última atualização:** 2026-04-XX
- **Responsável técnico:** [Ailton Vendramini]
- **Área:** Planejamento / Inclusão Social
- **Status:** Em validação técnica
- **Fonte principal:** IVS – IPEA
- **Bases utilizadas:** CadÚnico (dez/2025)
- **Granularidade:** Pessoa → Família → Loteamento → Núcleo → Região de Planejamento

---

## 🎯 Finalidade

Estabelecer a metodologia de cálculo, interpretação e aplicação do IVS-H, garantindo reprodutibilidade, transparência e alinhamento com o modelo nacional (IPEA).

---

**Referências:**
- COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos
  Municípios Brasileiros*. Brasília: IPEA, 2015.
- FUNARI, A. P. et al. *Atualização do IVS a partir dos dados da PNAD
  Contínua 2022*. Boletim Regional, Urbano e Ambiental, IPEA, 2024.
- IPEA. *Atlas da Vulnerabilidade Social*. ivs.ipea.gov.br
- NARDO, M. et al. *Handbook on Constructing Composite Indicators*.
  Paris: OECD, 2008.

---
# 📊 Metodologia IVS-H (Índice de Vulnerabilidade Social de Hortolândia)

## 1. Princípio Metodológico

O IVS-H (Índice de Vulnerabilidade Social de Hortolândia) segue integralmente a estrutura conceitual do IVS desenvolvido pelo IPEA, preservando suas dimensões, variáveis e lógica de cálculo.

**Diretriz central:**

> O IVS-H não acrescenta nem remove variáveis do modelo original do IPEA. Sua contribuição está na adaptação operacional, na maior granularidade territorial e na atualização temporal.

---

## 2. Estrutura do Índice

O IVS-H mantém as três dimensões clássicas:

* **Infraestrutura Urbana (IU)**
* **Capital Humano (CH)**
* **Renda e Trabalho (RT)**

Cada dimensão é composta pelas variáveis originais do IVS, respeitando:

* definição conceitual
* direção do risco
* forma de cálculo

---

## 3. Unidade de Análise (Ajuste Estrutural)

Para evitar ambiguidades metodológicas, o IVS-H adota explicitamente duas camadas:

* **Unidade de cálculo:** nível em que a variável é originalmente mensurada (ex: pessoa)
* **Unidade de agregação:** nível em que o indicador será analisado (ex: família, loteamento, núcleo)

Exemplo:

| Variável | Unidade de cálculo | Unidade de agregação |
| -------- | ------------------ | -------------------- |
| RT_01    | Pessoa             | Família / Loteamento |

---

## 4. Estratégia de Implementação

O IVS-H será implementado em três fases:

### 🔹 Fase 1 — MVP (Curto Prazo)

* Uso exclusivo de dados disponíveis (CadÚnico)
* Cálculo inicial de variáveis viáveis (ex: RT_01, CH_05, CH_06, CH_07, RT_04)
* Objetivo: gerar primeira leitura consistente da vulnerabilidade

---

### 🔹 Fase 2 — Expansão (Médio Prazo)

* Integração com bases externas:

  * CAGED (emprego formal)
  * CNIS (renda e vínculos)
  * INEP (educação)
  * IBGE (dados censitários)

---

### 🔹 Fase 3 — Calibração (Longo Prazo)

* Ajuste de pesos das dimensões
* Análise de sensibilidade
* Validação empírica com dados locais

---

## 5. Limitações dos Dados

O CadÚnico apresenta limitações estruturais:

* não cobre toda a população
* base declaratória (sujeita a inconsistências)
* atualização heterogênea

**Diretriz:**

> O IVS-H reconhece essas limitações e as incorpora explicitamente na interpretação dos resultados.

---

## 6. Tratamento de Outliers (Ajuste Crítico)

Valores extremos (outliers) não serão removidos automaticamente.

**Procedimento adotado:**

1. Identificação dos valores extremos
2. Análise individual dos casos
3. Classificação:

   * erro de registro
   * valor válido raro
   * inconsistência estrutural
4. Tratamento apenas quando caracterizado erro

Para indicadores contínuos, poderão ser aplicadas:

* limitação de valores extremos (winsorização)
* análises paralelas (com e sem outliers)

---

## 7. Normalização

O IVS-H utiliza normalização min-max:

```text
(valor observado - mínimo) / (máximo - mínimo)
```

A direção do risco será respeitada:

* **maior valor = maior vulnerabilidade**
* ou invertido, conforme variável

**Observação:**

> Valores extremos podem distorcer a escala e devem ser avaliados previamente.

---

## 8. Variáveis (Exemplo Operacional)

### 🔹 RT_01 — Renda per capita até 1/2 salário mínimo

**Definição:**
Percentual de pessoas com renda domiciliar per capita inferior ou igual a meio salário mínimo.

**Cálculo:**

```text
Número de pessoas com renda per capita ≤ 1/2 SM
------------------------------------------------
Total de pessoas
```

**Fonte:**
CadÚnico

**Observação:**
Indicador robusto a outliers, por se tratar de classificação binária.

---

## 9. Limitações Específicas (RT_02 e RT_03)

Indicadores relacionados à informalidade apresentam:

* subestimação estrutural
* dificuldade de mensuração direta

**Diretriz:**

> Devem ser interpretados com cautela e, sempre que possível, complementados com outras fontes.

---

## 10. Interpretação dos Resultados (Nova Seção)

O IVS-H não é apenas um indicador numérico, mas uma ferramenta de leitura territorial.

Exemplos:

* **RT alto:** vulnerabilidade econômica imediata
* **CH alto:** risco de reprodução intergeracional da pobreza
* **IU baixo:** não elimina outras formas de vulnerabilidade

---

## 11. Integração com Políticas Públicas

Diferentes programas públicos atuam sobre dimensões específicas da vulnerabilidade:

* assistência social → famílias vulneráveis
* educação → capital humano
* qualificação → inserção produtiva

**Diretriz central:**

> O desafio não está na ausência de políticas, mas na sua articulação e direcionamento.

---

## 12. Aplicação Estratégica

O IVS-H permite:

* identificar onde atuar
* identificar para quem atuar
* orientar qual política utilizar

---

## 13. Separação Conceitual (IVS-H vs IPST-H)

* **IVS-H:** mede vulnerabilidade estrutural
* **IPST-H:** mede pressão social operacional

Essa separação evita distorções analíticas.

---

## 14. Conclusão

O IVS-H representa uma evolução operacional do IVS tradicional:

* maior granularidade
* maior frequência temporal
* maior aplicabilidade na gestão pública

**Síntese:**

> O IVS-H não é apenas um instrumento de diagnóstico, mas um mecanismo de priorização e organização das políticas públicas.

---
### Fórmulas Operacionais — Capital Humano

**CH_01**
- Numerador: óbitos de crianças menores de 1 ano no loteamento
- Denominador: nascidos vivos no loteamento no mesmo período
- Unidade: taxa por 1.000 nascidos vivos
- Universo: nascidos vivos — DATASUS / Secretaria Municipal de Saúde

**CH_02**
- Numerador: crianças de 0 a 5 anos que não frequentam estabelecimento de ensino
- Denominador: total de crianças de 0 a 5 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: crianças de 0 a 5 anos no CadÚnico / Secretaria de Educação

**CH_03**
- Numerador: crianças de 6 a 14 anos que não frequentam estabelecimento de ensino
- Denominador: total de crianças de 6 a 14 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: crianças de 6 a 14 anos no CadÚnico / Secretaria de Educação

**CH_04**
- Numerador: mulheres de 10 a 17 anos com pelo menos um filho registrado
- Denominador: total de mulheres de 10 a 17 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: mulheres de 10 a 17 anos — Secretaria de Saúde / CadÚnico

**CH_05** *(corrigido em v01r9)*

$$CH_{05}(l) = \frac{Fam_{m\tilde{a}e\_resp \,\cap\, sem\_fund \,\cap\, filho<15}(l)}{Fam_{total}(l)} \times 100$$

Onde:
- $Fam_{m\tilde{a}e\_resp \,\cap\, sem\_fund \,\cap\, filho<15}(l)$ = famílias do loteamento $l$ cuja responsável é mulher (cod_parentesco_rf_pessoa = 1, sexo feminino), sem ensino fundamental completo, com pelo menos um filho menor de 15 anos no mesmo cod_familiar_fam
- $Fam_{total}(l)$ = total de famílias do loteamento $l$ na base
- Universo: famílias no CadÚnico

**CH_06**

$$CH_{06}(l) = \frac{Pessoas_{15+\,analfabetas}(l)}{Pessoas_{15+\,total}(l)} \times 100$$

Onde:
- $Pessoas_{15+\,analfabetas}(l)$ = pessoas com 15 anos ou mais que não sabem ler nem escrever no loteamento $l$
- $Pessoas_{15+\,total}(l)$ = total de pessoas com 15 anos ou mais no loteamento $l$
- Universo: população de 15 anos ou mais no CadÚnico / Censo 2022

**CH_07**

$$CH_{07}(l) = \frac{Criancas_{0\text{-}14\,\cap\,dom.\,sem\,fund.}(l)}{Criancas_{0\text{-}14\,total}(l)} \times 100$$

Onde:
- $Criancas_{0\text{-}14\,\cap\,dom.\,sem\,fund.}(l)$ = crianças de 0 a 14 anos residentes em domicílios onde nenhum morador concluiu o ensino fundamental (agregação por cod_familiar_fam obrigatória antes da marcação individual)
- $Criancas_{0\text{-}14\,total}(l)$ = total de crianças de 0 a 14 anos no loteamento $l$
- Universo: crianças residentes no CadÚnico

**CH_08**
- Numerador: jovens de 15 a 24 anos que não estudam, não trabalham formalmente e têm renda per capita menor ou igual a meio SM
- Denominador: total de jovens de 15 a 24 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: jovens de 15 a 24 anos no CadÚnico (com limitação de cobertura)

---

## Dimensão 3 — Renda e Trabalho

*5 variáveis | peso da dimensão no IVS: 1/3 | peso IVS-H hipótese: ~35-40%*

| id | cod | nome da variável | nível | direcao_risco | fonte do dado | disponível | prazo | observações |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| IVS012 | RT_01 | Proporção de pessoas com renda domiciliar per capita menor ou igual a meio SM | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Disponível no CadÚnico. Ponto de entrada natural do IVS-H. Renda domiciliar per capita por setor censitário não publicada pelo IBGE no Censo 2022 — CadÚnico confirmado como fonte primária. |
| IVS013 | RT_02 | Taxa de desocupação da população de 18 anos ou mais | Pessoa | maior_pior | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico registra situação ocupacional declarada. CAGED registra vínculo formal. Trabalhadores informais e parte dos MEI não aparecem no CAGED. |
| IVS014 | RT_03 | Percentual de pessoas de 18 anos ou mais sem fundamental completo e em ocupação informal | Pessoa | maior_pior | CadÚnico | Parcial | Curto prazo | Escolaridade disponível no CadÚnico. Informalidade depende de declaração — subestimação provável. Cruzar com CAGED para identificar vínculo formal. |
| IVS015 | RT_04 | Percentual de domicílios com renda per capita menor ou igual a meio SM e com presença de idoso | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Disponível no CadÚnico. Critério operacional definido em 27/03/2026: domicílios com renda per capita ≤ 0,5 SM e presença de pelo menos um morador com 60 anos ou mais. P12 resolvida. |
| IVS016 | RT_05 | Taxa de atividade das pessoas de 10 a 14 anos de idade (trabalho infantil) | Pessoa | maior_pior | CadÚnico / IBGE Censo 2022 | Parcial | Curto prazo | Interface direta com CREAS e Conselho Tutelar. Peso local reduzido (~3%) justificado por: criticidade ética alta, incidência estatística menor, menor capacidade de explicar variação global do índice. Censo 2022 é fonte mais robusta. |

### Fórmulas Operacionais — Renda e Trabalho

**RT_01**

$$RT_{01}(l) = \frac{Pessoas_{rpc \leq 0{,}5SM}(l)}{Pessoas_{total}(l)} \times 100$$

Onde:
- $Pessoas_{rpc \leq 0{,}5SM}(l)$ = pessoas em domicílios com renda per capita menor ou igual a meio salário mínimo no loteamento $l$
- $Pessoas_{total}(l)$ = total de pessoas no loteamento $l$
- Universo: população cadastrada no CadÚnico dez/2025
- **Referência salarial (Fase 1):** salário mínimo vigente em dezembro/2025 = **R$ 1.518,00** — limiar de corte = **R$ 759,00** per capita. Fonte: `dim_salario_minimo_v01.md`.

**RT_02**
- Numerador: pessoas de 18 anos ou mais desocupadas (procurando trabalho sem vínculo)
- Denominador: total de pessoas de 18 anos ou mais no loteamento
- Unidade: proporção (0 a 1)
- Universo: população de 18 anos ou mais no CadÚnico / CAGED

**RT_03**
- Numerador: pessoas de 18 anos ou mais sem ensino fundamental completo em ocupação informal (sem vínculo CAGED)
- Denominador: total de pessoas de 18 anos ou mais ocupadas no loteamento
- Unidade: proporção (0 a 1)
- Universo: população ocupada de 18 anos ou mais no CadÚnico

**RT_04** *(corrigido em v01r9)*

$$RT_{04}(l) = \frac{Dom_{rpc \leq 0{,}5SM \,\cap\, idoso \geq 60}(l)}{Dom_{total}(l)} \times 100$$

Onde:
- $Dom_{rpc \leq 0{,}5SM \,\cap\, idoso \geq 60}(l)$ = domicílios com renda per capita menor ou igual a meio SM e presença de pelo menos um morador com 60 anos ou mais no loteamento $l$
- $Dom_{total}(l)$ = total de domicílios do loteamento $l$ na base
- Universo: domicílios no CadÚnico dez/2025
- **Referência salarial (Fase 1):** salário mínimo vigente em dezembro/2025 = **R$ 1.518,00** — limiar de corte = **R$ 759,00** per capita. Fonte: `dim_salario_minimo_v01.md`.

**RT_05**
- Numerador: pessoas de 10 a 14 anos economicamente ativas (trabalho declarado)
- Denominador: total de pessoas de 10 a 14 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: crianças de 10 a 14 anos no CadÚnico / Censo 2022

---

## Resumo de Disponibilidade

| Status | Qtd | Variáveis |
| --- | --- | --- |
| Disponível imediato (CadÚnico) | 5 | IVS008, IVS009, IVS010, IVS012, IVS015 |
| Parcial — curto prazo | 10 | IVS001, IVS002, IVS003, IVS004, IVS005, IVS006, IVS011, IVS013, IVS014, IVS016 |
| Parcial — médio prazo | 1 | IVS007 |
| **TOTAL IVS-H** | **16** | — |

> **Implicação para o MVP:** as 5 variáveis imediatamente disponíveis
> no CadÚnico (dez/2025) permitem calcular o **IVS-H Fase 1** como
> primeiro entregável analítico: CH_05, CH_06, CH_07, RT_01, RT_04.
> O modelo converge para as 16 variáveis do IVS/IPEA à medida que
> as fontes forem disponibilizadas, preservando a estrutura original
> do índice.

> **Nota metodológica da Fase 1:** nesta etapa inicial, o cálculo deve
> utilizar a ponderação original do IVS/IPEA, sem calibração local de
> `peso_h`. A recalibração fica reservada para fase posterior.

---

## Resumo das Unidades de Cálculo — Fase 1 MVP

| Variável | Unidade primária | Denominador | Agregação final |
| --- | --- | --- | --- |
| RT_01 | Pessoa | Total de pessoas do loteamento | Loteamento |
| RT_04 | Domicílio/Família | Total de domicílios do loteamento | Loteamento |
| CH_06 | Pessoa | Total de pessoas 15+ do loteamento | Loteamento |
| CH_07 | Criança em contexto domiciliar | Total de crianças 0-14 do loteamento | Loteamento |
| CH_05 | Família | Total de famílias do loteamento | Loteamento |

> Denominadores são sempre a população/domicílios/famílias *observadas
> no CadÚnico*, agregadas por loteamento — não a população censitária.

---

## Fluxo Analítico do IVS-H

1. Dados administrativos coletados nas fontes originais
   (CadÚnico, CAGED, Censo IBGE, SIDRA, Saúde, Educação).

2. Indicadores básicos calculados nas unidades de análise
   pessoa ou domicílio.

3. Resultados agregados por escala espacial:
   **Loteamento → Núcleo (CRAS) → Região de Planejamento.**

4. Normalização min-max aplicada por variável, respeitando
   `direcao_risco` (maior_pior = normalização direta;
   maior_melhor = normalização invertida).

5. Índice IVS-H calculado aplicando os pesos definidos
   em `DIM_VARIAVEL_IVS` sobre os valores normalizados
   registrados em `FATO_VARIAVEL_IVS_LOTEAMENTO`.

---

## Capacidade Analítica do IVS-H

| Escala | Aplicação |
| --- | --- |
| Loteamento | Identificação de bolsões de vulnerabilidade |
| Núcleo CRAS | Planejamento da assistência social |
| Região de Planejamento | Planejamento urbano e de infraestrutura |
| Município | Comparação com IVS nacional |

---

## Mapeamento IVS-H × Camadas do Modelo

| Camada analítica | Variáveis IVS-H cobertas |
| --- | --- |
| Pessoa | IVS003, IVS004, IVS005, IVS006, IVS007, IVS009, IVS011, IVS013, IVS014, IVS016 |
| Família/Domicílio | IVS001, IVS002, IVS008, IVS010, IVS012, IVS015 |
| Agregação Espacial | Todas — o IVS-H é calculado por loteamento e agregado por Núcleo e RP |

---

## Mapeamento IVS-H × Programas Municipais

| Dimensão IVS | Exemplos de programas de Hortolândia | Campo `dimensao_ivs` |
| --- | --- | --- |
| Infraestrutura Urbana | Agora a Casa é Sua, PHLIS, MCMV, Serviços Urbanos | `infraestrutura_urbana` |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil | `capital_humano` |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Família, BPC, DECOLA, Emprega Hortolândia | `renda_trabalho` |
| Multidimensional | PAIF, PAEFI, Ressignifica Hortolândia, CRAS/CREAS | `multidimensional` |

---

## IVS-H — Hipótese de Calibração Local (Fase posterior)

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) | Justificativa |
| --- | --- | --- | --- |
| Infraestrutura Urbana | 33% | ~15-20% | Cobertura de água e coleta de lixo elevadas — baixo poder discriminatório municipal, possível variação entre loteamentos periféricos |
| Capital Humano | 33% | ~40-45% | Reprodução intergeracional da pobreza é o desafio central |
| Renda e Trabalho | 33% | ~35-40% | Tensão entre polo de emprego formal e 72.424 famílias no CadÚnico |

> Estes pesos são hipótese para Fase 2. Na Fase 1 (MVP), o IVS-H
> utiliza a ponderação original do IVS/IPEA. A calibração local será
> feita após validação empírica com dados reais do CadÚnico dez/2025
> e Censo 2022. A metodologia seguirá as diretrizes da OCDE
> (NARDO et al., OECD, 2008).

---
---

## 🔎 Rastreabilidade Metodológica

Cada variável do IVS-H segue os seguintes princípios:

- aderência ao modelo IPEA
- cálculo reprodutível em código (Python/Pandas)
- identificação clara de:
  - unidade de cálculo
  - unidade de agregação
- validação cruzada entre:
  - cálculo manual
  - campos existentes nas bases (quando disponíveis)

---
---

## 🧠 Registro de Decisões Metodológicas

### 🔹 Estrutura do Índice
- Decisão: Manter integralmente as 16 variáveis do IVS IPEA
- Justificativa: Garantir comparabilidade nacional e robustez metodológica

---

### 🔹 Uso do CadÚnico (MVP)
- Decisão: Utilizar CadÚnico como base inicial
- Justificativa: Disponibilidade imediata e cobertura da população vulnerável
- Limitação: Não representa totalidade da população

---

### 🔹 Unidade de Análise
- Decisão: Separar unidade de cálculo e unidade de agregação
- Justificativa: Evitar inconsistências entre variáveis (pessoa vs família)

---

### 🔹 Tratamento de Outliers
- Decisão: Não remover automaticamente valores extremos
- Justificativa: Necessidade de investigação prévia (erro vs dado válido)
- Ação futura: Aplicar winsorização em indicadores contínuos, quando necessário

---

### 🔹 Normalização
- Decisão: Utilizar método min-max
- Justificativa: Aderência ao modelo IPEA
- Risco: Sensibilidade a outliers (controlado por análise prévia)

---

### 🔹 RT_01 (Renda)
- Decisão: Validar cálculo com campo existente no CadÚnico
- Justificativa: Garantia de consistência
- Observação: Indicador robusto a outliers

---

### 🔹 RT_02 e RT_03 (Informalidade)
- Decisão: Manter no modelo, mesmo com limitações
- Justificativa: Aderência ao IVS original
- Limitação: Subestimação estrutural da informalidade

---

### 🔹 Separação IVS-H x IPST-H
- Decisão: Separar vulnerabilidade estrutural de pressão operacional
- Justificativa: Evitar distorções analíticas

---

### 🔹 Estratégia de Implementação
- Decisão: Estruturar em 3 fases (MVP → Expansão → Calibração)
- Justificativa: Viabilidade técnica e institucional

---

## 📌 Observação Final

Este documento é evolutivo e poderá ser atualizado conforme:
- novas bases de dados
- validações empíricas
- decisões estratégicas da gestão

---
---

*Documento de modelagem conceitual — 01_modelagem_conceitual.*  
*Uso interno — Atlas Social de Hortolândia.*
im_variavel_IVS_v01r11.md…]()
