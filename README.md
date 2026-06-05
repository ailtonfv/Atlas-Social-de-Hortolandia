[README (22).md](https://github.com/user-attachments/files/28639568/README.22.md)
# Atlas Social de Hortolândia
Inteligência de Política Pública Socioassistencial

Repositório oficial do Atlas Social de Hortolândia — sistema municipal de inteligência territorial desenvolvido pelo DIAE / SMPUGE da Prefeitura de Hortolândia – SP.

O projeto estrutura uma infraestrutura analítica capaz de compreender, territorializar e acompanhar a dinâmica da vulnerabilidade social no município, utilizando exclusivamente dados públicos já existentes e respeitando integralmente a LGPD.

> "O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a vulnerabilidade se transforma em pressão sobre a Prefeitura."

---

## Arquitetura do Sistema — Atlas Social de Hortolândia

---

## Contexto

Hortolândia possui aproximadamente 230 mil habitantes e 72.424 pessoas inscritas no Cadastro Único (dez/2025) — quase 1 em cada 3 moradores.

Em maio de 2026, o município alcançou a 30ª posição nacional no Índice de Progresso Social (IPS Brasil 2026), entre 5.570 municípios avaliados, liderando a Região Metropolitana de Campinas. O resultado valida a trajetória de investimento em políticas públicas — e ao mesmo tempo evidencia o argumento central do Atlas: índices agregados escondem vulnerabilidades territoriais que só a granularidade de loteamento revela.

Apesar da escala da política socioassistencial, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais:

- Quem está sendo atendido — e quem deveria estar e não está?
- Em qual loteamento estão as famílias mais vulneráveis?
- Qual a pressão real sobre cada unidade da rede de serviços?
- As políticas estão de fato mudando a vida das pessoas?

---

## Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A modelagem proposta não altera fluxos institucionais, não cria novos cadastros e não redefine competências administrativas. Ela organiza os dados já existentes para permitir leitura estratégica, territorial e longitudinal da política socioassistencial.

---

## Como funciona

```
CadÚnico → Tratamento e padronização
         → Indicadores por variável
         → Índices por loteamento
         → Leitura territorial integrada + corpus jornalístico
         → Painéis de apoio à decisão
```

Pipeline Analítico — Atlas Social

**Escopo:** o pipeline acima representa o fluxo do CadÚnico — fonte primária da Fase 1. Cada nova base de dados incorporada ao Atlas (CAGED, DATASUS, IBGE Censo, SIGAS, SSP-SP) exigirá seu próprio pipeline, com características específicas de extração, frequência de atualização e controle de qualidade. A arquitetura é incremental por design.

---

## Os cinco instrumentos analíticos

Cada instrumento responde a uma pergunta diferente. Nenhum substitui o outro.

| Instrumento | Pergunta central | Fonte | Escala | Status | Resultado atual |
|---|---|---|---|---|---|
| **IVS** (IPEA/Censo) | Onde no Brasil? | IBGE Censo 2010 | Nacional | ✅ Referência | IVS Hortolândia 2010: 0,324 |
| **IVCAD** (MDS) | Qual o perfil familiar cadastral? | CadÚnico federal 2022 | Municipal | ✅ Referência | IVCAD 2022: 0,262 |
| **IVS-H** ★ | Onde no município? | CadÚnico local dez/2025 | Loteamento | ✅ Fase 1 calculada | 11 variáveis · 3 dimensões · 141 loteamentos ranqueados |
| **PVSE** ★ | Quem são os mais críticos? | CadÚnico local dez/2025 | Família | ✅ Calculado | 5 perfis · 369 fam. desconectadas · 1.470 PcD crítica · 256 mães em vulnerabilidade múltipla |
| **IPST-H** ★ | Onde a vulnerabilidade pressiona a Prefeitura? | Dados administrativos (SIGAS) | Loteamento | ⏳ Aguarda integração | Solicitação de acesso ao SIGAS enviada |
| **IPSO-H** ★ | O que está acontecendo agora? | Corpus jornalístico | Loteamento | ✅ Ativo | 580 eventos · dez/2025–jun/2026 · 53% governança · 24% pressão social |

**Status:** ✅ Disponível · ⏳ Aguarda integração · ★ Instrumento desenvolvido pelo Atlas Social de Hortolândia

**Siglas:** IVS-H = Índice de Vulnerabilidade Social de Hortolândia · PVSE = Perfis de Vulnerabilidade Severa · IPST-H = Índice de Pressão Social Territorial de Hortolândia · IPSO-H = Índice de Pressão Social Observada de Hortolândia

> **PVSE — Perfis de Vulnerabilidade Severa:** camada complementar que identifica grupos críticos para intervenção direta da Prefeitura.

> *A Prefeitura federal enxerga o cadastro. O Atlas Social enxerga a trajetória no loteamento.*

---

## Por que não depender apenas de instrumentos federais

**1. Defasagem temporal**

O IVCAD foi calculado com dados de 2022. Os indicadores do IVS-H foram calculados com dados de dezembro/2025 — três anos mais recentes. Nenhum instrumento federal garante atualização no ritmo que a gestão municipal exige.

**2. Soberania municipal**

O Observatório do CadÚnico depende de decisão política e orçamento federal. O Atlas Social não depende de convênio, verba federal nem continuidade política externa. O município controla seus próprios dados e seu próprio ritmo de atualização.

**3. O SIGAS — o ciclo completo**

```
Quem é vulnerável          →  CadÚnico
Quem foi atendido          →  SIGAS
Quem melhorou / permanece  →  Atlas Social
```

Nenhum instrumento federal fecha esse ciclo. É inteligência longitudinal que só o município pode construir.

---

## Fase 1 MVP — Variáveis calculadas (11 de 16)

Onze indicadores calculados a partir do CadÚnico (dez/2025), metodologia compatível com o IVS/IPEA, rastreabilidade completa.

| Dimensão | Variável | Resultado | Vulneráveis | Universo |
|---|---|---|---|---|
| Renda e Trabalho | RT_01 — renda per capita ≤ ½ SM | 64,66% | 46.828 pessoas | 72.424 |
| Renda e Trabalho | RT_04 — idosos sem proteção previdenciária | 90,12% | 10.623 pessoas | 11.787 (60+) |
| Renda e Trabalho | RT_05 — trabalho infantil ¹ | 0,01% | 3 casos | 25.134 (≤17) |
| Capital Humano | CH_02 — crianças 0–5 fora da creche ² | 53,11% | 3.851 crianças | 7.251 |
| Capital Humano | CH_03 — crianças 6–14 fora da escola | 0,97% | 133 crianças | 13.681 |
| Capital Humano | CH_05 — mães chefes sem fundamental ³ | 7,01% | 2.129 famílias | 30.362 fam. |
| Capital Humano | CH_06 — analfabetismo 15+ | 8,56% | 4.409 pessoas | 51.492 |
| Capital Humano | CH_07 — crianças sem fundamental no domicílio | 10,82% | 2.264 crianças | 20.932 |
| Capital Humano | CH_08 — jovens 15–24 nem-nem | 9,33% | 995 jovens | 10.667 |
| Infraestrutura Urbana | IU_01 — água/esgoto inadequado | 1,83% | 557 domicílios | 30.362 dom. |
| Infraestrutura Urbana | IU_02 — coleta de lixo inadequada | 0,11% | 34 domicílios | 30.362 dom. |

¹ Campo autodeclarado — valor representa piso real, não teto. Especialmente subnotificado para meninas (trabalho doméstico não remunerado).  
² Incluindo 642 crianças de 4–5 anos que nunca frequentaram a escola — pré-escola obrigatória por lei.  
³ Universo = total de famílias (CH_05 é calculado no nível familiar, não individual).

**Referência histórica:** IVS IPEA 2010 = 0,324 (▼ −0,116 desde 2000) · IVCAD municipal (MDS, 2022) = 0,262.

**Pendentes — Fase 2** (dependem de integração externa):  
CH_01 (mortalidade infantil / DATASUS) · CH_04 (gravidez na adolescência) · IU_03 (deslocamento > 1h) · RT_02 (desocupação / CAGED) · RT_03 (informalidade / CAGED)

---

## O poder da granularidade — Jardim Amanda

Ao territorializar os indicadores por loteamento, o Atlas revela o que nenhum índice nacional consegue mostrar. O Jardim Amanda aparece entre os primeiros colocados em todos os indicadores de Capital Humano calculados.

| Indicador | Jardim Amanda | Municipal | Rank |
|---|---|---|---|
| CH_06 — Analfabetismo | 10,30% | 8,56% | 1º |
| CH_07 — Sem fundamental | 11,12% | 10,82% | 1º |
| CH_08 — Nem-nem | 7,77% | 9,33% | 1º |
| RT_04 — Idosos s/ proteção | 89,03% | 90,12% | 1º |
| PcD em vulnerabilidade crítica | 168 pessoas · 164 famílias | — | 1º |

O IVCAD registra Hortolândia com índice 0,262 — vulnerabilidade moderada. O Atlas mostra que o Jardim Amanda opera em patamar estruturalmente diferente. Médias municipais escondem vulnerabilidades.

---

## Corpus jornalístico — IPSO-H

O Atlas mantém uma série histórica estruturada da Tribuna Liberal, classificada em schema padronizado (v10.4), com 21 campos por registro.

O corpus funciona como sensor de pressão social em tempo real, inaugurando ciclos de pressão que os índices estruturais não capturam. Cada edição é processada individualmente, com controle de versão e rastreabilidade completa.

**Volume atual:** 580 eventos · dez/2025–jun/2026 · 53% governança · 24% pressão social · 17% contexto

**Ciclos ativos monitorados (jun/2026):**

| Ciclo | Status |
|---|---|
| CH_VIOLENCIA_GENERO_2025 | agravamento |
| CH_CRIMINALIDADE_2025 | ativo |
| CH_VIOLENCIA_CRIANCA_2026 | ativo |
| IU_ALAGAMENTO_2026 | monitoramento |
| RT_DATACENTERS_REGIONAL_2026 | monitoramento |

Documentação do schema: `00_governanca/corpus_jornalistico/regras_de_classificacao_v10_4.md`  
Série histórica: `00_governanca/series_jornalisticas/`

---

## IVS-H — Metodologia e pesos

O projeto adota o IVS/IPEA como referência metodológica nacional e implementa o IVS-H — versão local calculada com dados do CadÚnico na granularidade de loteamento.

| Dimensão | Peso IPEA | Peso IVS-H | Justificativa |
|---|---|---|---|
| Infraestrutura Urbana | 33% | 15% | Cobertura próxima de 100% (SABESP/SNIS) |
| Capital Humano | 33% | 42% | Reprodução intergeracional da pobreza |
| Renda e Trabalho | 33% | 43% | Prioridade declarada da gestão: emprego e renda |

**Fase 1 (atual):** 11 variáveis calculadas com dados CadÚnico dez/2025.  
**Fase 2 (planejada):** expansão à medida que fontes adicionais forem disponibilizadas, preservando a estrutura original do índice.

> "O modelo converge para a incorporação das 16 variáveis do IVS/IPEA à medida que as fontes forem disponibilizadas, preservando a estrutura original do índice."

---

## Estrutura do repositório

Estrutura de Diretórios — Atlas Social de Hortolândia

| Diretório | Conteúdo |
|---|---|
| `00_governanca` | Regras de classificação, dicionários, README do corpus, fechamentos diários |
| `00_governanca/series_jornalisticas` | CSVs diários do corpus Tribuna Liberal (schema v10.4) |
| `00_governanca/corpus_jornalistico` | Governança metodológica do IPSO-H |
| `01_modelagem_conceitual` | Definição das entidades centrais |
| `02_modelagem_logica` | DDL SQLite, dicionários de dados |
| `03_indicadores_mvp` | Definição e cálculo dos indicadores Fase 1 |
| `04_documento_tecnico` | Documentação formal da arquitetura |
| `05_plano_evolutivo` | Roteiro de evolução e pendências |
| `dados/cadunico` | Scripts e outputs agregados (sem dados pessoais) |
| `dados/bd_externos` | Dados públicos: IPEA, IBGE, corpus jornalístico |
| `notebooks` | Pipeline IVS-H em Jupyter |
| `outputs` | Resultados agregados e painéis |
| `docs` | Diagramas e documentação visual |

---

## O que este repositório não contém

Por razões legais e éticas (LGPD), este repositório não inclui:

- dados pessoais ou identificáveis
- microdados do CadÚnico
- informações operacionais de sistemas municipais

O conteúdo disponibilizado inclui apenas estruturas de dados, dicionários, esquemas analíticos, documentação metodológica, scripts SQL/Python e resultados agregados auditáveis.

---

## Tecnologia

| Camada | Tecnologia |
|---|---|
| Banco de dados | SQLite (Fase 1 — prototipagem) |
| Processamento | Python 3.12 + Pandas (Jupyter Notebook) |
| Ambiente | Debian 12 (dados) · Windows (documentação) |
| Versionamento | GitHub |
| Próxima etapa | PostgreSQL + pipeline ELT |

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP (código IBGE: 3519071) |
| Unidade responsável | DIAE — Departamento de Informação e Análise Estatística |
| Secretaria | SMPUGE — Secretaria Municipal de Planejamento Urbano, Gestão Estratégica e Empreendedorismo |
| Responsável técnico | Ailton Vendramini |
| Repositório | github.com/ailtonfv/Atlas-Social-de-Hortolandia |
| Ano de início | 2026 |
| Fase atual | Fase 1 MVP — 11 indicadores calculados · corpus jornalístico ativo |

---

## Objetivo de longo prazo

Construir uma arquitetura de dados sociais replicável para municípios brasileiros, integrando:

- Cadastro Único
- rede socioassistencial municipal
- equipamentos públicos e unidades de saúde
- bases externas (CAGED, CNIS, SSP-SP, Educação)
- análise territorial contínua da vulnerabilidade social

A escalabilidade será consequência da maturidade institucional — não da ansiedade tecnológica.

---

## Licença

Projeto institucional público. Não contém dados pessoais. Segue os princípios da **Lei Geral de Proteção de Dados (LGPD)** e boas práticas de governança de dados no setor público.
