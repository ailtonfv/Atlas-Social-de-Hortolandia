[matriz_rastreabilidade_operacional_v04 (4).md](https://github.com/user-attachments/files/28348793/matriz_rastreabilidade_operacional_v04.4.md)
# Matriz de Rastreabilidade Operacional — Atlas Social de Hortolândia
**Versão:** v04  
**Data:** 28/05/2026  
**Pasta:** `04_documentacao_tecnica/`  
**Leitura obrigatória:** antes de executar qualquer notebook

## Changelog v03 → v04

| Item | Mudança |
| --- | --- |
| Seção 1 | Adicionado RTB_009 — `99_manutencao_corpus.ipynb` |
| Seção 1 | RTB_005 a RTB_008 atualizados — análise PcD consolidada em `06_pvse_hortolandia_v11.ipynb`, não em notebooks separados |
| Seção 2 | Adicionado RTB_019b — campo `relevancia_estrategica` no schema do corpus jornalístico |
| Seção 7 | Adicionadas pendências P13 a P16 |
| Seção 7 | P07, P08, P10 resolvidas — confirmadas em 28/05/2026 |
| Data | Atualizada para 28/05/2026 |
| Motivação | Migração de `relevancia_estrategica` em 116 CSVs do corpus (564 eventos). Notebook de manutenção `99_` criado. PcD consolidado no PVSE v11. |

---

## 0. Como Usar Esta Matriz

Esta matriz é a ponte entre o que foi **acordado no GitHub** e o que é **executado no Jupyter**.
Cada linha responde quatro perguntas simultaneamente:

1. Qual notebook executa qual parte do modelo?
2. Qual output deriva de qual indicador?
3. Qual tabela deriva de qual dimensão/fato?
4. Qual documento conceitual fundamenta o cálculo?

Antes de modificar qualquer notebook, localize sua linha aqui pelo `id_rastreabilidade`.
Se a modificação alterar a fundamentação conceitual, o documento do GitHub deve ser atualizado primeiro.
Se a modificação alterar schema de tabela ou coluna do CadÚnico, registrar versão do dicionário utilizado.

---

## 1. Matriz Principal

| id_rastreabilidade | Notebook | O que executa | Variáveis IVS-H | Tabela leitura | Tabela escrita | Output gerado | tipo_output | periodo_referencia | Documento GitHub que fundamenta |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_001 | `01_rt01_exploracao_inicial.ipynb` | Exploração e validação da RT_01. Leitura do CadÚnico bruto. Primeiro cálculo de renda per capita. | RT_01 | `STG_CADUNICO_RAW` | — | `outputs/tabelas/ivs_variaveis.csv` ⚠️ exploratório — não oficial | exploratorio | CadÚnico dez/2025 | `dim_variavel_IVS_v01r7.md` → RT_01 |
| RTB_002 | `02_tratamento_base.ipynb` | Limpeza, deduplicação, padronização de campos. Gera base tratada para os demais notebooks. | — (pré-cálculo) | — | `STG_CADUNICO_RAW` | `dados/processado.xlsx` | operacional | CadÚnico dez/2025 | `arquitetura_dados_IVS_IBGE_Horto_v10.md` → Camada Trusted |
| RTB_003 | `03_analises_variaveis.ipynb` | Cálculo das 5 variáveis MVP: CH_05, CH_06, CH_07, RT_01, RT_04. Análise por loteamento. | CH_05, CH_06, CH_07, RT_01, RT_04 | `STG_CADUNICO_RAW` `DIM_LOTEAMENTO` | — | `outputs/tabelas/ivs_variaveis.csv` `outputs/graficos/distribuicao_renda.png` `outputs/graficos/vulnerabilidade_por_familia.png` | analitico / institucional | CadÚnico dez/2025 | `dim_variavel_IVS_v01r7.md` → CH_05, CH_06, CH_07, RT_01, RT_04 |
| RTB_004 | `04_calculo_ivsh.ipynb` | Composição do IVS-H MVP. Aplicação de pesos. Ranking por loteamento/núcleo. | IVS-H Fase 1 (5 variáveis) | `DIM_LOTEAMENTO` `DIM_NUCLEO` | `FATO_IVS_LOTEAMENTO` | `outputs/tabelas/ivs_resultado_final.csv` `outputs/tabelas/familias_vulneraveis.csv` `outputs/graficos/ivs_por_nucleo.png` | institucional / operacional / institucional | CadÚnico dez/2025 | `dim_variavel_IVS_v01r7.md` `arquitetura_dados_IVS_IBGE_Horto_v10.md` `ipst_h_v02.md` |
| RTB_005 | `06_pvse_hortolandia_v11.ipynb` | ~~`05_pcd_flag_deficiencia.ipynb`~~ **Consolidado no PVSE v11.** Criar `flag_deficiencia` consolidando campos `ind_def_*`. Contar pessoas e famílias com deficiência. | — (pré-camada) | `STG_CADUNICO_RAW` | — | `outputs/tabelas/pcd_contagem_tipos.csv` | exploratorio | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 1 |
| RTB_006 | `06_pvse_hortolandia_v11.ipynb` | ~~`06_pcd_rede_apoio.ipynb`~~ **Consolidado no PVSE v11.** Mapear rede de apoio. Calcular PcD sem ajuda. Indicador crítico: `ind_def_* == 1` + `ind_ajuda_nao_memb == 1`. | — (camada dependência) | `STG_CADUNICO_RAW` | — | `outputs/tabelas/pcd_sem_apoio.csv` | analitico | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 2 |
| RTB_007 | `06_pvse_hortolandia_v11.ipynb` | ~~`07_pcd_cruzamentos.ipynb`~~ **Consolidado no PVSE v11.** Cruzar deficiência com idade, escola (CH_03 recorte PcD), renda (RT_01 recorte PcD). | CH_03 RT_01 (recortes PcD) | `STG_CADUNICO_RAW` | — | `outputs/tabelas/pcd_cruzamentos.csv` | analitico | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 4 |
| RTB_008 | `06_pvse_hortolandia_v11.ipynb` | ~~`08_pcd_territorializacao.ipynb`~~ **Consolidado no PVSE v11.** Indicador composto PcD + sem apoio + baixa renda + território. Ranking por loteamento. | — (camada dependência territorial) | `STG_CADUNICO_RAW` `DIM_LOTEAMENTO` `DIM_NUCLEO` | `FATO_DEPENDENCIA_LOTEAMENTO` | `outputs/tabelas/pcd_vulnerabilidade_territorial.csv` `outputs/graficos/pcd_por_nucleo.png` | institucional | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 3 |
| RTB_009 | `99_manutencao_corpus.ipynb` | Manutenção e migração dos CSVs do corpus jornalístico. Aplicação retroativa de campos novos. Verificação de integridade do schema. | — (utilitário) | — | — | — | utilitario | Corpus mai/2025–mai/2026 | `regras_de_classificacao_v10.4.md` |

> **⚠️ RTB_001 — output exploratório:** o CSV gerado neste notebook
> tem finalidade de inspeção e validação, não de consumo analítico
> oficial. Não deve ser referenciado por outros notebooks.
> O CSV oficial de variáveis é gerado em RTB_003.

> **⚠️ RTB_005 a RTB_008 — Consolidação no PVSE v11:**
> A decisão de 28/05/2026 consolidou toda a análise PcD no notebook
> existente `06_pvse_hortolandia_v11.ipynb` em vez de criar notebooks
> separados. Os id_rastreabilidade RTB_005 a RTB_008 permanecem válidos
> e apontam para as seções correspondentes dentro do PVSE v11.

> **⚠️ RTB_009 — notebook utilitário:**
> Prefixo `99_` sinaliza que não é notebook analítico.
> Não deve ser referenciado em pipelines de produção.
> Usar exclusivamente para manutenção e migração de schema.

---

## 2. Rastreabilidade por Variável IVS-H e Schema do Corpus

| id_rastreabilidade | Variável / Campo | Definição resumida | Fonte | Coluna(s) relevante(s) | Risco de schema | Mitigação | Notebook que calcula | Documento de referência |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_010 | RT_01 | % famílias renda per capita menor ou igual a 1/2 SM | CadÚnico — renda autodeclarada | `vlr_renda_media_fam` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_001 RTB_003 | `dim_variavel_IVS_v01r7.md` → RT_01 |
| RTB_011 | RT_04 | % pessoas em domicílios renda menor ou igual a 1/2 SM dependentes de idosos | CadÚnico — composição familiar + renda | `vlr_renda_media_fam` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → RT_04 |
| RTB_012 | CH_05 | % mães chefes sem fund. completo, filho menor de 15 anos | CadÚnico — escolaridade + composição | `cod_escola_memb` + `ind_parc_membro_fam` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_05 |
| RTB_013 | CH_06 | Taxa analfabetismo — 15 anos ou mais | CadÚnico — escolaridade | `cod_escola_memb` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_06 |
| RTB_014 | CH_07 | % crianças em domicílios sem morador com fund. completo | CadÚnico — escolaridade + composição | `cod_escola_memb` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_07 |
| RTB_015 | PcD_flag | Flag consolidada de deficiência — qualquer `ind_def_*` ativo | CadÚnico — campos deficiência por membro | `ind_def_cegueira_memb` `ind_def_baixa_visao_memb` `ind_def_surdez_profunda_memb` `ind_def_surdez_leve_memb` `ind_def_fisica_memb` `ind_def_mental_memb` `ind_def_sindrome_down_memb` `ind_def_transtorno_mental_memb` | Médio — campos binários estáveis | ✅ **Resolvido 28/05/2026** — campos confirmados presentes na base dez/2025 | RTB_005 | `dependencia_humana_plano_v01.md` |
| RTB_016 | PcD_sem_apoio | Pessoa com deficiência sem nenhuma rede de apoio | CadÚnico — deficiência + ajuda | `flag_deficiencia == 1` + `ind_ajuda_nao_memb == 1` | Médio | ✅ **Resolvido 28/05/2026** — campos `ind_ajuda_*` confirmados presentes | RTB_006 | `dependencia_humana_plano_v01.md` |
| RTB_017 | PcD_crianca_sem_escola | Criança 6–14 anos com deficiência sem vínculo escolar | CadÚnico — deficiência + idade + escola | `flag_deficiencia == 1` + `dta_nasc_pessoa` (6–14) + `nom_escola_memb` vazio | Alto — campo escola pode ter preenchimento irregular | Tratar vazio vs nulo antes do filtro | RTB_007 | `dependencia_humana_plano_v01.md` |
| RTB_018 | PcD_baixa_renda | Família com PcD e renda per capita ≤ 1/2 SM | CadÚnico — deficiência + renda familiar | `flag_deficiencia == 1` + `vlr_renda_media_fam` ≤ 759 | Alto — renda autodeclarada | Mesma mitigação RT_01 | RTB_007 | `dependencia_humana_plano_v01.md` |
| RTB_019 | PcD_vulnerabilidade_critica | Indicador composto: PcD + sem apoio + baixa renda | CadÚnico — cruzamento triplo | `flag_deficiencia == 1` + `ind_ajuda_nao_memb == 1` + `vlr_renda_media_fam` ≤ 759 | Alto — cruzamento múltiplo | Executar RTB_005 e RTB_006 antes | RTB_008 | `dependencia_humana_plano_v01.md` |
| RTB_019b | `relevancia_estrategica` | Campo do schema do corpus jornalístico — classifica impacto estratégico do evento | Corpus IPSO-H — séries jornalísticas | Campo nos CSVs `series_jornalisticas/*.csv` | Baixo — campo texto controlado | Régua objetiva documentada (ver Seção 7 P13) | RTB_009 | `regras_de_classificacao_v10.4.md` |

> **Valores válidos para `relevancia_estrategica`:**
> `estrutural` — fonte primária externa (IPEA, IBGE, FBSP) + dado quantitativo + benchmark  
> `alta` — decisão de gestão permanente, obra, lei, sede, serviço, programa  
> `media` — ação programática recorrente, evento institucional sem infraestrutura permanente  
> `baixa` — ocorrência policial isolada, evento sem nexo territorial estabelecido  
>
> **Migração:** aplicada em 28/05/2026 via `99_manutencao_corpus.ipynb`
> em 116 arquivos / 564 eventos. Distribuição resultante:
> estrutural=1 · alta=94 · media=464 · baixa=5

---

## 3. Rastreabilidade por Output

| id_rastreabilidade | Arquivo de Output | tipo_output | Gerado por | periodo_referencia | Conteúdo | Pode ser commitado? | Observação LGPD |
| --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_020 | `outputs/tabelas/ivs_variaveis.csv` | exploratorio | RTB_001 | CadÚnico dez/2025 | Valor de RT_01 por família — inspeção inicial | Não | Dado individual — não oficial |
| RTB_021 | `outputs/tabelas/ivs_variaveis.csv` | analitico | RTB_003 | CadÚnico dez/2025 | Valor das 5 variáveis IVS-H por família/loteamento | Não | Dado pessoal — LGPD |
| RTB_022 | `outputs/tabelas/ivs_resultado_final.csv` | institucional | RTB_004 | CadÚnico dez/2025 | IVS-H composto por loteamento (agregado) | Sim | Dado agregado — sem identificação individual |
| RTB_023 | `outputs/tabelas/familias_vulneraveis.csv` | operacional | RTB_004 | CadÚnico dez/2025 | Famílias acima do limiar de vulnerabilidade | Não | Dado pessoal — LGPD — uso restrito à rede CRAS |
| RTB_024 | `outputs/graficos/distribuicao_renda.png` | institucional | RTB_003 | CadÚnico dez/2025 | Histograma renda per capita CadÚnico | Sim | Dado agregado — apresentável |
| RTB_025 | `outputs/graficos/vulnerabilidade_por_familia.png` | analitico | RTB_003 | CadÚnico dez/2025 | Distribuição de vulnerabilidade por família | Não | Pode revelar padrões individuais |
| RTB_026 | `outputs/graficos/ivs_por_nucleo.png` | institucional | RTB_004 | CadÚnico dez/2025 | IVS-H por núcleo — visualização territorial | Sim | Dado agregado — apresentável em reunião |
| RTB_027 | `outputs/tabelas/pcd_contagem_tipos.csv` | exploratorio | RTB_005 | CadÚnico dez/2025 | Contagem por tipo de deficiência — inspeção inicial | Não | Dado individual — exploratório |
| RTB_028 | `outputs/tabelas/pcd_sem_apoio.csv` | analitico | RTB_006 | CadÚnico dez/2025 | PcD sem rede de apoio — por família | Não | Dado pessoal — LGPD — uso restrito rede CRAS |
| RTB_029 | `outputs/tabelas/pcd_cruzamentos.csv` | analitico | RTB_007 | CadÚnico dez/2025 | PcD cruzado com idade, escola e renda | Não | Dado pessoal — LGPD |
| RTB_030 | `outputs/tabelas/pcd_vulnerabilidade_territorial.csv` | institucional | RTB_008 | CadÚnico dez/2025 | PcD + sem apoio + baixa renda — agregado por loteamento/núcleo | Sim | Dado agregado — apresentável em reunião |
| RTB_031 | `outputs/graficos/pcd_por_nucleo.png` | institucional | RTB_008 | CadÚnico dez/2025 | Ranking territorial PcD vulnerabilidade crítica por núcleo | Sim | Dado agregado — apresentável |

> **Atenção:** RTB_020 e RTB_021 geram o mesmo nome de arquivo
> (`ivs_variaveis.csv`) em notebooks diferentes. O de RTB_001 é
> exploratório e deve ser sobrescrito ou movido para subpasta
> `outputs/tabelas/exploratorio/` antes da execução de RTB_003.

---

## 4. Rastreabilidade por Tabela SQLite

| id_rastreabilidade | Tabela SQLite | Operação | Notebook responsável | Dimensão/Fato de origem | periodo_referencia | Documento GitHub |
| --- | --- | --- | --- | --- | --- | --- |
| RTB_032 | `STG_CADUNICO_RAW` | escrita | RTB_002 | Staging — sem dimensão | CadÚnico dez/2025 | `arquitetura_dados_IVS_IBGE_Horto_v10.md` |
| RTB_033 | `STG_CADUNICO_RAW` | leitura | RTB_001 RTB_003 RTB_005 RTB_006 RTB_007 RTB_008 | Staging — sem dimensão | CadÚnico dez/2025 | `arquitetura_dados_IVS_IBGE_Horto_v10.md` |
| RTB_034 | `DIM_LOTEAMENTO` | leitura | RTB_003 RTB_004 RTB_008 | `loteamento_dim_v03.md` | Planilha territorial v03 | `loteamento_dim_v03.md` |
| RTB_035 | `DIM_NUCLEO` | leitura | RTB_004 RTB_008 | `DIM_NUCLEO v01` | Definição analítica | `loteamento_dim_v03.md` |
| RTB_036 | `FATO_IVS_LOTEAMENTO` | escrita | RTB_004 | Fato de resultado analítico IVS-H | CadÚnico dez/2025 | `arquitetura_dados_IVS_IBGE_Horto_v10.md` `dim_variavel_IVS_v01r7.md` |
| RTB_037 | `FATO_DEPENDENCIA_LOTEAMENTO` | escrita | RTB_008 | Fato de resultado analítico — Camada Dependência Humana | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` |

---

## 5. Documentos GitHub e seus Papéis na Implementação

| id_rastreabilidade | Documento GitHub | Pasta | Papel na implementação | Notebooks dependentes |
| --- | --- | --- | --- | --- |
| RTB_040 | `dim_variavel_IVS_v01r7.md` | `01_modelagem_conceitual/` | Define as 16 variáveis, fases MVP, fórmulas, pesos | RTB_001 RTB_003 RTB_004 |
| RTB_041 | `arquitetura_dados_IVS_IBGE_Horto_v10.md` | `00_governança/` | Define o modelo de dados, camadas, fontes | RTB_002 RTB_004 |
| RTB_042 | `loteamento_dim_v03.md` | `01_modelagem_conceitual/` | Define loteamento como átomo espacial, núcleo como agregação | RTB_003 RTB_004 RTB_008 |
| RTB_043 | `ipst_h_v02.md` | `01_modelagem_conceitual/` | Define eixos do IPST-H — interpretação conjunta com IVS-H | RTB_004 |
| RTB_044 | `convencao_nomenclatura_v01.md` | `04_documentacao_tecnica/` | Governa nomes de notebooks, variáveis, tabelas e outputs | Todos |
| RTB_045 | `conceito_vulnerabilidade_v03.md` | `01_modelagem_conceitual/` | Fundamenta limites do CadÚnico, renda autodeclarada | RTB_001 RTB_003 |
| RTB_046 | `dependencia_humana_plano_v01.md` | `01_modelagem_conceitual/` | Define Camada de Dependência Humana — hipótese, fases, campos CadÚnico, KPIs executivos | RTB_005 RTB_006 RTB_007 RTB_008 |

---

## 6. Regras de Manutenção desta Matriz

1. **A matriz é atualizada quando um notebook novo é criado** — antes da primeira célula de código. Novo `id_rastreabilidade` deve ser atribuído.
2. **A matriz é atualizada quando um documento GitHub muda de versão** — atualizar a coluna de referência na Seção 5.
3. **A matriz é atualizada quando o schema do CadÚnico muda** — atualizar `Coluna(s) relevante(s)` na Seção 2 e registrar nova versão do dicionário.
4. **A matriz não substitui os documentos GitHub** — ela aponta para eles.
5. **Se houver conflito entre a matriz e um documento GitHub**, o documento GitHub prevalece.
6. **Outputs com dados individuais nunca são commitados** — coluna "Pode ser commitado" é definitiva.
7. **`periodo_referencia` é obrigatório** — nenhuma linha nova sem este campo preenchido.
8. **Notebooks com prefixo `99_` são utilitários** — não entram em pipelines analíticos nem são referenciados por outros notebooks.

---

## 7. Pendências de Mapeamento

| # | Status | Pendência | Impacto na matriz |
| --- | --- | --- | --- |
| P01 | 🔴 aberta | Confirmar nomes exatos das colunas CadÚnico para CH_05, CH_06, CH_07, RT_04 | Seção 2 — colunas provisórias |
| P02 | 🔴 aberta | Produzir carga de `DIM_LOTEAMENTO` e `DIM_NUCLEO` no SQLite | Seção 4 — RTB_034 e RTB_035 |
| P03 | 🔴 aberta | Vincular endereço CadÚnico ao `id_loteamento` | Notebooks RTB_003 e RTB_004 |
| P04 | 🔴 aberta | Definir limiar de vulnerabilidade para `familias_vulneraveis.csv` | RTB_023 — output RTB_004 |
| P05 | 🔴 aberta | Resolver conflito de nome `ivs_variaveis.csv` entre RTB_020 e RTB_021 | Seção 3 — nomes de output |
| P06 | 🔴 aberta | Formalizar `periodo_referencia` como campo no cabeçalho padrão do notebook | Seção 1 — coluna periodo_referencia |
| P07 | ✅ resolvida 28/05/2026 | Confirmar presença dos campos `ind_def_*` na base dez/2025 | RTB_015 — campos confirmados |
| P08 | ✅ resolvida 28/05/2026 | Confirmar presença dos campos `ind_ajuda_*` na base dez/2025 | RTB_016 — campos confirmados |
| P09 | 🔴 aberta | Tratar vazio vs nulo em `nom_escola_memb` antes de filtrar crianças sem escola | RTB_007 — risco de falso positivo |
| P10 | ✅ resolvida 28/05/2026 | Definir faixas etárias operacionais | RTB_007 — faixas: 0–5 / 6–14 / 15–24 / 25–59 / 60+ |
| P11 | 🔴 aberta | Criar documento `dependencia_humana_plano_v01.md` em `01_modelagem_conceitual/` | RTB_046 — documento referenciado ainda não existe |
| P12 | 🔴 aberta | Decidir nome final do produto analítico: "Atlas da Dependência Humana" vs "Índice de Fragilidade Familiar" vs "Camada de Dependência Humana" | Comunicação institucional |
| P13 | ✅ aplicado 28/05/2026 | Campo `relevancia_estrategica` adicionado ao schema do corpus | 116 arquivos / 564 eventos migrados via RTB_009. Régua documentada em RTB_019b. Distribuição: estrutural=1, alta=94, media=464, baixa=5. Revisão da régua recomendada após 30 dias adicionais de coleta. |
| P14 | 🔴 proposta | `tipo_relacao_variavel = estrutural` para métricas de violência letal | Refinamento avançado — avaliar após acumulação de eventos do tipo Atlas da Violência |
| P15 | 🔴 proposta | `dimensao_analitica = seguranca_territorial` como dimensão latente | Corpus está revelando organicamente dimensão ausente no IVS original — avaliar com 10+ eventos |
| P16 | 🔴 proposta | `CH_PROTECAO_INFANTOJUVENIL` como variável latente derivada | Para eventos que atravessam múltiplas dimensões de proteção à criança sem especificidade IVS única |

---

*Atlas Social de Hortolândia — Documento de Rastreabilidade*  
*"O notebook executa. O GitHub fundamenta. A matriz conecta."*
