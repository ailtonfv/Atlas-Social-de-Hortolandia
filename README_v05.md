[README_v05.md](https://github.com/user-attachments/files/27552925/README_v05.md)[Uploading READ# Atlas Social de Hortolândia
Arquitetura de Inteligência Social para Políticas Públicas Municipais

Repositório do projeto **Atlas Social de Hortolândia**, iniciativa de arquitetura de dados sociais aplicada à política socioassistencial do município de Hortolândia – SP.

O projeto estrutura uma **infraestrutura analítica** capaz de compreender e acompanhar a dinâmica da vulnerabilidade social no território municipal, utilizando dados públicos já existentes e respeitando integralmente a legislação de proteção de dados.

<p align="center">
  <img src="assets/diagrama_sistema.svg" alt="Arquitetura do Atlas Social de Hortolândia — visão geral dos instrumentos, hierarquia territorial, resultados MVP e pipeline de dados" width="100%"/>
</p>

---

## Contexto

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **72 mil pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**.

Apesar da escala da política socioassistencial, os dados disponíveis ainda não permitem responder com precisão perguntas fundamentais para a gestão pública:

- Quem está sendo atendido?
- Onde estão as famílias que não estão sendo atendidas?
- Quanto tempo as famílias permanecem em situação de vulnerabilidade?
- Quantas pessoas conseguem alcançar emancipação social?

---

## Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

A proposta de modelagem não altera fluxos institucionais, não cria novos cadastros e não redefine competências administrativas. Ela organiza os **dados já existentes** para uma leitura estratégica, territorial e longitudinal da política socioassistencial.

---

## Sistema de instrumentos analíticos

O projeto é estruturado em cinco instrumentos complementares:

| Instrumento | Pergunta central | Base |
|---|---|---|
| **IVS** (IPEA) | Onde está a vulnerabilidade no Brasil? | IBGE Censo |
| **IVS-H** | Onde está dentro do município? | CadÚnico local |
| **IVCAD** | Qual é o perfil de quem já está cadastrado? | CadÚnico federal |
| **IPST-H** | Onde a vulnerabilidade pressiona o Estado agora? | Dados administrativos |
| **IPSO-H** | O que está acontecendo agora? | Corpus jornalístico |

Complementar ao IVS-H:

| Camada | Descrição |
|---|---|
| **PVSE** | Perfis de Vulnerabilidade Severa — detecção de grupos críticos para intervenção direta |

> *"O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde ela se transforma em pressão sobre o Estado. O IPSO-H mostra o que está acontecendo agora."*

---

## IVS-H — Fase 1 MVP: resultados calculados

Base: CadÚnico dez/2025 — 72.424 pessoas

| Variável | Descrição | Resultado |
|---|---|---|
| RT_01 | Renda per capita ≤ ½ SM | **58,8%** das famílias |
| RT_04 | Renda ≤ ½ SM + idoso dependente | **8,12%** das famílias (~2.465) |
| CH_06 | Analfabetismo 15+ | **8,69%** — 4.516 pessoas |
| CH_05 | Mães chefes sem fund. completo | ⏳ em cálculo |
| CH_07 | Crianças sem adulto escolarizado | ⏳ em cálculo |

**Núcleo mais crítico identificado:** 298 idosos analfabetos, pobres e sem BPC nem Bolsa Família.

---

## Hierarquia territorial

```
Loteamento (141) → Núcleo CRAS → Região de Planejamento (6 RPs) → Município
```

---

## Estrutura do repositório

| Diretório | Conteúdo |
|---|---|
| `00_governanca/` | Princípios arquitetônicos, corpus jornalístico (IPSO-H), palestras, fechamentos de sessão |
| `01_modelagem_conceitual/` | Definição das entidades centrais da política social |
| `02_modelagem_logica/` | Esquemas de tabelas, dicionários de dados, DDLs, IPST-H |
| `03_indicadores_mvp/` | Definição dos indicadores estruturantes |
| `04_documentacao_tecnica/` | Documentação formal da arquitetura analítica |
| `05_plano_evolutivo/` | Roteiro de evolução do projeto |
| `06_banco_dados/` | Banco de dados SQLite — instância ativa (não versionado) |
| `assets/` | Recursos visuais — diagramas e imagens do projeto |
| `dados/` | Pipeline de dados: `01_bruto/` → `02_limpo/` → `03_curado/` → `04_exportacao/` |
| `notebooks/cadunico/` | Pipeline analítico CadÚnico (notebooks 01–06) |
| `notebooks/midia/` | Exploração e análise do corpus jornalístico |
| `outputs/` | Gráficos, tabelas e exportações analíticas |
| `utils/` | Funções auxiliares reutilizáveis (`funcoes_gerais.py`) |

---

## Pipeline de notebooks (CadÚnico)

| Notebook | RTB | Entrada | Saída | Finalidade |
|---|---|---|---|---|
| `01_exploracao_cadunico.ipynb` | RTB_001 | `01_bruto` | — | Exploração inicial da base |
| `02_tratamento_cadunico_v03.ipynb` | RTB_002 | `01_bruto` | `02_limpo` | Limpeza e padronização |
| `03_analise_variaveis_cadunico.ipynb` | RTB_003 | `02_limpo` | `03_curado` | Análise exploratória de variáveis |
| `04_analise_temporal_cadunico.ipynb` | RTB_004 | `02_limpo` | — | Análise temporal (em desenvolvimento) |
| `05_calculo_ivsh_cadunico_v02.ipynb` | RTB_005 | `02_limpo` | `03_curado` | Cálculo das variáveis IVS-H |
| `06_perfis_vulnerabilidade.ipynb` | RTB_006 | `02_limpo` | `outputs/` | Perfis de Vulnerabilidade Severa (PVSE) |

---

## Corpus jornalístico (IPSO-H)

O IPSO-H é construído a partir da classificação sistemática de edições da **Tribuna Liberal** — jornal regional que cobre Hortolândia e municípios vizinhos.

Cada edição é classificada em CSVs estruturados com schema versionado (v10.4), permitindo rastrear ciclos de pressão social ao longo do tempo.

**Ciclos ativos (maio/2026):**
- `CH_VIOLENCIA_CRIANCA_2026` — agravamento
- `CH_VIOLENCIA_GENERO_2025` — monitoramento
- `IU_AGUA_SABESP_2026` — agravamento
- `CH_SAUDE_MENTAL_SITUACAO_RUA_2026` — resposta
- `CH_SUPERLOTACAO_CARCERARIA_2026` — resposta

---

## O que este repositório não contém

Por razões legais e éticas, este repositório **não inclui**:

- dados pessoais ou microdados do CadÚnico
- informações identificáveis de cidadãos
- dados operacionais de sistemas municipais

---

## Tecnologia

| Camada | Tecnologia |
|---|---|
| Processamento de dados | Python 3.12 + Pandas + NumPy |
| Ambiente analítico | Jupyter Notebook (Windows) |
| Banco de dados | SQLite 3 (MVP) → PostgreSQL (roadmap) |
| Versionamento | GitHub + GitHub Desktop |
| Visualização futura | QGIS + GeoJSON (141 loteamentos) |

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP (IBGE: 3519071) |
| Secretaria | Inclusão e Desenvolvimento Social (SMIDS) |
| Responsável técnico | Ailton Vendramini |
| Ano de início | 2026 |
| Fase atual | Fase 1 MVP — cálculo IVS-H em andamento |

---

## Licença

Projeto institucional público. Não contém dados pessoais. Segue os princípios da **LGPD** e boas práticas de governança de dados no setor público.
ME_v05.md…]()

