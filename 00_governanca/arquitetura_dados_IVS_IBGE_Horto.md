[arquitetura_dados_IVS_IBGE_Horto_v12.md](https://github.com/user-attachments/files/27607295/arquitetura_dados_IVS_IBGE_Horto_v12.md)
[arquitetura_dados_IVS_IBGE_Horto_v11 (1).md](https://github.com/user-attachments/files/27360713/arquitetura_dados_IVS_IBGE_Horto_v11.1.md)
| v12 | "11/05/2026" | Cabeçalho de escopo adicionado; seção "Conteúdo migrado para o core" incluída; sem alteração de conteúdo. |

*Documento de governança — 00_governanca/*
*Atlas Social de Hortolândia — uso interno*

# Arquitetura de Obtenção de Dados — IVS / IBGE / Hortolândia
**Versão:** v12  
**Data:** "11/05/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 00_governanca  
**Origem:** Pesquisa documental — `arquitetura_obtencao_de_dados_IVS.docx`

---

> **Escopo deste documento:** Registro histórico, narrativo e institucional da arquitetura de dados do IVS-H. Inclui estado operacional do MVP, pendências, logs de versão e decisões com contexto. O conteúdo arquitetural permanente foi extraído para o repositório core — ver seção abaixo.

---

## Conteúdo migrado para o core

Os documentos abaixo integram o núcleo metodológico permanente do Atlas Social e estão versionados no repositório `Atlas-Social-de-Hortolandia-core`:

| Arquivo no core | Conteúdo extraído deste documento |
|---|---|
| `metodologia/arquitetura_dados_ivsh.md` | Função do IVS-H, três instrumentos, escopo territorial, premissas, fontes, fórmula, pesos, Camada 3, decisão temporal |

> O repositório core é privado. O conteúdo aqui permanece como registro histórico completo e rastreável.

---

> Este arquivo documenta **de onde vêm os dados** necessários para construir
> o IVS-H (Índice de Vulnerabilidade Social de Hortolândia).
> Não é modelagem conceitual — é decisão de governança de fontes.
> Responde à pergunta: *quais arquivos baixar, de quais sistemas, com qual filtro?*

---

## 0. Escopo Territorial do IVS-H

Este projeto opera em três escalas territoriais distintas, cada uma com finalidade própria:

| Escala | Índice | Finalidade |
|--------|--------|------------|
| Brasil | IVS IPEA | Referência metodológica e comparação nacional |
| Município | IVS-H municipal | Posicionamento de Hortolândia no contexto regional |
| Território | IVS-H por loteamento / núcleo / CRAS | Instrumento de gestão pública local |

> A escala territorial (loteamento / núcleo / CRAS) é o diferencial
> estratégico do IVS-H. É nela que a política pública opera —
> e é nela que o Atlas Social de Hortolândia entrega valor.

### Unidade primária de análise

O IVS-H adota a seguinte hierarquia de granularidade territorial:

| prioridade | unidade | quando usar |
|------------|---------|-------------|
| 1 (primária) | **loteamento** | quando os dados permitem desagregação por loteamento |
| 2 (fallback) | setor censitário | quando o dado vem do IBGE e não há correspondência direta com loteamento |
| 3 (fallback) | território de CRAS | para análise de cobertura de serviços socioassistenciais |

> O loteamento é a unidade oficial do modelo porque é o menor território
> com identidade administrativa reconhecida pela PMH e pelo CadÚnico.
> Setores censitários são unidades IBGE — podem cruzar loteamentos.
> A correspondência entre setores censitários e loteamentos será resolvida
> na etapa de geolocalização (Produto 3).

---

## 0.1 Contexto Territorial — Hortolândia no Arranjo Populacional de Campinas

**Fonte:** IBGE. *Arranjos Populacionais e Concentrações Urbanas do Brasil*. 2a ed. Rio de Janeiro: IBGE, 2016. Tabela 1.1, p. 78.

O IBGE classifica Hortolândia como integrante do **Arranjo Populacional de Campinas/SP** —
uma das 11 grandes concentrações urbanas brasileiras na faixa de 1 a 2,5 milhões de
habitantes. Em 2010, o arranjo somava **1.874.442 habitantes** e PIB de **R$ 71,4 bilhões**.

> O índice de integração de 0,42 indica **integração funcional elevada** com o arranjo
> regional. A natureza da relação (dormitório, polo ou município integrado) requer o
> saldo pendular completo (entradas - saídas). Ver `dim_dinamica_metropolitana_v03.md`.

| Atributo | Valor (Censo 2010) |
|---|---|
| Código IBGE | 3519071 |
| População total | 192.692 hab. |
| Núcleo do arranjo? | Não (núcleo = Campinas) |
| Pessoas que trabalham/estudam em outros municípios | 58.472 |
| Índice de integração | **0,42** |
| Mancha urbanizada contígua com Campinas | Sim |
| Município desmembrado após 1988 | Sim (separou-se de Sumaré em 1991) |
| Nível de integração | 1 (integração direta com Campinas) |

**Três implicações diretas para o IVS-H:**

**a)** Aproximadamente 30% da população trabalha ou estuda em outro município.
Renda, emprego e mobilidade atravessam fronteiras municipais.

**b)** O desmembramento de 1991 explica inconsistências territoriais —
incluindo os 12 loteamentos em dois CRAS e os 39 sem correspondência no cadastro PMH.

**c)** Posicionamento numa concentração urbana de escala regional torna ainda mais
relevante identificar quem fica de fora dessa dinâmica.

---

## 1. Premissas Fundamentais

### 1.1 IBGE e IPEA têm papéis distintos

| Organização | Papel |
|-------------|-------|
| IBGE | Fornece os dados brutos — Censo Demográfico, agregados por município |
| IPEA | Calcula o IVS a partir dos dados brutos do IBGE |

> O IVS não é produzido pelo IBGE. Ele foi desenvolvido pelo IPEA
> no projeto Atlas da Vulnerabilidade Social (2015).

### 1.2 O IVS não é calculado anualmente

| Ano | Situação |
|-----|----------|
| 2000 | Disponível no Atlas IPEA |
| 2010 | Disponível no Atlas IPEA |
| 2022 | Censo concluído — processamento do IVS em andamento no IPEA |

> **Esta é a razão de existência do IVS-H:**
> o município não pode esperar 10 anos entre medições.
> O IVS-H substitui a periodicidade censitária por atualização anual
> via dados administrativos municipais.

### 1.3 O código IBGE de Hortolândia

```
codigo_municipio = 3519071
```

> Aviso: este é o código correto, confirmado pela base do IBGE.
> Código incorreto resulta em dados de outro município sem aviso de erro.

**Confirmação oficial — BET/IBGE 2024:**

| campo | valor |
|-------|-------|
| UF | 35 — São Paulo |
| Região Geográfica Intermediária | 3510 — Campinas |
| Região Geográfica Imediata | 350038 — Campinas |
| Código Município Completo | **3519071** — Hortolândia |

---

## 1.4 Função do IVS-H

O IVS-H é um índice composto destinado a:

- **Identificar territórios prioritários** para intervenção pública — apontando onde a
  vulnerabilidade é mais intensa e onde os recursos devem ser concentrados
- **Monitorar a evolução da vulnerabilidade social ao longo do tempo** — produzindo
  séries históricas comparáveis entre ciclos anuais e entre anos censitários
- **Avaliar o impacto de políticas públicas municipais** — mensurando se as intervenções
  de Assistência Social, Saúde, Educação e Desenvolvimento Econômico reduzem efetivamente
  a vulnerabilidade nos territórios onde atuam

> O IVS-H não é apenas diagnóstico — é instrumento de gestão.
> Ele transforma dados dispersos em secretarias num único indicador territorial
> que permite ao prefeito e às secretarias convergirem em torno da mesma realidade.

### 1.5 Três Instrumentos Complementares do Atlas Social

O IVS-H integra uma arquitetura de três instrumentos distintos — metodologicamente separados,
narrativamente complementares:

| Instrumento | O que mede | Base | Natureza |
|-------------|------------|------|----------|
| **IVS-H** | Vulnerabilidade estrutural da população | CadÚnico + IBGE | Quantitativo |
| **IPST-H** | Pressão mensurável sobre o Estado — sobrecarga da rede, lacunas de cobertura | Dados administrativos | Quantitativo |
| **IPSO-H** | Pressão social observada — o que está acontecendo agora | Corpus jornalístico (Tribuna Liberal) | Qualitativo / narrativo |

> "O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde ela se transforma em pressão
> mensurável sobre o Estado. O IPSO-H mostra o que está acontecendo agora."

**Os três instrumentos não se mesclam metodologicamente.** A integração entre eles é narrativa:
o IPSO-H abre apresentações e valida qualitativamente o que o IVS-H e o IPST-H medem.

**Matriz de interpretação — IVS-H × IPST-H:**

| IVS | IPST | Interpretação |
|-----|------|---------------|
| Alto | Alto | Alta vulnerabilidade + Estado pressionado |
| Alto | Baixo | Vulnerabilidade alta, rede ainda absorvendo |
| Baixo | Alto | Pressão operacional (fluxo / mobilidade / rede insuficiente) |
| Baixo | Baixo | Situação estável |

> IPST-H: `01_modelagem_conceitual/ipst_h_modelo_v01.md` (a produzir).
> IPSO-H: `00_governanca/corpus_jornalistico/README_corpus_v1.5.md`.

---

## 2. O que o Censo 2022 fornece para o IVS-H

| Dimensão | Variáveis com insumos no Censo | Variáveis a complementar |
|----------|-------------------------------|--------------------------|
| Infraestrutura Urbana | Abastecimento de água, esgoto, coleta de lixo | Tempo de deslocamento casa-trabalho |
| Capital Humano | Analfabetismo, frequência escolar, estrutura etária | Mortalidade infantil (SIM/DATASUS) |
| Renda e Trabalho | Renda domiciliar per capita menor ou igual a 1/2 SM | Desocupação, carteira assinada (CAGED / CadÚnico) |

---

## 2.1 Mobilidade Pendular como Variável Proxy de Renda e Trabalho

A mobilidade pendular é formalizada como variável da dimensão **Renda e Trabalho**
do IVS-H, não de Infraestrutura Urbana. Ela mede o custo de acesso ao emprego
e a dependência estrutural de mercados de trabalho externos ao município.

| código | variável | dimensão | fonte | disponibilidade |
|--------|----------|----------|-------|-----------------|
| RT_mobilidade_pendular_saida | % da população ocupada que trabalha fora do município | Renda e Trabalho | IBGE Censo 2022 — SIDRA Tab. 10330 + Arranjos Populacionais 2010 | proxy disponível |
| RT_mobilidade_pendular_longa | % com deslocamento habitual acima de 1 hora | Renda e Trabalho | IBGE Censo 2022 — SIDRA Tab. 10330 | disponível |

**Valores disponíveis para Hortolândia (2022):**

| variável | valor | base de cálculo |
|----------|-------|-----------------|
| RT_mobilidade_pendular_saida | ~62% (proxy) | 58.472 saídas 2010 / 93.791 trabalhadores 2022 |
| RT_mobilidade_pendular_longa | **12,7%** | 11.909 de 93.791 trabalhadores |

> O valor de RT_mobilidade_pendular_saida é uma proxy que combina anos distintos
> (saídas 2010, total de trabalhadores 2022). O valor exato aguarda os microdados
> do Censo 2022 — sem previsão de liberação (consulta formal ao IBGE, "17/03/2026").
> Ver `dim_dinamica_metropolitana_v03.md`, Seção 6 (Nota Metodológica).

---

## 3. Os 7 Arquivos IBGE Necessários para a Base Municipal Inicial do IVS-H

Disponíveis em: `https://www.ibge.gov.br/estatisticas/sociais/populacao/22827-censo-demografico-2022.html`

Arquivos disponíveis em `filtrado_hortolandia/`.

| # | Arquivo | Dimensão IVS-H |
|---|---------|----------------|
| 3.1 | `Agregados_por_municipios_basico_BR_20250417.zip` | Base para denominadores |
| 3.2 | `Agregados_por_municipios_alfabetizacao_BR.zip` | Capital Humano — CH_analfabetismo |
| 3.3 | `Agregados_por_municipios_demografia_BR.zip` | Capital Humano — CH_criancas, CH_jovens |
| 3.4a | `domicilio1` | Infraestrutura Urbana — IU_agua, IU_esgoto, IU_lixo |
| 3.4b | `domicilio2` | Infraestrutura Urbana — idem |
| 3.4c | `domicilio3` | Infraestrutura Urbana — idem |
| 3.5 | `Agregados_por_municipios_rendimento_BR.zip` | Renda e Trabalho |

> Os três arquivos domicilio1/2/3 foram baixados e filtrados. A distribuição exata
> das variáveis entre eles deve ser verificada via dicionário antes de descartar qualquer um.

> **Escopo desta seção:** os 7 arquivos cobrem a base municipal inicial do IVS-H
> (variáveis censitárias agregadas por município). O universo completo de fontes do
> projeto inclui adicionalmente: SIDRA (tabelas temáticas), CadÚnico, CAGED,
> BigQuery/IPEA, tabelas de favelas e comunidades urbanas, e dados de populações
> específicas (TEA, quilombola, indígena). Ver pipeline completo na Seção 5.

> **Confirmado em "13/03/2026":** a renda domiciliar per capita por setor censitário
> **não está publicada pelo IBGE** no Censo 2022 até esta data.
> **Decisão:** RT_01 (renda per capita menor ou igual a 1/2 SM) terá o
> **CadÚnico como fonte primária confirmada** para o IVS-H.

---

## 3.1 CadÚnico como Fonte Primária — Estado Atual (Fase 1 MVP)

**Referência:** Notebook `RTB_002` — `02_tratamento_cadunico.ipynb`
**Data da última execução:** "21/04/2026"
**Período de referência:** `2025_12`

| atributo | valor confirmado |
|----------|-----------------|
| Registros totais | **72.424** indivíduos |
| Colunas disponíveis | **211** variáveis |
| Camada de entrada | `dados/cadunico/01_bruto/2025_12/cadunico.csv` |
| Camada de saída | `dados/cadunico/02_limpo/2025_12/cadunico_limpo.csv` |

**RT_01 — resultado preliminar:**

| variável | resultado | observação |
|----------|-----------|------------|
| RT_01 (renda per capita ≤ 1/2 SM) | **~60,5%** das famílias cadastradas | Calculado sobre população registrada no CadÚnico |

> **Nota metodológica — RT_01 como proxy de população cadastrada:**
> O IVS-H Fase 1 mede vulnerabilidade da **população registrada no CadÚnico**, não da
> população total do município. Isso não é limitação — é vantagem operacional:
> toda pessoa flaggada pelo índice já está dentro do alcance da política municipal.
> A cobertura do CadÚnico em relação à população total é variável de contexto,
> não componente do índice.

**Bloqueio crítico — linkage endereço → loteamento:**

O cálculo do IVS-H por loteamento (granularidade territorial do Produto 2) está
bloqueado pela ausência da tabela de correspondência **CEP → `cod_loteamento`**.

| pendência | responsável | status |
|-----------|-------------|--------|
| Exportação de CEP do CadÚnico | Sandra (Inclusão) | pendente |
| Alinhamento `endereço → id_loteamento` | Cláudia / Jesus José | pendente |
| DE-PARA CEP → `cod_loteamento` | Arthur (SIG) | pendente |

> Enquanto o linkage não estiver resolvido, o IVS-H Fase 1 pode ser calculado
> apenas no nível municipal (agregado), não por loteamento.

---

## 4. Filtro Municipal

```python
codigo_municipio = "3519071"   # Hortolândia — NAO alterar
df_hortolandia = df[df["codigo_municipio"] == codigo_municipio]
```

---

## 5. Pipeline Analítico — IVS-H

```
raw_IBGE/
  ├─ agregados_basico.zip
  ├─ agregados_alfabetizacao.zip
  ├─ agregados_demografia.zip
  ├─ agregados_domicilios1.zip
  ├─ agregados_domicilios2.zip
  ├─ agregados_domicilios3.zip
  └─ agregados_rendimento.zip
        ↓  filtro: codigo_municipio = 3519071
filtrado_hortolandia/             (7 arquivos gerados em "12/03/2026")
  ├─ basico_3519071.csv
  ├─ alfabetizacao_3519071.csv
  ├─ demografia_3519071.csv
  ├─ domicilio1_3519071.csv
  ├─ domicilio2_3519071.csv
  ├─ domicilio3_3519071.csv
  └─ rendimento_3519071.csv
        ↓  mapeamento para variáveis IVS-H
variaveis_ivsh/
  ├─ infraestrutura_urbana.csv
  ├─ capital_humano.csv
  └─ renda_trabalho.csv
        ↓  cálculo do índice composto
IVS-H
  ├─ ivsh_municipio.csv
  └─ ivsh_loteamento.csv          ← bloqueado por linkage endereço→loteamento

referencias_ipea/
  └─ ivs_ipea_hortolandia/
       └─ bq-results-20260313-195741.csv   (IVS IPEA 2000/2010 — Google BigQuery)

pesos/
  ├─ pesos_IVS_oficial/
  └─ pesos_IVS_H/
```

---

## 5.1 Fórmula do IVS-H

```
IVS_H = w1 * IU + w2 * CH + w3 * RT
```

Onde:

| símbolo | significado | peso IPEA (referência) | peso IVS-H (hipótese local) |
|---------|-------------|------------------------|------------------------------|
| IU | Infraestrutura Urbana | 33% | ~15-20% |
| CH | Capital Humano | 33% | ~40-45% |
| RT | Renda e Trabalho | 33% | ~35-40% |
| w1, w2, w3 | pesos das dimensões | — | definidos em `pesos/pesos_IVS_H/` |

> Os pesos do IVS-H são calibrados à realidade local de Hortolândia.
> A justificativa empírica para cada peso está em `ivs_vs_ivsh_comparativo_v08.md`.
> Os pesos do IPEA (1/3 cada) são preservados na pasta `pesos/pesos_IVS_oficial/`
> como referência para garantir comparabilidade nacional.

**Cada dimensão é calculada como média ponderada das variáveis que a compõem:**

```
IU = média ponderada (IU_agua, IU_esgoto, IU_lixo)
CH = média ponderada (CH_analfabetismo, CH_criancas, CH_gravidez, CH_maes_chefes)
RT = média ponderada (RT_renda_pc, RT_ocupacao, RT_informalidade, RT_idosos,
                      RT_mobilidade_pendular_saida, RT_mobilidade_pendular_longa)
```

> **Decisão metodológica — mobilidade pendular:**
> A mobilidade pendular integra a dimensão **Renda e Trabalho (RT)**, não
> Infraestrutura Urbana. Justificativa: as variáveis RT_mobilidade_pendular_saida
> e RT_mobilidade_pendular_longa medem inserção regional no mercado de trabalho
> e custo de acesso ao emprego — fenômenos de renda e trabalho, não atributos
> físicos da cidade. Essa posição é mantida em todo o projeto.
>
> Especificação completa e fechada das variáveis: `dim_variavel_IVS_v01r7.md`.

---

## 6. O IVS do IPEA para Hortolândia — Referência Histórica

Dados obtidos em "13/03/2026" via Google BigQuery:
`basedosdados.br_ipea_avs.municipio` | Código: `3519071`

| Dimensão | 2000 | 2010 | Variação | Interpretação |
|----------|------|------|----------|---------------|
| IVS Geral | 0,399 | 0,293 | -0,106 | Melhora significativa |
| Infraestrutura Urbana | 0,349 | 0,354 | +0,005 | Estável (baixo poder discriminatório) |
| Capital Humano | 0,445 | 0,258 | -0,187 | Maior melhora — confirma peso elevado no IVS-H |
| Renda e Trabalho | 0,405 | 0,266 | -0,139 | Melhora expressiva |

> Quanto menor o índice, menor a vulnerabilidade.

---

## 6.1 Dados SIDRA / Censo 2022 — Infraestrutura Urbana e Populações Específicas

**Fonte:** IBGE. *Censo Demográfico 2022*. SIDRA. Acesso em "16/03/2026" e "17/03/2026".

### 6.1.1 Base domiciliar do município

| indicador | valor | fonte SIDRA |
|-----------|-------|-------------|
| População total residente | 236.641 | Tab. 10089 |
| Domicílios particulares permanentes ocupados | 80.802 | Tab. 10107 |
| Moradores em domicílios particulares | 232.196 | Tab. 10107 |

### 6.1.2 Variável IU_esgoto — confirmada (Tabela 10105)

| tipo de esgotamento | domicílios | % |
|---------------------|-----------|---|
| Rede geral / fossa ligada à rede | 77.858 | **96,4%** |
| Outros | 2.944 | 3,6% |

### 6.1.3 Variável IU_lixo — confirmada (Tabela 10109)

| destino | domicílios | % |
|---------|-----------|---|
| Coletado (domicílio + caçamba) | 80.774 | **99,9%** |
| Outros | 28 | 0,03% |

### 6.1.4 Variável IU_banheiro — confirmada (Tabela 10107)

| indicador | domicílios | % |
|-----------|-----------|---|
| Com banheiro de uso exclusivo | 80.773 | **99,96%** |

### 6.1.5 Diagnóstico da população quilombola — Censo 2022

| indicador | valor |
|-----------|-------|
| Pessoas quilombolas residentes | **6** |
| Domicílios com pelo menos 1 quilombola | **6** |
| Localização | todos urbanos, dispersos |
| Território quilombola oficialmente delimitado | nenhum |
| Taxa de alfabetização quilombola (15+) | 100% |

### 6.1.6 Diagnóstico da população indígena — Censo 2022 (Tabela 10340)

| indicador | valor |
|-----------|-------|
| Pessoas indígenas — município total | **255** (119 homens / 136 mulheres) |
| Pessoas indígenas — em aglomerados subnormais | **10** (4 homens / 6 mulheres) |
| Moradores totais do município (base comparativa) | 224.177 |
| % da população total | **0,11%** |

### 6.1.7 Aglomerados subnormais — IU_esgoto discrimina no território

| tipo de esgotamento | Aglomerados (%) | Município geral (%) |
|---------------------|-----------------|---------------------|
| Rede geral / fossa ligada | **29,21%** | 97,59% |
| Fossa rudimentar | **14,49%** | 0,46% |
| Rio / córrego / mar | **21,01%** | 0,45% |
| Vala | 0,44% | 0,07% |

> **Decisão arquitetural:** o peso reduzido de Infraestrutura Urbana (~15-20%) no
> IVS-H municipal se mantém. Porém, a granularidade por loteamento vai revelar
> concentração crítica nos aglomerados. A variável IU_esgoto deve permanecer
> no cálculo com nota de que seu poder discriminatório é **territorial, não médio**.

---

## 6.2 Diagnóstico da População com TEA — Censo 2022

| indicador | valor |
|-----------|-------|
| Pessoas com TEA | **2.806** (1,2% da população) |
| Domicílios com pelo menos 1 morador com TEA | **2.347** (2,9% dos domicílios) |
| Taxa de escolarização TEA — 15-17 anos | **100%** vs 84,5% geral |

---

## 7. IVS Nacional × IVS-H — Posicionamento Estratégico

| Dimensão | IVS Nacional (IPEA) | IVS-H (este projeto) |
|----------|---------------------|----------------------|
| Escala | Brasil — setores censitários | Hortolândia — loteamentos |
| Periodicidade | Decenal (anos censitários) | Anual (dados administrativos) |
| Fonte principal | Censo Demográfico IBGE | CadÚnico + CAGED + Saúde + Educação |
| Finalidade | Fotografia nacional comparativa | Instrumento de gestão pública local |
| Atualização | A cada Censo | A cada ano — IVS-H 2022, 2023, 2024, 2025... |

---

## 8. Decisão Arquitetural — Dimensão Temporal das Tabelas Fato

**Data da decisão:** "17/03/2026"

### 8.2 Campos obrigatórios nas tabelas fato

```sql
data_referencia     DATE
ano_referencia      INTEGER
fonte_calculo       TEXT        -- 'CENSO_2022' | 'CADUNICO_202512' | 'SNIS_2020'
tipo_ivs            TEXT        -- 'IVS_BASE' | 'IVS_H_PARCIAL' | 'IVS_H_COMPLETO'
versao_calculo      TEXT        -- ex: 'v01'
```

### 8.3 Exemplos de registros temporais

| Produto | fonte_calculo | data_referencia | tipo_ivs |
|---------|--------------|-----------------|----------|
| IVS IPEA 2000 | CENSO_2000 | 2000-08-01 | IVS_BASE |
| IVS IPEA 2010 | CENSO_2010 | 2010-08-01 | IVS_BASE |
| IVS-H Parcial (5 vars CadÚnico) | CADUNICO_202512 | 2025-12-31 | IVS_H_PARCIAL |
| IVS-H Expandido | CENSO_2022 + CADUNICO_202512 | 2025-12-31 | IVS_H_COMPLETO |

---

## 9. Próximos Passos

| # | Ação | Responsável | Status |
|---|------|-------------|--------|
| 1 | Baixar os 7 arquivos IBGE | Ailton (Debian) | ✅ concluído "12/03/2026" |
| 2 | Obter IVS IPEA 2000/2010 via BigQuery | Ailton (Debian) | ✅ concluído "13/03/2026" |
| 3 | Aplicar filtro 3519071 e gerar filtrado_hortolandia/ | Ailton (Debian) | ✅ concluído "12/03/2026" |
| 4 | Carregar e validar CadÚnico 2025_12 (RTB_002) | Ailton (Windows) | ✅ concluído "21/04/2026" |
| 5 | Calcular RT_01 sobre CadÚnico | Ailton (Windows) | ✅ concluído — ~60,5% das famílias cadastradas |
| 6 | Resolver linkage endereço → loteamento (DE-PARA CEP → cod_loteamento) | Sandra / Cláudia / Jesus José | 🔴 bloqueio crítico — pendente |
| 7 | Verificar dicionário domicilio1/2/3 | Ailton + Claude | pendente |
| 8 | Mapear variáveis IBGE para dim_variavel_IVS | Ailton + Claude | pendente |
| 9 | Definir pesos IVS-H | Ailton + Claude | pendente |
| 10 | Popular schema_IVS.sql com dados reais | Ailton (Debian) | aguarda 6 e 7 |
| 11 | Incluir campos temporais no DDL das tabelas fato | Ailton (Debian) | pendente |
| 12 | Calcular IVS-H Fase 1 por loteamento | Ailton (Windows) | 🔴 bloqueado — depende de #6 |

---

## Log de Alterações

| versão | data | alterações |
|--------|------|------------|
| v01 | "12/03/2026" | Criação |
| v02 | "12/03/2026" | Seção 0: escopo territorial |
| v03 | "13/03/2026" | CadÚnico como fonte de RT_01; IVS IPEA via BigQuery |
| v04 | "15/03/2026" | Contexto Arranjo Populacional de Campinas |
| v05 | "16/03/2026" | Confirmação BET/IBGE 2024 |
| v06 | "16/03/2026" | Dados SIDRA Censo 2022 — base domiciliar e IU |
| v07 | "16/03/2026" | Diagnóstico TEA |
| v08 | "17/03/2026" | População indígena; aglomerados subnormais; dimensão temporal das tabelas fato |
| v09 | "17/03/2026" | Função do IVS-H; fórmula formal; unidade primária de análise |
| v10 | "17/03/2026" | Mobilidade pendular consolidada em RT; correções de consistência |
| v11 | "04/05/2026" | Três instrumentos complementares (IVS-H / IPST-H / IPSO-H); estado atual Fase 1 MVP; bloqueios críticos |
| v12 | "11/05/2026" | Cabeçalho de escopo adicionado; seção "Conteúdo migrado para o core" incluída |

---

*Documento de governança — 00_governanca/*
*Atlas Social de Hortolândia — uso interno*
