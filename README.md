[README (21).md](https://github.com/user-attachments/files/28639124/README.21.md)[Uploading R# Atlas Social de Hortolândia
Arquitetura de Dados Sociais para Políticas Públicas Municipais

Repositório do projeto **Atlas Social de Hortolândia**, iniciativa de arquitetura de dados sociais aplicada à política socioassistencial do município de Hortolândia – SP.

O projeto busca estruturar uma **infraestrutura analítica mínima** capaz de compreender e acompanhar a dinâmica da vulnerabilidade social no território municipal, utilizando dados públicos já existentes e respeitando integralmente a legislação de proteção de dados.

---

## Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **73 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**.

Apesar da escala da política socioassistencial, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais para a gestão pública:

- Quem está sendo atendido?
- Onde estão as famílias que não estão sendo atendidas?
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?
- Quantas pessoas conseguem alcançar emancipação social?

Este projeto busca estruturar uma **infraestrutura analítica mínima** capaz de responder a essas perguntas de forma sistemática.

---

## Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A proposta de modelagem:

- não altera fluxos institucionais
- não cria novos cadastros
- não redefine competências administrativas

Ela apenas organiza os **dados já existentes**, permitindo uma leitura estratégica, territorial e longitudinal da política socioassistencial municipal.

---

## Arquitetura analítica do projeto

A lógica analítica do Atlas Social organiza a política pública na seguinte cadeia:

```
Pessoa → Família → Domicílio → Loteamento → Programa Social → Serviço → Resultado
```

A hierarquia territorial adotada é:

```
Loteamento → Núcleo (área de abrangência CRAS) → Região de Planejamento
```

Essa estrutura permite compreender a política socioassistencial como um **processo territorial e longitudinal**, e não apenas como registros administrativos isolados.

---

## Sistema de instrumentos analíticos

O Atlas Social de Hortolândia é composto por seis instrumentos complementares, organizados por pergunta central, fonte e escala de análise.

| Instrumento | Pergunta central | Fonte | Escala | Status | Resultado atual |
|---|---|---|---|---|---|
| **IVS** (IPEA/Censo) | Onde no Brasil? | IBGE Censo 2010 | Nacional | ✅ Referência | IVS Hortolândia: 0,234 — faixa Médio |
| **IVCAD** (MDS) | Qual o perfil familiar cadastral? | CadÚnico federal 2022 | Municipal | ✅ Referência | Comparativo disponível |
| **IVS-H** ★ | Onde no município? | CadÚnico local dez/2025 | Loteamento | ✅ Fase 1 calculada | 11 variáveis · 3 dimensões · 141 loteamentos ranqueados |
| **PVSE** ★ | Quem são os mais críticos? | CadÚnico local dez/2025 | Família | ✅ Calculado | 5 perfis · 369 fam. desconectadas · 1.470 PcD crítica · 256 mães em vulnerabilidade múltipla |
| **IPST-H** ★ | Onde a vulnerabilidade pressiona a Prefeitura? | Dados administrativos (SIGAS) | Loteamento | ⏳ Aguarda integração | Solicitação de acesso ao SIGAS enviada |
| **IPSO-H** ★ | O que está acontecendo agora? | Corpus jornalístico | Loteamento | ✅ Ativo | 580 eventos · dez/2025–jun/2026 · 53% governança · 24% pressão social |

**Legenda de status:** ✅ Disponível · ⏳ Aguarda integração · ★ Instrumento desenvolvido pelo Atlas Social de Hortolândia

**Siglas:** IVS = Índice de Vulnerabilidade Social · IVS-H = versão local calibrada · PVSE = Perfis de Vulnerabilidade Severa · IPST-H = Índice de Pressão Social Territorial de Hortolândia · IPSO-H = Índice de Pressão Social Observada de Hortolândia

> **PVSE — Perfis de Vulnerabilidade Severa:** camada complementar que identifica grupos críticos para intervenção direta da Prefeitura.

> *A Prefeitura federal enxerga o cadastro. O Atlas Social enxerga a trajetória no loteamento.*

---

## Estrutura do repositório

| Diretório | Conteúdo |
|---|---|
| `00_governanca` | Princípios arquitetônicos, fundamentos institucionais, LGPD e comunicação institucional |
| `01_modelagem_conceitual` | Definição das entidades centrais da política social |
| `02_modelagem_logica` | Esquemas de tabelas, dicionários de dados e DDLs SQLite |
| `03_indicadores_mvp` | Definição dos indicadores estruturantes do sistema |
| `04_documento_tecnico` | Documentação formal da arquitetura analítica |
| `05_plano_evolutivo` | Roteiro de evolução do projeto |
| `06_banco_dados` | Banco de dados SQLite — instância ativa do projeto (não versionado) |

---

## Modelo de dados (visão simplificada)

O modelo segue princípios clássicos de **modelagem analítica dimensional**.

### Dimensões principais

- Pessoa
- Família
- Loteamento / Núcleo / Região de Planejamento
- Programas sociais
- Unidades de atendimento
- Normas jurídicas
- Colegiados e governança

### Tabelas de fatos

- Atendimentos
- Concessão de benefícios
- Participação em programas sociais
- IVS por loteamento (`fato_ivs_loteamento`)

Essas estruturas permitem análises **territoriais, temporais e institucionais** da política pública.

---

## Índice de Vulnerabilidade Social — IVS-H

O projeto adota o **IVS (IPEA)** como referência metodológica nacional e propõe o **IVS-H**, um índice calibrado à realidade local de Hortolândia.

| Dimensão | Peso IPEA | Peso IVS-H |
|---|---|---|
| Infraestrutura Urbana | 33% | 15% |
| Capital Humano | 33% | 42% |
| Renda e Trabalho | 33% | 43% |

A calibração reflete as especificidades locais: cobertura de saneamento próxima de 100% (SNIS/SABESP), prioridade declarada da gestão municipal sobre emprego e renda, e reprodução intergeracional da pobreza como desafio central.

### Variáveis calculadas — Fase 1 (11 de 16)

| Dimensão | Variável | Resultado municipal |
|---|---|---|
| Renda e Trabalho | RT_01 — renda per capita ≤ ½ SM | 64,66% |
| Renda e Trabalho | RT_04 — idosos sem proteção previdenciária | 90,12% |
| Renda e Trabalho | RT_05 — trabalho infantil | 0,01% (piso real) |
| Capital Humano | CH_02 — crianças 0–5 fora da creche | 53,11% |
| Capital Humano | CH_03 — crianças 6–14 fora da escola | 0,97% |
| Capital Humano | CH_05 — mães chefes sem fundamental | 7,01% |
| Capital Humano | CH_06 — analfabetismo 15+ | 8,56% |
| Capital Humano | CH_07 — crianças sem fundamental no domicílio | 10,82% |
| Capital Humano | CH_08 — jovens 15–24 nem-nem | 9,33% |
| Infraestrutura Urbana | IU_01 — água/esgoto inadequado | 1,83% |
| Infraestrutura Urbana | IU_02 — coleta de lixo inadequada | 0,11% |

**Pendentes — Fase 2** (dependem de integração externa):
CH_01 (mortalidade infantil / DATASUS) · CH_04 (gravidez na adolescência) · IU_03 (deslocamento > 1h) · RT_02 (desocupação / CAGED) · RT_03 (informalidade / CAGED)

> Documentação completa: `00_governanca/ivs_vs_ivsh_comparativo.md`

---

## O que este repositório **não contém**

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais
- microdados do CadÚnico
- informações identificáveis de cidadãos
- dados operacionais de sistemas municipais

O conteúdo disponibilizado inclui apenas:

- estruturas de dados
- dicionários
- esquemas analíticos
- documentação metodológica
- exemplos sintéticos

---

## Tecnologia utilizada no MVP

| Camada | Tecnologia |
|---|---|
| Banco de dados | SQLite 3.45 |
| Linguagem de análise | Python 3.12 + Pandas |
| Ambiente de desenvolvimento | Windows 10 / Debian 12 |
| Versionamento | GitHub |
| Próxima etapa prevista | PostgreSQL + pipeline ELT |

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP |
| Departamento | DIAE — Departamento de Informação e Análise Estatística |
| Secretaria | SMPUGE — Secretaria Municipal de Planejamento Urbano, Gestão Estratégica e Empreendedorismo |
| Responsável técnico | Ailton Vendramini |
| Ano de início | 2026 |
| Fase atual | MVP — validação técnica e estratégica |

---

## Objetivo de longo prazo

Construir uma **arquitetura de dados sociais replicável para municípios brasileiros**, permitindo integrar:

- Cadastro Único
- rede socioassistencial
- equipamentos públicos
- organizações da sociedade civil
- análise territorial da vulnerabilidade social

---

## Licença

Projeto institucional público.

Não contém dados pessoais e segue os princípios da **Lei Geral de Proteção de Dados (LGPD)** e boas práticas de **governança de dados no setor público**.
EADME (21).md…]()
