[README (7).md](https://github.com/user-attachments/files/27651446/README.7.md)[Uploading README # Atlas Social de Hortolândia
**Arquitetura de Inteligência Social para Políticas Públicas Municipais**

Repositório público do projeto **Atlas Social de Hortolândia** — iniciativa de arquitetura analítica aplicada à política socioassistencial do município de Hortolândia – SP.

![Diagrama do Sistema](docs/diagramas/diagrama_sistema.svg)

O projeto estrutura uma **infraestrutura de inteligência social mínima** capaz de compreender e acompanhar a dinâmica da vulnerabilidade social no território municipal, utilizando dados públicos já existentes e respeitando integralmente a legislação de proteção de dados.

---

## Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **73 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**.

Apesar da escala da política socioassistencial, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais para a gestão pública:

- Quem está sendo atendido?
- Onde estão as famílias que não estão sendo atendidas?
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?
- Quantas pessoas conseguem alcançar emancipação social?

Este projeto busca estruturar uma infraestrutura analítica capaz de responder a essas perguntas de forma sistemática, territorial e longitudinal.

---

## Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A proposta de modelagem:

- não altera fluxos institucionais
- não cria novos cadastros
- não redefine competências administrativas

Ela organiza os **dados já existentes**, permitindo leitura estratégica, territorial e longitudinal da política socioassistencial municipal.

---

## Cadeia analítica

```
Pessoa → Família → Domicílio → Loteamento → Programa Social → Serviço → Resultado
```

A hierarquia territorial adotada é:

```
Loteamento → Núcleo (área de abrangência CRAS) → Região de Planejamento
```

Essa estrutura permite compreender a política socioassistencial como um **processo territorial e longitudinal**, e não apenas como registros administrativos isolados.

---

## Estrutura deste repositório

Este repositório contém exclusivamente os componentes públicos do projeto:

| Diretório | Conteúdo |
|---|---|
| `00_governanca` | Princípios arquitetônicos, governança institucional, LGPD e séries jornalísticas |
| `01_modelagem_conceitual` | Definição das entidades centrais da política social |
| `03_indicadores_mvp` | Definição e documentação dos indicadores estruturantes |
| `04_documento_tecnico` | Documentação formal da arquitetura analítica |
| `05_plano_evolutivo` | Roteiro de evolução do projeto |

> O ambiente operacional — notebooks, pipelines, staging e processamento de dados — está mantido em repositório separado de acesso restrito, em conformidade com a LGPD e com os princípios de segurança de dados do setor público.

---

## Dois índices complementares

### IVS-H — Índice de Vulnerabilidade Social de Hortolândia

Adaptação local do **IVS/IPEA**, mantendo as 16 variáveis originais distribuídas em três dimensões:

| Dimensão | Sigla |
|---|---|
| Infraestrutura Urbana | IU |
| Capital Humano | CH |
| Renda e Trabalho | RT |

A calibração local reflete as especificidades do município: cobertura de saneamento próxima de 100% e reprodução intergeracional da pobreza como desafio central.

O modelo converge para a incorporação das 16 variáveis do IVS/IPEA à medida que as fontes forem disponibilizadas, preservando a estrutura original do índice.

### IPST-H — Índice de Pressão Social Territorial de Hortolândia

Índice proprietário municipal que mede a **pressão exercida sobre o Estado** em cada loteamento — sobrecarga da rede, lacunas de cobertura e intensidade da demanda.

| Combinação | Leitura |
|---|---|
| IVS alto + IPST alto | Alta vulnerabilidade e Estado pressionado |
| IVS alto + IPST baixo | Vulnerabilidade alta, rede ainda absorvendo |
| IVS baixo + IPST alto | Pressão operacional (fluxo, mobilidade, rede insuficiente) |
| IVS baixo + IPST baixo | Situação estável |

> **O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a vulnerabilidade se transforma em pressão sobre o Estado.**

---

## Corpus Jornalístico

O projeto mantém uma **série jornalística estruturada** a partir do jornal Tribuna Liberal, com classificação sistemática de eventos de vulnerabilidade social, governança e pressão territorial.

O corpus funciona como **sensor de campo**: registra ciclos de pressão social antes que os dados administrativos os capturem, complementando o IVS-H com evidência empírica de base local.

Cada evento é classificado segundo:

- dimensão analítica (infraestrutura urbana, capital humano, renda e trabalho)
- tipo de camada (IVS, GOVERNANÇA, PRESSÃO SOCIAL, CONTEXTO)
- papel no ciclo de pressão (emergência, resposta, agravamento, sinal de desfecho)

---

## O que este repositório não contém

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais
- microdados do CadÚnico
- informações identificáveis de cidadãos
- dados operacionais de sistemas municipais
- notebooks de processamento
- pipelines e lógica incremental

O conteúdo disponibilizado inclui apenas estruturas conceituais, dicionários, documentação metodológica e séries analíticas agregadas.

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP |
| Secretaria | Inclusão e Desenvolvimento Social (SMIDS) |
| Setor | DIAE |
| Responsável técnico | Ailton Vendramini |
| Ano de início | 2026 |
| Fase atual | MVP — validação técnica e estratégica |

---

## Objetivo de longo prazo

Construir uma **arquitetura de inteligência social replicável para municípios brasileiros**, integrando:

- Cadastro Único
- rede socioassistencial
- equipamentos públicos
- organizações da sociedade civil
- análise territorial da vulnerabilidade social

---

## Licença

Projeto institucional público.

Não contém dados pessoais. Segue os princípios da **Lei Geral de Proteção de Dados (LGPD)** e boas práticas de governança de dados no setor público.
(7).md…]()
