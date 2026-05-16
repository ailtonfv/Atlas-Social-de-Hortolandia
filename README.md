[README (8).md](https://github.com/user-attachments/files/27861715/README.8.md)

![Diagrama do Sistema](docs/diagramas/diagrama_sistema.svg)

[README (9).md](https://github.com/user-attachments/files/27862199/README.9.md)
# Atlas Social de Hortolândia
**Sistema de Inteligência Territorial para a Política Socioassistencial**

Repositório do **Atlas Social de Hortolândia** — sistema de análise e monitoramento da vulnerabilidade social do município de Hortolândia – SP, desenvolvido pela Secretaria Municipal de Inclusão e Desenvolvimento Social (SMIDS / DIAE).

---

## O problema que este projeto resolve

Hortolândia possui aproximadamente **240 mil habitantes** e cerca de **72.400 pessoas inscritas no Cadastro Único** — quase **1 em cada 3 moradores**. A rede socioassistencial existe e funciona. O que falta é informação territorializada para orientá-la.

O último IVS municipal disponível (IPEA) data de **2010**. São 16 anos sem medição sistemática da vulnerabilidade no nível do loteamento. O Atlas Social nasce para fechar essa lacuna.

> **O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a vulnerabilidade se transforma em pressão sobre o Estado.**

---

## Princípio central

> **A arquitetura de dados deve refletir a política pública — nunca substituí-la.**

O projeto não altera fluxos institucionais, não cria novos cadastros e não redefine competências administrativas. Organiza os dados já existentes para permitir leitura estratégica, territorial e longitudinal da política socioassistencial.

---

## Cinco instrumentos analíticos

O Atlas Social opera com um ecossistema de instrumentos complementares. Cada um responde a uma pergunta diferente — e nenhum substitui o outro.

| Instrumento | Pergunta central | Fonte | Escala |
|---|---|---|---|
| **IVS** (IPEA) | Onde no Brasil? | IBGE Censo | Nacional / municipal |
| **IVCAD** (MDS) | Qual o perfil familiar? | CadÚnico federal | Municipal |
| **IVS-H** ★ | Onde no município? | CadÚnico local | **Loteamento** |
| **IPST-H** | Onde a vulnerabilidade pressiona o Estado? | Dados administrativos | Loteamento |
| **IPSO-H** | O que está acontecendo agora? | Corpus jornalístico | Territorial |

*★ contribuição central do projeto*

**PVSE — Perfis de Vulnerabilidade Severa:** camada analítica complementar ao IVS-H que identifica grupos críticos para intervenção direta.

---

### Por que o Atlas Social não é substituído pelo IVCAD?

O **IVCAD** (Índice de Vulnerabilidade das Famílias do CadÚnico) é um índice federal oficial do MDS, calculado a partir de 40 indicadores em 6 dimensões (Necessidade de Cuidados, Primeira Infância, Crianças e Adolescentes, Trabalho, Recursos e Condições Habitacionais). Para Hortolândia, o IVCAD de referência abril/2026 está disponível no Observatório do CadÚnico.

O Atlas Social não compete com o IVCAD — **o complementa**:

- O IVCAD diz que Hortolândia tem vulnerabilidade X. O IVS-H diz que o Jardim Amanda tem vulnerabilidade Y e o Vila Real tem vulnerabilidade Z.
- O IVCAD é estático (ciclo federal). O IVS-H é atualizado a cada extração local do CadÚnico.
- O IVCAD não conhece os 141 loteamentos de Hortolândia. O IVS-H foi construído sobre eles.
- O IPST-H e o IPSO-H não existem em nenhum sistema federal.

> O governo federal vê o município. O Atlas Social vê o loteamento.

---

### IVS-H — Índice de Vulnerabilidade Social de Hortolândia
Replica as **16 variáveis oficiais do IVS/IPEA** com dados locais (CadÚnico), na granularidade de **loteamento** (141 loteamentos). Permite comparabilidade com qualquer município brasileiro e monitoramento contínuo — sem depender de ciclos censitários.

### IPST-H — Índice de Pressão Social Territorial de Hortolândia
Indicador proprietário que mede onde a vulnerabilidade se transforma em **sobrecarga operacional da rede socioassistencial**. Alimentado por registros administrativos. Complementa o IVS-H sem substituí-lo.

### IPSO-H — Índice de Pressão Social Observada de Hortolândia
Derivado exclusivamente do corpus jornalístico. Captura sinais de pressão social em tempo quase real — o que os índices estruturais ainda não conseguem ver.

**Matriz de interpretação IVS-H × IPST-H:**

| IVS-H | IPST-H | Leitura |
|---|---|---|
| Alto | Alto | Alta vulnerabilidade + Estado pressionado |
| Alto | Baixo | Vulnerabilidade alta, rede ainda absorvendo |
| Baixo | Alto | Pressão operacional (fluxo / rede insuficiente) |
| Baixo | Baixo | Situação estável |

---

## Resultados — IVS-H Fase 1 MVP

Sete indicadores calculados a partir do CadÚnico (dez/2025), com metodologia compatível com o IVS/IPEA e rastreabilidade completa.

| Código | Dimensão | Indicador | Resultado | Universo |
|---|---|---|---|---|
| RT_01 | Renda e Trabalho | Renda per capita ≤ ½ SM | **64,66%** | 72.424 pessoas |
| RT_04 | Renda e Trabalho | Idosos sem proteção previdenciária* | **90,12%** | 11.787 pessoas 60+ |
| CH_06 | Capital Humano | Analfabetismo 15+ | **8,56%** | 51.492 pessoas 15+ |
| CH_03 | Capital Humano | Crianças 6–14 fora da escola | **0,97%** | 13.681 crianças |
| CH_08 | Capital Humano | Jovens 15–24 nem-nem | **9,33%** | 10.667 jovens |
| CH_05 | Capital Humano | Mães RF sem fundamental, filho < 15 | **8,63%** | 24.663 mulheres RF |
| CH_07 | Capital Humano | Crianças 0–14 em domicílios sem fundamental | **10,86%** | 20.932 crianças |

*RT_04: proxy via ausência de Bolsa Família — refinamento via CNIS em etapa futura.

> Cada pessoa identificada está cadastrada no CadÚnico e, por definição, ao alcance da atuação municipal. O dado não apenas descreve: **habilita a intervenção**.

---

## Referência histórica IPEA

| Dimensão | IVS 2000 | IVS 2010 | Variação |
|---|---|---|---|
| IVS Composto | 0,440 | 0,324 | ▼ −0,116 |
| Infraestrutura Urbana | 0,405 | 0,411 | ≈ estável |
| Capital Humano | 0,488 | 0,262 | ▼ −0,226 |
| Renda e Trabalho | 0,424 | 0,270 | ▼ −0,154 |

A lacuna de 16 anos (2010–2026) sem medição é o argumento central para a existência deste projeto.

---

## Corpus Jornalístico — sensor do IPST-H

O Atlas Social mantém um corpus de classificação de notícias do jornal **Tribuna Liberal**, utilizado como sensor de pressão social territorial. Cada edição é classificada em um CSV estruturado com 21 campos seguindo schema versionado.

Ciclos de pressão ativos monitorados:
- `IU_ALAGAMENTO_2026` — alagamentos urbanos recorrentes
- `CH_CRIMINALIDADE_2025` — violência urbana territorial
- `CH_VIOLENCIA_CRIANCA_2026` — violência contra crianças
- `CH_EXCLUSAO_DIGITAL_2026` — fricção entre digitalização estatal e populações vulneráveis
- `RT_DATACENTERS_REGIONAL_2026` — transformação econômica territorial

---

## Hierarquia territorial

```
Município → Regiões de Planejamento (6 RPs) → Loteamentos (141) → Núcleo CRAS
```

Chave canônica de integração: `codbairro` da base `loteamentosregiao.xls` (SIG/PMH).

---

## Estrutura do repositório

| Diretório | Conteúdo |
|---|---|
| `00_governanca` | Regras de classificação, dicionários, READMEs do corpus jornalístico |
| `00_governanca/series_jornalisticas` | CSVs diários do corpus Tribuna Liberal |
| `01_modelagem_conceitual` | Definição das entidades centrais da política social |
| `02_modelagem_logica` | Esquemas, dicionários e DDLs |
| `dados/cadunico` | Scripts e outputs agregados (sem dados pessoais) |
| `dados/bd_externos` | Dados públicos: IPEA, IBGE, corpus jornalístico |
| `notebooks` | Notebooks Jupyter do pipeline IVS-H |
| `outputs` | Resultados agregados e painéis |
| `docs` | Documentação institucional |

**Notebooks do pipeline IVS-H:**

| Notebook | Finalidade |
|---|---|
| `02_tratamento_cadunico` | Limpeza e padronização da base CadÚnico |
| `03_analise_variaveis_cadunico` | Cálculo das variáveis IVS-H |
| `05_calculo_ivsh_cadunico` | Placar consolidado e cálculo do índice |
| `06_pvse_hortolandia` | Distribuições territoriais por loteamento |

---

## Tecnologia

| Camada | Tecnologia |
|---|---|
| Processamento | Python 3.12 + Pandas + Jupyter Notebook |
| Ambiente institucional | Debian 12 (máquina da prefeitura) |
| Ambiente de desenvolvimento | Windows + Anaconda |
| Versionamento | GitHub (fonte única da verdade) |
| GIS | QGIS + GeoJSON (em integração) |
| Banco de dados futuro | PostgreSQL + pipeline ELT |
| Proteção de dados | LGPD — dados pessoais nunca sobem ao repositório |

---

## O que este repositório não contém

Por razões legais e éticas, este repositório **não inclui**:
- dados pessoais ou identificáveis
- microdados do CadÚnico
- informações operacionais de sistemas municipais

Contém apenas: estruturas de dados, scripts SQL/Python, metodologia, outputs agregados e documentação.

---

## Contexto institucional

| | |
|---|---|
| Município | Hortolândia – SP (código IBGE: 3519071) |
| Secretaria | SMIDS — Secretaria Municipal de Inclusão e Desenvolvimento Social |
| Departamento | DIAE — Departamento de Inteligência e Análise Estratégica |
| Responsável técnico | Ailton Vendramini |
| Ano de início | 2026 |
| Fase atual | Fase 1 MVP concluída — 7 indicadores calculados |

---

## Próximos passos

- [ ] Calcular variáveis Fase 2 (CH_02, CH_04, IU_01, IU_02, IU_03...)
- [ ] Construir linkage CEP → `cod_loteamento` (DE-PARA)
- [ ] Calcular IVS-H por loteamento (141 loteamentos)
- [ ] Publicar 4 painéis gerenciais territoriais
- [ ] Estruturar FATO_CICLO_PRESSAO_SOCIAL a partir do corpus jornalístico

---

## Licença

Projeto institucional público. Segue os princípios da **LGPD** e boas práticas de governança de dados no setor público.
