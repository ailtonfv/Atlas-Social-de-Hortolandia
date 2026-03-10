# Atlas Social de Hortolândia
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

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) |
|---|---|---|
| Infraestrutura Urbana | 33% | ~15–20% |
| Capital Humano | 33% | ~40–45% |
| Renda e Trabalho | 33% | ~35–40% |

A calibração reflete as especificidades locais: cobertura de saneamento próxima de 100% (SNIS/SABESP) e reprodução intergeracional da pobreza como desafio central.

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
| Ambiente de desenvolvimento | Windows 10 |
| Versionamento | GitHub |
| Visualização do banco | DB Browser for SQLite |
| Próxima etapa prevista | PostgreSQL + pipeline ELT |

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP |
| Secretaria | Inclusão e Desenvolvimento Social |
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
