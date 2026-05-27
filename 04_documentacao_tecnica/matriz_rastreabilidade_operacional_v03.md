
[matriz_rastreabilidade_operacional_v03.md](https://github.com/user-attachments/files/28312292/matriz_rastreabilidade_operacional_v03.md)
# Matriz de Rastreabilidade Operacional — Atlas Social de Hortolândia
**Versão:** v03  
**Data:** "27/05/2026"  
**Pasta:** `04_documentacao_tecnica/`  
**Leitura obrigatória:** antes de executar qualquer notebook

## Changelog v02 → v03

| Item | Mudança |
| --- | --- |
| Seção 1 | Adicionados RTB_005 a RTB_009 — Camada de Dependência Humana |
| Seção 2 | Adicionados RTB_015 a RTB_019 — variáveis PcD e rede de apoio |
| Seção 3 | Adicionados RTB_027 a RTB_031 — outputs da Camada de Dependência Humana |
| Seção 7 | Adicionadas pendências P07 a P12 |
| Motivação | Decisão de 27/05/2026: campos CadÚnico de deficiência e rede de apoio revelam camada analítica de vulnerabilidade invisível em indicadores clássicos de renda |

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
| RTB_005 | `05_pcd_flag_deficiencia.ipynb` | Criar coluna `flag_deficiencia` consolidando todos os campos `ind_def_*`. Contar pessoas e famílias com deficiência. | — (pré-camada) | `STG_CADUNICO_RAW` | — | `outputs/tabelas/pcd_contagem_tipos.csv` | exploratorio | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 1 |
| RTB_006 | `06_pcd_rede_apoio.ipynb` | Mapear rede de apoio. Calcular PcD sem ajuda. Calcular famílias com PcD sem apoio. Indicador crítico: `ind_def_* == 1` + `ind_ajuda_nao_memb == 1`. | — (camada dependência) | `STG_CADUNICO_RAW` | — | `outputs/tabelas/pcd_sem_apoio.csv` | analitico | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 2 |
| RTB_007 | `07_pcd_cruzamentos.ipynb` | Cruzar deficiência com: idade (primeira infância / criança / adulto / idoso), escola (CH_03 recorte PcD), renda (RT_01 recorte PcD). | CH_03 RT_01 (recortes PcD) | `STG_CADUNICO_RAW` | — | `outputs/tabelas/pcd_cruzamentos.csv` | analitico | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 4 |
| RTB_008 | `08_pcd_territorializacao.ipynb` | Cruzar resultado consolidado com loteamento / núcleo / RP. Gerar ranking territorial. Indicador principal: PcD + sem apoio + baixa renda + território. | — (camada dependência territorial) | `STG_CADUNICO_RAW` `DIM_LOTEAMENTO` `DIM_NUCLEO` | `FATO_DEPENDENCIA_LOTEAMENTO` | `outputs/tabelas/pcd_vulnerabilidade_territorial.csv` `outputs/graficos/pcd_por_nucleo.png` | institucional | CadÚnico dez/2025 | `dependencia_humana_plano_v01.md` — Fase 3 |

> **⚠️ RTB_001 — output exploratório:** o CSV gerado neste notebook
> tem finalidade de inspeção e validação, não de consumo analítico
> oficial. Não deve ser referenciado por outros notebooks.
> O CSV oficial de variáveis é gerado em RTB_003.

> **⚠️ RTB_005 a RTB_008 — Camada de Dependência Humana:**
> Esses notebooks NÃO substituem o IVS-H.
> Produzem camada complementar que captura vulnerabilidade invisível
> em indicadores clássicos de renda.
> O indicador de maior impacto institucional é o de RTB_008:
> **PcD + sem apoio + baixa renda + território**.

---

## 2. Rastreabilidade por Variável IVS-H

| id_rastreabilidade | Variável | Definição resumida | Fonte no CadÚnico | Coluna(s) relevante(s) | Risco de schema | Mitigação | Notebook que calcula | Documento de referência |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RTB_010 | RT_01 | % famílias renda per capita menor ou igual a 1/2 SM | CadÚnico — renda autodeclarada | `vlr_renda_media_fam` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_001 RTB_003 | `dim_variavel_IVS_v01r7.md` → RT_01 |
| RTB_011 | RT_04 | % pessoas em domicílios renda menor ou igual a 1/2 SM dependentes de idosos | CadÚnico — composição familiar + renda | `vlr_renda_media_fam` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → RT_04 |
| RTB_012 | CH_05 | % mães chefes sem fund. completo, filho menor de 15 anos | CadÚnico — escolaridade + composição | `cod_escola_memb` + `ind_parc_membro_fam` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_05 |
| RTB_013 | CH_06 | Taxa analfabetismo — 15 anos ou mais | CadÚnico — escolaridade | `cod_escola_memb` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_06 |
| RTB_014 | CH_07 | % crianças em domicílios sem morador com fund. completo | CadÚnico — escolaridade + composição | `cod_escola_memb` + `dta_nasc_pessoa` | Alto — dependente de dicionário oficial | Versionar dicionário CadÚnico utilizado (dez/2025) | RTB_003 | `dim_variavel_IVS_v01r7.md` → CH_07 |
| RTB_015 | PcD_flag | Flag consolidada de deficiência — qualquer `ind_def_*` ativo | CadÚnico — campos deficiência por membro | `ind_def_cegueira_memb` `ind_def_baixa_visao_memb` `ind_def_surdez_profunda_memb` `ind_def_surdez_leve_memb` `ind_def_fisica_memb` `ind_def_mental_memb` `ind_def_sindrome_down_memb` `ind_def_transtorno_mental_memb` | Médio — campos binários estáveis | Verificar presença dos campos na carga | RTB_005 | `dependencia_humana_plano_v01.md` |
| RTB_016 | PcD_sem_apoio | Pessoa com deficiência sem nenhuma rede de apoio | CadÚnico — deficiência + ajuda | `flag_deficiencia == 1` + `ind_ajuda_nao_memb == 1` | Médio | Verificar dicionário `ind_ajuda_*` | RTB_006 | `dependencia_humana_plano_v01.md` |
| RTB_017 | PcD_crianca_sem_escola | Criança 6–14 anos com deficiência sem vínculo escolar | CadÚnico — deficiência + idade + escola | `flag_deficiencia == 1` + `dta_nasc_pessoa` (6–14) + `nom_escola_memb` vazio | Alto — campo escola pode ter preenchimento irregular | Tratar vazio vs nulo antes do filtro | RTB_007 | `dependencia_humana_plano_v01.md` |
| RTB_018 | PcD_baixa_renda | Família com PcD e renda per capita ≤ 1/2 SM | CadÚnico — deficiência + renda familiar | `flag_deficiencia == 1` + `vlr_renda_media_fam` ≤ 759 | Alto — renda autodeclarada | Mesma mitigação RT_01 | RTB_007 | `dependencia_humana_plano_v01.md` |
| RTB_019 | PcD_vulnerabilidade_critica | Indicador composto: PcD + sem apoio + baixa renda | CadÚnico — cruzamento triplo | `flag_deficiencia == 1` + `ind_ajuda_nao_memb == 1` + `vlr_renda_media_fam` ≤ 759 | Alto — cruzamento múltiplo | Executar RTB_005 e RTB_006 antes | RTB_008 | `dependencia_humana_plano_v01.md` |

> **Nota sobre risco de schema:** todas as colunas listadas acima foram
> identificadas no dicionário CadÚnico versão dez/2025.
> Qualquer atualização do Ministério que renomeie ou remova essas colunas
> invalida os notebooks sem aviso.
> Mitigação obrigatória: ao iniciar nova carga, verificar versão do
> dicionário e registrar no cabeçalho do notebook.

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

---

## 7. Pendências de Mapeamento

| # | Pendência | Impacto na matriz |
| --- | --- | --- |
| P01 | Confirmar nomes exatos das colunas CadÚnico para CH_05, CH_06, CH_07, RT_04 | Seção 2 — colunas provisórias |
| P02 | Produzir carga de `DIM_LOTEAMENTO` e `DIM_NUCLEO` no SQLite | Seção 4 — RTB_034 e RTB_035 |
| P03 | Vincular endereço CadÚnico ao `id_loteamento` | Notebooks RTB_003 e RTB_004 |
| P04 | Definir limiar de vulnerabilidade para `familias_vulneraveis.csv` | RTB_023 — output RTB_004 |
| P05 | Resolver conflito de nome `ivs_variaveis.csv` entre RTB_020 e RTB_021 | Seção 3 — nomes de output |
| P06 | Formalizar `periodo_referencia` como campo no cabeçalho padrão do notebook | Seção 1 — coluna periodo_referencia |
| P07 | Confirmar presença e preenchimento dos campos `ind_def_*` na base dez/2025 | RTB_005 — risco de campos vazios ou ausentes |
| P08 | Confirmar presença e preenchimento dos campos `ind_ajuda_*` na base dez/2025 | RTB_006 — risco de campos vazios ou ausentes |
| P09 | Tratar vazio vs nulo em `nom_escola_memb` antes de filtrar crianças sem escola | RTB_007 — risco de falso positivo |
| P10 | Definir faixas etárias operacionais: primeira infância / criança / adulto / idoso | RTB_007 — cruzamento com idade |
| P11 | Criar documento `dependencia_humana_plano_v01.md` em `01_modelagem_conceitual/` | RTB_046 — documento referenciado ainda não existe |
| P12 | Decidir nome final do produto analítico: "Atlas da Dependência Humana" vs "Índice de Fragilidade Familiar" vs "Camada de Dependência Humana" | Comunicação institucional — impacto nas secretarias |

---

*Atlas Social de Hortolândia — Documento de Rastreabilidade*  
*"O notebook executa. O GitHub fundamenta. A matriz conecta."*
