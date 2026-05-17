[README (14).md](https://github.com/user-attachments/files/27900070/README.14.md)
# Atlas Social de Hortolândia
**Camada Municipal de Inteligência Territorial para a Política Socioassistencial**

> *"A arquitetura de dados deve refletir a política pública — nunca substituí-la."*

---

## Problema Público

A gestão socioassistencial municipal enfrenta quatro desafios estruturais:

- **Fragmentação dos dados** — informações dispersas entre secretarias sem integração territorial
- **Ausência de leitura por loteamento** — indicadores disponíveis apenas em nível municipal
- **Dificuldade de priorização** — sem dados territorizados, a alocação de recursos é por percepção
- **Lacuna histórica** — o último IVS municipal disponível (IPEA) data de **2010**, 16 anos atrás

---

## O que o Atlas resolve

| Pergunta | Antes | Com o Atlas |
|---|---|---|
| Quais loteamentos concentram maior vulnerabilidade? | Sem resposta objetiva | IVS-H por loteamento |
| A cobertura dos CRAS é proporcional à demanda? | Estimativa | Calculável |
| Onde a rede está sob pressão? | Percepção | IPST-H mensurável |
| O que está acontecendo no território agora? | Fragmentado | Corpus jornalístico estruturado |
| Qual a trajetória da família ao longo do tempo? | Invisível | CadÚnico + SIGAS integrados |

---

## Princípios

- **Interoperabilidade** — metodologia alinhada a referências federais (IVS/IPEA, IVCAD/MDS)
- **Transparência** — código-fonte aberto, versionado e auditável
- **Proteção de dados** — conformidade total com a LGPD; dados pessoais nunca sobem ao repositório
- **Neutralidade territorial** — o sistema descreve; não julga, não ranqueia politicamente
- **Governança pública** — produzido dentro da estrutura institucional municipal
- **Rastreabilidade metodológica** — cada resultado tem script, fonte e data documentados
- **Incrementalidade** — arquitetura que evolui sem ruptura; cada fase valida antes de expandir
- **Não substituição da decisão humana** — o dado orienta; a decisão é sempre do gestor

---

## O que o Atlas NÃO é

- Não substitui políticas públicas nem decisão humana
- Não é sistema de vigilância ou monitoramento de cidadãos
- Não é ranking político de bairros
- Não é ferramenta eleitoral
- Não é score secreto ou classificação automática opaca de famílias
- Não altera fluxos institucionais nem redefine competências administrativas
- Não depende de convênios federais para seu núcleo analítico

---

## Como funciona

```
CadÚnico → Tratamento e padronização
         → Indicadores por variável
         → Índices por loteamento
         → Leitura territorial integrada + corpus jornalístico
         → Painéis de apoio à decisão
```

Hierarquia territorial:

```
Loteamento (141) → Núcleo CRAS → Região de Planejamento (6 RPs) → Município
```

---

## Os cinco instrumentos analíticos

Cada instrumento responde a uma pergunta diferente. Nenhum substitui o outro.

| Instrumento | Pergunta central | Fonte | Escala |
|---|---|---|---|
| **IVS** (IPEA/Censo) | Onde no Brasil? | IBGE Censo | Nacional |
| **IVCAD** (MDS) | Qual o perfil familiar cadastral? | CadÚnico federal | Municipal |
| **IVS-H** ★ | Onde no município? | CadÚnico local | **Loteamento** |
| **IPST-H** | Onde a vulnerabilidade pressiona o Estado? | Dados administrativos | Loteamento |
| **IPSO-H** | O que está acontecendo agora? | Corpus jornalístico | Territorial |

**PVSE** — Perfis de Vulnerabilidade Severa: camada complementar que identifica grupos críticos para intervenção direta.

**Sobre o IVCAD:** o Índice de Vulnerabilidade das Famílias do CadÚnico (MDS) é uma camada complementar de leitura cadastral federal que apoia a compreensão de perfis de vulnerabilidade familiar. O Atlas incorpora o IVCAD como referência — e o desagrega territorialmente até o loteamento, o que nenhum instrumento federal realiza.

> O governo federal enxerga o cadastro. O Atlas Social enxerga a trajetória no loteamento.

---

## Dimensão temporal — o diferencial de longo prazo

O Atlas foi projetado para acumular séries históricas. Cada ciclo de extração do CadÚnico e cada edição classificada do corpus jornalístico ampliam a capacidade analítica do sistema:

- **Evolução da vulnerabilidade** por loteamento ao longo do tempo
- **Ciclos de pressão social** — emergência, resposta, agravamento, desfecho
- **Trajetória das famílias** — entrada, permanência, emancipação, reincidência
- **Resposta estatal** — quando e onde a rede reagiu

Essa dimensão temporal é o que transforma o Atlas de um índice pontual em um **sistema municipal de interpretação social**.

---

## Resultados — IVS-H Fase 1 MVP

Sete indicadores calculados a partir do CadÚnico (dez/2025), com metodologia compatível com o IVS/IPEA.

| Código | Indicador | Resultado | Universo |
|---|---|---|---|
| RT_01 | Renda per capita ≤ ½ SM | **64,66%** | 72.424 pessoas |
| RT_04 | Idosos sem proteção previdenciária* | **90,12%** | 11.787 idosos |
| CH_06 | Analfabetismo 15+ | **8,56%** | 51.492 pessoas |
| CH_03 | Crianças 6–14 fora da escola | **0,97%** | 13.681 crianças |
| CH_08 | Jovens 15–24 nem-nem | **9,33%** | 10.667 jovens |
| CH_05 | Mães RF sem fundamental, filho < 15 | **8,63%** | 24.663 mulheres RF |
| CH_07 | Crianças 0–14 em domicílios sem fundamental | **10,86%** | 20.932 crianças |

*proxy via ausência de Bolsa Família — refinamento via CNIS em etapa futura.*

> Cada pessoa identificada está cadastrada e ao alcance da atuação municipal. O dado não apenas descreve: **habilita a intervenção**.

---

## Referência histórica IPEA

| Dimensão | IVS 2000 | IVS 2010 | Variação |
|---|---|---|---|
| IVS Composto | 0,440 | 0,324 | ▼ −0,116 |
| Infraestrutura Urbana | 0,405 | 0,411 | ≈ estável |
| Capital Humano | 0,488 | 0,262 | ▼ −0,226 |
| Renda e Trabalho | 0,424 | 0,270 | ▼ −0,154 |

---

## Por que não depender apenas de instrumentos federais

**1. Defasagem temporal**

O IVCAD foi calculado com dados de **2022**. Os indicadores do IVS-H foram calculados com dados de **dezembro/2025** — três anos mais recentes. Nenhum instrumento federal garante atualização no ritmo que a gestão municipal exige.

**2. Soberania municipal**

O Observatório do CadÚnico depende de decisão política e orçamento federal. O Atlas Social não depende de convênio, verba federal nem continuidade política externa. O município controla seus próprios dados e seu próprio ritmo de atualização.

**3. O SIGAS — o ciclo completo**

```
Quem é vulnerável     →  CadÚnico
Quem foi atendido     →  SIGAS
Quem melhorou / permanece / retornou  →  Atlas Social
```

Nenhum instrumento federal fecha esse ciclo. É inteligência longitudinal que só o município pode construir.

---

## Corpus Jornalístico — sensor do IPSO-H

O Atlas mantém um corpus de classificação de notícias do jornal **Tribuna Liberal**, sensor de pressão social territorial. Ciclos ativos:

- `IU_ALAGAMENTO_2026` — alagamentos urbanos recorrentes
- `CH_CRIMINALIDADE_2025` — violência urbana territorial
- `CH_VIOLENCIA_CRIANCA_2026` — violência contra crianças
- `CH_EXCLUSAO_DIGITAL_2026` — fricção entre digitalização estatal e populações vulneráveis
- `RT_DATACENTERS_REGIONAL_2026` — transformação econômica territorial

---

## Estrutura do repositório

| Diretório | Conteúdo |
|---|---|
| `00_governanca` | Regras de classificação, dicionários, READMEs do corpus |
| `00_governanca/series_jornalisticas` | CSVs diários do corpus Tribuna Liberal |
| `01_modelagem_conceitual` | Definição das entidades centrais |
| `02_modelagem_logica` | Esquemas, dicionários e DDLs |
| `dados/cadunico` | Scripts e outputs agregados (sem dados pessoais) |
| `dados/bd_externos` | Dados públicos: IPEA, IBGE, corpus jornalístico |
| `notebooks` | Pipeline IVS-H em Jupyter |
| `outputs` | Resultados agregados e painéis |
| `docs` | Documentação institucional |

---

## Tecnologia

| Camada | Tecnologia |
|---|---|
| Processamento | Python 3.12 + Pandas + Jupyter |
| Ambiente institucional | Debian 12 (prefeitura) |
| Versionamento | GitHub — fonte única da verdade |
| GIS | QGIS + GeoJSON (em integração) |
| Banco de dados futuro | PostgreSQL + pipeline ELT |

---

## Próximos passos

- [ ] Calcular CH_02 — crianças 0–5 fora da creche
- [ ] Calcular CH_04 — mães adolescentes 10–17
- [ ] Completar linkage CEP → loteamento
- [ ] Calcular IVS-H por loteamento (141 loteamentos)
- [ ] Publicar 4 painéis gerenciais territoriais
- [ ] Estruturar FATO_CICLO_PRESSAO_SOCIAL
- [ ] Integrar SIGAS ao pipeline analítico

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP (IBGE: 3519071) |
| Secretaria | SMIDS — Secretaria Municipal de Inclusão e Desenvolvimento Social |
| Departamento | DIAE |
| Responsável técnico | Ailton Vendramini |
| Repositório | github.com/ailtonfv/Atlas-Social-de-Hortolandia |
| Fase atual | Fase 1 MVP concluída — 7 indicadores calculados |

---

## Licença

Projeto institucional público. Segue os princípios da **LGPD** e boas práticas de governança de dados no setor público.
