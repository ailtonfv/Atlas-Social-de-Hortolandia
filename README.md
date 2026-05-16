[README (13).md](https://github.com/user-attachments/files/27862545/README.13.md)[README (12).md](https://github.com/user-attachments/files/27862477/README.12.md)


![Diagrama do Sistema](docs/diagramas/diagrama_sistema.svg)

[Uploading RE# Atlas Social de Hortolândia
**Camada Municipal de Inteligência Territorial para a Política Socioassistencial**

> *"O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a vulnerabilidade se transforma em pressão sobre o Estado."*

---

## O Problema

Hortolândia possui **240 mil habitantes**, **72.400 pessoas no CadÚnico** e uma rede socioassistencial consolidada.

O desafio não é a ausência de serviços. É a ausência de informação territorializada para orientá-los.

O último índice de vulnerabilidade municipal disponível (IPEA) data de **2010** — uma lacuna de 16 anos.

---

## O que o Atlas resolve

| Pergunta | Antes | Com o Atlas |
|---|---|---|
| Quais loteamentos concentram maior vulnerabilidade? | Sem resposta objetiva | IVS-H por loteamento |
| A cobertura dos CRAS é proporcional à demanda? | Estimativa | Calculável |
| Onde a rede está sob pressão? | Percepção | IPST-H mensurável |
| O que está acontecendo no território agora? | Fragmentado | Corpus jornalístico estruturado |

---

## Como funciona

```
CadÚnico → Tratamento e padronização
         → Indicadores por variável
         → Índices por loteamento
         → Leitura territorial integrada
         → Painéis de apoio à decisão
```

A hierarquia territorial adotada:

```
Loteamento (141) → Núcleo CRAS → Região de Planejamento (6 RPs) → Município
```

---

## Os cinco instrumentos analíticos

Cada instrumento responde a uma pergunta diferente. Nenhum substitui o outro.

| Instrumento | Pergunta central | Fonte | Escala |
|---|---|---|---|
| **IVS** (IPEA/Censo) | Onde no Brasil? | IBGE Censo | Nacional |
| **IVCAD** (MDS) | Qual o perfil familiar? | CadÚnico federal | Municipal |
| **IVS-H** ★ | Onde no município? | CadÚnico local | **Loteamento** |
| **IPST-H** | Onde a vulnerabilidade pressiona o Estado? | Dados administrativos | Loteamento |
| **IPSO-H** | O que está acontecendo agora? | Corpus jornalístico | Territorial |

**PVSE** — Perfis de Vulnerabilidade Severa: camada complementar que identifica grupos críticos para intervenção direta.

> O governo federal possui o CadÚnico, o IVCAD e bases massivas. O que não possui é leitura hiperterritorial municipal, integração entre secretarias e dinâmica de loteamento. É isso que o Atlas constrói.

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

A lacuna de 16 anos entre o último IVS disponível (2010) e o presente é o argumento central deste projeto.

---

## Princípios

- **Interoperabilidade** — metodologia alinhada a referências federais (IVS/IPEA, IVCAD/MDS)
- **Transparência** — código-fonte aberto, versionado e auditável
- **Proteção de dados** — conformidade total com a LGPD; dados pessoais nunca sobem ao repositório
- **Neutralidade territorial** — o sistema descreve; não julga, não ranqueia politicamente
- **Governança pública** — produzido dentro da estrutura institucional municipal
- **Rastreabilidade metodológica** — cada resultado tem script, fonte e data documentados
- **Incrementalidade** — arquitetura que evolui sem ruptura; cada fase valida antes de expandir

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

## Corpus Jornalístico — sensor do IPSO-H

O Atlas mantém um corpus de classificação de notícias do jornal **Tribuna Liberal**, utilizado como sensor de pressão social territorial. Cada edição é classificada em CSV estruturado com schema versionado.

Ciclos de pressão ativos:

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

---

## Por que não depender apenas de instrumentos federais

### 1. Defasagem temporal

O IVCAD disponível no Observatório do CadÚnico (MDS) foi calculado com dados de **2022**. Os indicadores do IVS-H foram calculados com dados de **dezembro/2025** — três anos mais recentes.

Nenhum instrumento federal garante atualização contínua no ritmo que a gestão municipal exige.

### 2. Fragilidade da dependência federal

O Observatório do CadÚnico depende de decisão política, orçamento federal e continuidade de governo. Uma mudança de prioridades em Brasília pode descontinuar o acesso a qualquer momento.

O Atlas Social é **soberano municipalmente**: não depende de convênio, de verba federal nem de continuidade política externa para funcionar. O município controla seus próprios dados, seus próprios índices e seu próprio ritmo de atualização.

### 3. O SIGAS — o diferencial que nenhum índice federal possui

O CadÚnico captura **quem é vulnerável**. O SIGAS (sistema municipal) captura **o que acontece depois** — atendimentos, encaminhamentos, acompanhamentos, resultados.

A integração CadÚnico + SIGAS fecha o ciclo completo da política pública:

```
Quem é vulnerável     →  CadÚnico
Quem foi atendido     →  SIGAS
Quem melhorou / permanece / retornou  →  Atlas Social
```

Nenhum instrumento federal consegue fazer isso. É inteligência longitudinal de política pública — e só o município tem acesso a esse dado.

> O governo federal enxerga o cadastro. O Atlas Social enxerga a trajetória.
ADME (13).md…]()
