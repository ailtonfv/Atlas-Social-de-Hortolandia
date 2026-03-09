# 01 — Modelagem Conceitual

Esta pasta contém os documentos que definem **o que o sistema precisa conhecer** antes de qualquer linha de código ou esquema de banco de dados.

A modelagem conceitual responde à pergunta: quais são as entidades do mundo real que o projeto precisa representar, e como elas se relacionam?

---

## Hierarquia territorial (DEFINITIVA)

```
Município
  └── Regiões de Planejamento (6 RPs)
        └── Loteamentos (141 oficiais)
              └── Núcleo (agrupamento operacional — área de abrangência do CRAS)
```

> **Nota:** A entidade "Território" foi eliminada do modelo. O Núcleo não é uma divisão geográfica formal — é o conjunto de loteamentos cobertos por uma unidade de serviço (CRAS). Não existe `DIM_TERRITORIO` neste projeto.

---

## Conteúdo atual

### Dimensões de pessoas e famílias

#### `dim_pessoa_v01.md`
Entidade central do modelo analítico. Representa cada indivíduo identificado por CPF e/ou NIS. Unidade mínima de análise — toda cadeia analítica começa pela Pessoa.

#### `dim_familia_v01.md`
Agregação de pessoas que compartilham domicílio e constam no CadÚnico sob um mesmo `cod_familiar_fam`. A família é a unidade de concessão de benefícios como Bolsa Família e cesta básica.

#### `dim_domicilios_hortolandenses.md`
Atributos do domicílio: tipo, condição de ocupação, infraestrutura (água, esgoto, coleta de lixo). Interface com variáveis IVS da dimensão Infraestrutura Urbana.

---

### Dimensões territoriais

#### `dim_municipio_regioes_loteamentos.md`
Mapeamento completo da hierarquia territorial: município → 6 Regiões de Planejamento → 141 loteamentos oficiais. Fonte: base oficial SIG/PMH.

#### `dim_loteamento_v01.md` *(em construção)*
Cada loteamento como unidade territorial de referência. Campos: `codbairro`, `nome_oficial`, `regiao_planejamento`, `nucleo_cras`. Base para geocodificação de endereços do CadÚnico.

#### `dim_nucleo_v01.md`
Os 7 núcleos operacionais — um por CRAS. Define quais loteamentos estão sob abrangência de cada unidade de serviço. Tabela de relacionamento: `REL_LOTEAMENTO_NUCLEO` (141 × 7).

---

### Dimensões institucionais

#### `dim_unidades_de_atendimento.md`
Equipamentos da rede socioassistencial: 7 CRAS, 1 CREAS, Centro POP, CRAM e unidades referenciadas. Inclui endereço, horário e serviços oferecidos.

#### `dim_gestores_municipais_v06.md`
62 registros. Cobre prefeito, vice-prefeito, secretários titulares, adjuntos, diretores estratégicos e presidentes de conselhos. Campo `ativo` para rastreamento histórico de substituições. Alimenta o campo `secretaria_responsavel` do `DIM_PROGRAMAS_SOCIAIS`.

#### `dim_osc_v01.md`
423 Organizações da Sociedade Civil registradas no município. Base para `REL_NORMA_ENTIDADE` e análise da rede de execução indireta de serviços.

#### `dim_colegiados_v02.md`
28 colegiados municipais: conselhos de direitos, conselhos gestores, comitês intersetoriais e fundos. Inclui campo `dimensao_ivs` e vinculação normativa. Alimenta a análise de governança participativa.

#### `dim_vereador_hortolandia_v01.md`
Câmara Municipal: vereadores eleitos, partidos, comissões. Base para rastreamento de matérias legislativas relevantes para a política socioassistencial.

---

### Dimensões de programas e normas

#### `dim_programas_sociais_v09.md`
**58 programas** catalogados. Cobre assistência social, habitação, segurança alimentar, inserção produtiva, direitos humanos e formação cultural. Campos principais: `esfera`, `id_orgao_executor`, `base_legal_principal`, `base_legal_municipal`, `dimensao_ivs`. O campo `dimensao_ivs` conecta cada programa ao IVS-H (Índice de Vulnerabilidade Social de Hortolândia), com valores: `infraestrutura_urbana` | `capital_humano` | `renda_trabalho` | `multidimensional` | `governanca`.

#### `dim_normas_juridicas_v01.md`
Arcabouço normativo da política socioassistencial: leis federais, estaduais e municipais. Vincula normas a programas, colegiados e concessões. Base para rastreabilidade e auditabilidade do sistema.

#### `dim_materias_legislativas_municipais.md`
Matérias legislativas da Câmara Municipal com impacto na política social. Base para monitoramento do ciclo normativo local.

---

### Tabelas fato *(esboço conceitual)*

#### `fato_atendimento_v01.md`
Registro de cada atendimento: pessoa, programa, unidade, data, tipo de serviço. Chave de cruzamento com SIGAS (futuro).

#### `fato_concessao_beneficio_v01.md`
Registro de cada concessão: pessoa, benefício, valor, período, norma vigente. Base para detecção de duplicação por CPF.

#### `fato_participacao_programa_v01.md`
Participação de pessoas e famílias em programas ao longo do tempo. Base para análise de trajetória e emancipação planejada.

---

## Os 7 CRAS de Hortolândia

| CRAS | Homenageado | Endereço |
|------|------------|---------|
| Jardim Santa Clara | — | Rua Estados Unidos, 217 |
| Jardim Amanda | — | Av. Tarsila do Amaral, 540 |
| Jardim Novo Ângulo | — | Rua Francisco Bereta, 330 |
| Rosolém | Joel Alves Assunção | Rua Guido Rosolém, 177 |
| Primavera | Chico Vigilante | Rua Amoreira, 35 |
| Jardim Brasil | Maria Humilde Antunes (Zuma) | Rua da Amizade, 240 |
| Vila Real | — | Rua Ernesto Bergamasco, 185 |

---

## Pendências desta pasta

| Pendência | Prioridade |
|-----------|------------|
| Popular `REL_LOTEAMENTO_NUCLEO` (141 loteamentos × 7 CRAS) | Alta |
| Formalizar `DIM_LOTEAMENTO` com campo `codbairro` padronizado | Alta |
| Construir `TAB_NORMALIZA_ENDERECO` para geocodificação do CadÚnico | Alta |
| Popular `DIM_DOMICILIO` com campos CadÚnico V7 | Alta |
| Confirmar RP dos 11 loteamentos de fronteira | Média |

---

## Relação com outras pastas

| Pasta | Relação |
|-------|---------|
| `00_governança` | Recebe as diretrizes estratégicas e o arcabouço normativo que orientam as decisões conceituais |
| `02_modelagem_lógica` | Recebe as entidades conceituais desta pasta e as transforma em tabelas com campos, tipos e relacionamentos formais (schema SQL) |
| `03_indicadores_mvp` | Consome as dimensões e fatos para produzir o IVS-H e os indicadores operacionais |

---

*Última atualização: 09/03/2026 (v02)*  
*Responsável: Ailton Vendramini / Claude (Anthropic)*  
*Atualização v02: versões corrigidas, eliminação de DIM_TERRITORIO, adição de todos os arquivos existentes, hierarquia territorial definitiva, tabela de pendências.*
