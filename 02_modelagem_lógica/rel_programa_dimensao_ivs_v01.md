# REL_PROGRAMA_DIMENSAO_IVS — Relação Programa × Dimensão IVS
**Versão:** v01  
**Data:** 2026-03-11  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 02_modelagem_lógica  
**Origem:** Extraído de `dim_programas_sociais_v12.md`

> Este arquivo registra a relação analítica entre cada programa social
> e as dimensões e variáveis do IVS-H. É a ponte entre o catálogo de
> programas (`dim_programa.md`) e a estrutura de indicadores
> (`dim_variavel_IVS.md`).
>
> **Permite responder:**
> - Quais programas atuam nos territórios com maior vulnerabilidade em CH_07?
> - Existe sobreposição ou lacuna de cobertura programática por dimensão IVS?
> - A distribuição de programas é proporcional à intensidade de vulnerabilidade territorial?

---

## Estrutura da REL_PROGRAMA_DIMENSAO_IVS

```
id_programa          FK → dim_programa
dimensao_ivs         infraestrutura_urbana | capital_humano |
                     renda_trabalho | multidimensional | governanca
variaveis_ivs        lista de cod_variavel (FK → dim_variavel_ivs)
                     separadas por vírgula
justificativa        explicação analítica da relação programa × IVS
observacao           nota metodológica adicional, se necessária
```

---

## Grupo 1 — Proteção Social Básica

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| PAIF | multidimensional | CH_05, CH_06, CH_07, RT_01, RT_02, IU_01 | Acompanhamento familiar preventivo — atua simultaneamente em renda (RT_01), capital humano (CH_05, CH_06, CH_07) e condições de moradia (IU_01) | Serviço central dos CRAS; é o programa com maior cobertura transversal das dimensões IVS |
| SCFV | capital_humano | CH_02, CH_03, CH_06, CH_07, CH_08 | Fortalece frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos | Interface direta com CH_02 (0–5 anos fora da escola) e CH_03 (6–14 fora da escola) |
| CCS | capital_humano | CH_06, CH_07 | Convivência comunitária e fortalecimento de vínculos em território específico | Equipamento do CRAS Rosolém — cobertura territorial localizada |

---

## Grupo 2 — Proteção Social Especial — Média Complexidade

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| PAEFI | multidimensional | CH_03, CH_05, CH_06, RT_01, RT_02, IU_01 | Violação de direitos cruza capital humano (escolaridade, monoparentalidade), renda (RT_01) e condições de moradia (IU_01) | Casos já em violação — perfil de vulnerabilidade mais severa que o PAIF |
| CENTROPOP | multidimensional | IU_01, IU_02, IU_03, CH_06, CH_08, RT_01, RT_02, RT_03 | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões — sem moradia, sem renda, sem escolaridade | ⚠️ Ponto cego estrutural: atende sem documentação — CPF = PENDENTE no CadÚnico |
| ABORDAGEM_SOCIAL | multidimensional | IU_01, IU_02, RT_01, RT_02, CH_08 | Abordagem de rua — perfil idêntico ao Centro POP | Dados de abordagem devem gerar registro em FATO_ATENDIMENTO mesmo sem CPF completo |
| MSE_LA_PSC | capital_humano | CH_03, CH_06, CH_08 | Medida socioeducativa incide sobre escolaridade (CH_03/CH_06), abandono precoce dos estudos e situação de nem-nem (CH_08) | Interface ECA — Conselho Tutelar → CREAS |
| APOIO_RISCO | multidimensional | CH_05, RT_01, RT_02, IU_01 | Situação de risco cruza monoparentalidade (CH_05), renda baixa (RT_01) e condições de moradia (IU_01) | — |
| EMERGENCIAS | multidimensional | IU_01, IU_02, RT_01 | Emergências climáticas atingem famílias sem moradia adequada (IU_01/IU_02) e sem renda para recuperação (RT_01) | Ref: chuvas 26/02/2026 — 16 famílias acolhidas |

---

## Grupo 3 — Proteção Social Especial — Alta Complexidade

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| SAICA | capital_humano | CH_02, CH_03, CH_05, CH_06, CH_07 | Acolhimento de crianças e adolescentes — escolaridade, vínculo familiar, desenvolvimento intergeracional | OSC executora a confirmar — Pendência #19 |
| ABRIGO_ADULTOS | infraestrutura_urbana | IU_01, IU_02, RT_01, RT_02 | Provisão de moradia temporária para pop. em situação de rua (IU_01/IU_02) + inserção produtiva (RT_01/RT_02) | Objetivo: qualificação e inclusão produtiva após abrigo |
| ABRIGO_MULHERES | multidimensional | CH_04, CH_05, RT_01, RT_02, IU_01 | Violência contra a mulher envolve dependência econômica (RT_01/RT_02), ausência de moradia segura (IU_01) e saúde reprodutiva (CH_04) | Acesso sem B.O. — interface CRAM → CREAS → Abrigo |
| RESIDENCIA_INCLUSIVA | capital_humano | CH_01, CH_06, CH_08 | Acolhimento de PCD — desenvolvimento de capacidades adaptativas, escolaridade, inserção produtiva futura | Lei 13.146/2015 (Estatuto da Pessoa com Deficiência) |
| ILPI | capital_humano | CH_01, RT_04 | Acolhimento de idosos — mortalidade infantil (CH_01 como proxy de saúde) + dependência de idosos com renda ≤ ½ SM (RT_04) | RT_04 é especialmente relevante: idoso como sustentáculo familiar — retirada da família implica recomposição de renda |
| REPUBLICA | renda_trabalho | RT_02, RT_03 | Autonomia e inserção produtiva — moradores em fase final de saída da rua com emprego ou em busca | Perfil: já inserido ou em vias de inserção formal |
| APADRINHAMENTO | capital_humano | CH_02, CH_03, CH_05, CH_07 | Crianças em acolhimento — escolaridade, vínculos familiares, reprodução intergeracional | Vinculado ao CMDCA |
| TRAB_INFANTIL | capital_humano | CH_08 | Combate direto ao trabalho infantil — variável RT_05 do IVS (atividade de 10–14 anos) | Interface: CREAS + Conselho Tutelar |
| ATEND_DOMICILIAR | capital_humano | CH_01, RT_04 | Atenção domiciliar a PCD e idosos — saúde, autonomia e dependência | — |
| PROTECAO_PCD_IDOSO | capital_humano | CH_01, RT_04 | PCD e idosos: saúde (CH_01) + dependência econômica de idosos (RT_04) | — |

---

## Grupo 4 — Programas Municipais Específicos (Inclusão)

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| FUNDO_EMERG | renda_trabalho | RT_01 | Transferência emergencial de renda e bens — impacto direto em RT_01 (renda ≤ ½ SM) | — |
| ACERTE | renda_trabalho | RT_02, RT_03 | Qualificação + intermediação de emprego — reduz desocupação (RT_02) e informalidade (RT_03) | Caso Suelen: CRAS → ACERTE → emprego no CRAS |
| CUIDAR | capital_humano | CH_01, CH_04 | Saúde materno-infantil — mortalidade infantil (CH_01) e gravidez na adolescência (CH_04) | Exige pré-natal na rede municipal |
| CAPACITA | renda_trabalho | RT_02, RT_03 | Qualificação profissional — reduz desocupação e informalidade | ⚠️ Verificar distinção vs Capacita Hortolândia |
| COSTURA_IND | renda_trabalho | RT_02, RT_03 | Capacitação + inserção produtiva no setor têxtil | Modalidade do ACERTE |
| FARMACIA_SOL | capital_humano | CH_01 | Acesso a medicamentos — saúde como capital humano | Detalhamento pendente |
| FEIRAS_EMPREEND | renda_trabalho | RT_01, RT_03 | Geração de renda via economia solidária — informalidade como estratégia de sobrevivência (RT_03) | — |
| RESSIGNIFICA | multidimensional | RT_01, RT_02, IU_01, IU_02, CH_06, CH_08 | Reintegração social ampla — renda + moradia + capital humano + qualificação | Bolsa + cesta + auxílio aluguel — programa de saída da rua mais estruturado |
| BOLSA_CRECHE | capital_humano | CH_02 | Acesso à educação infantil — CH_02 (crianças 0–5 fora da escola) | Cobre demanda não atendida pela rede pública |
| INSCRICAO_CMAS | governanca | — | Instrumento de controle social da política de assistência social | — |
| INSCRICAO_CMDCA | governanca | — | Instrumento de controle social da política para criança e adolescente | — |

---

## Grupo 5 — Segurança Alimentar

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| BAH | renda_trabalho | RT_01 | Redução de insegurança alimentar — complemento de renda via alimento | Alcance: 19 org / 1.762 pessoas (2024) |
| PAA | renda_trabalho | RT_01 | Transferência indireta de renda via alimentação — agricultores familiares como beneficiários duplos | — |
| CESTAS | renda_trabalho | RT_01 | Complemento alimentar de emergência — impacto direto em RT_01 | — |
| CREAN | capital_humano | CH_02, CH_05 | Educação alimentar e nutricional — capital humano via saúde alimentar | Em planejamento |
| COZINHA_COM | renda_trabalho | RT_01 | Refeição subsidiada — reduz impacto de RT_01 (renda ≤ ½ SM) | — |

---

## Grupo 6 — Habitação

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| AGORA_CASA | infraestrutura_urbana | IU_01, IU_02 | Regularização fundiária e melhoria habitacional — saneamento e moradia adequada | ~3.000 títulos 2021–2024 |
| VIDA_LONGA | infraestrutura_urbana | IU_01, RT_04 | Habitação para idosos em vulnerabilidade — moradia adequada (IU_01) + dependência de renda de idoso (RT_04) | Em negociação com o Estado |
| MCMV | infraestrutura_urbana | IU_01, IU_02 | Provisão habitacional — acesso a água e esgoto adequados | 400 unidades — Jd. Amanda |
| PHLIS | infraestrutura_urbana | IU_01, IU_02, IU_03 | Política habitacional estruturante — cobre todas as variáveis da dimensão Infraestrutura Urbana | Instrumento de planejamento — Tipo B |

---

## Grupo 7 — Inserção Produtiva e Qualificação

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| PAT | renda_trabalho | RT_02 | Intermediação de emprego — reduz desocupação (RT_02) | Ponto de cruzamento CadÚnico × mercado formal |
| PAT_VAGAS | renda_trabalho | RT_02 | Idem PAT — cadastro do lado da oferta de vagas | — |
| SINE | renda_trabalho | RT_02, RT_03 | Intermediação federal de emprego — adesão Hortolândia fev/2026 | Dados ficam no MTE federal |
| PEI | renda_trabalho | RT_02, CH_06 | Inclusão produtiva de PCD — desocupação (RT_02) + deficiência como dimensão CH | ⚠️ Pendência #23 |
| BANCO_POVO | renda_trabalho | RT_03 | Crédito para formalização e empreendedorismo — reduz informalidade (RT_03) | Executor: Desenvolve SP |
| ORIENT_MEI | renda_trabalho | RT_03 | Formalização de MEI — reduz informalidade estrutural | MEI não aparece no CAGED — ponto cego |
| SEBRAE_AQUI | renda_trabalho | RT_02, RT_03 | Capacitação empresarial — empregabilidade e formalização | — |
| SEG_DESEMPREGO | renda_trabalho | RT_01, RT_02 | Proteção temporária de renda após demissão formal | Esgotamento → entrada previsível no CadÚnico |
| FEIRAS_LIVRES | renda_trabalho | RT_01, RT_03 | Renda informal de feirantes — 5 territórios coincidem com áreas de CRAS | — |
| FUNDO_CURSOS | renda_trabalho | RT_02, RT_03 | Qualificação profissional via SENAI | — |
| MEU_EMPREGO | renda_trabalho | RT_02 | Empregabilidade de jovens e desempregados | — |
| DECOLA | renda_trabalho | RT_02, RT_03 | Empregabilidade e inserção produtiva | ⚠️ Pendência #20 |
| APRENDIZ_SOCIAL | renda_trabalho | RT_02, CH_08 | Formação de jovens — desocupação (RT_02) e geração nem-nem (CH_08) | ⚠️ Pendência #20 |
| FATEC | renda_trabalho | RT_02, RT_03 | Ensino superior tecnológico gratuito como vetor de mobilidade social | Em estudo de viabilidade |

---

## Grupo 8 — Públicos Específicos / Direitos Humanos

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| POL_PCD | capital_humano | CH_01, CH_06 | Políticas para PCD — saúde (CH_01) e escolaridade (CH_06) | Instrumento de política — Tipo B |
| POL_IDOSO | capital_humano | CH_01, RT_04 | Atenção ao idoso — saúde e dependência econômica | — |
| CCMI | capital_humano | CH_01, RT_04 | Convivência e saúde do idoso | — |
| POL_JUVENTUDE | capital_humano | CH_03, CH_08 | Juventude — evasão escolar (CH_03) e geração nem-nem (CH_08) | — |
| IGUALDADE_RACIAL | multidimensional | CH_06, CH_07, RT_01, RT_02, IU_01 | Desigualdade racial cruza todas as dimensões do IVS | — |
| CRAM | multidimensional | CH_04, CH_05, RT_01, RT_02 | Violência contra a mulher — dependência econômica (RT_01/RT_02), gravidez adolescente (CH_04), monoparentalidade (CH_05) | Fluxo confirmado: CRAM → CT → CREAS (08/03/2026) |
| CLOSET_SOL | capital_humano | CH_05 | Acesso a vestuário para mulheres atendidas pelo CRAM — apoio material ao capital humano | — |
| VIVA_MAIS | capital_humano | CH_01 | Saúde e bem-estar comunitário | — |
| AMBULATORIO_TRANS | capital_humano | CH_01 | Saúde de população vulnerável — reduz barreira de acesso ao SUS | — |
| COM_PRIMEIRA_INF | capital_humano | CH_01, CH_02 | Primeira infância — mortalidade infantil (CH_01) e acesso à escola (CH_02) | — |

---

## Grupo 9 — Formação Cultural

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| FORMACOES_CULT | capital_humano | CH_06, CH_07 | Cultura como fator de capital humano e coesão social — escolaridade e reprodução de conhecimento | — |

---

## Grupo 10 — Serviços de Saúde com Interface SUAS

| id_programa | dimensao_ivs | variaveis_ivs | justificativa | observacao |
|---|---|---|---|---|
| SAMU | capital_humano | CH_01 | Urgência e emergência em saúde — mortalidade infantil (CH_01) como proxy de acesso à saúde | — |
| VILA_SAUDE | capital_humano | CH_01, CH_02 | Equipamento de saúde comunitária — impacto em mortalidade e acesso | Em planejamento |

---

## Grupo 11 — Governança e Conselhos

| id_programa | dimensao_ivs | variaveis_ivs | justificativa |
|---|---|---|---|
| COMSEA | governanca | — | Controle social da segurança alimentar |
| CAISAN | governanca | — | Articulação intersetorial da política alimentar |
| CMPcD | governanca | — | Controle social das políticas para PCD |
| CMDCA | governanca | — | Controle social das políticas para criança e adolescente |
| CMAS | governanca | — | Controle social da política de assistência social |
| CMI | governanca | — | Controle social das políticas para idosos |
| COMJUV | governanca | — | Controle social das políticas para juventude |
| COMPIR | governanca | — | Controle social das políticas de igualdade racial |
| CT_I | governanca | — | Proteção de direitos de crianças e adolescentes — Território I |
| CT_II | governanca | — | Proteção de direitos de crianças e adolescentes — Território II |
| CMDM | governanca | — | Controle social das políticas para mulheres |

---

## Perguntas Analíticas Habilitadas por este Arquivo

| Pergunta | Campos envolvidos |
|---|---|
| Quais programas atuam em CH_02 (crianças 0–5 fora da escola)? | `variaveis_ivs LIKE '%CH_02%'` |
| Qual dimensão IVS tem menor cobertura programática? | `GROUP BY dimensao_ivs COUNT(id_programa)` |
| Existem territórios com alta vulnerabilidade RT_01 e sem programas de renda? | JOIN com FATO_IVS_LOTEAMENTO e FATO_ATENDIMENTO |
| Quais programas multidimensionais cobrem IU + CH + RT simultaneamente? | `dimensao_ivs = 'multidimensional'` + análise de variaveis_ivs |
| A concentração de programas de renda coincide com os loteamentos mais vulneráveis em RT? | JOIN DIM_PROGRAMA × FATO_IVS_LOTEAMENTO × DIM_LOTEAMENTO |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — extraído de `dim_programas_sociais_v12.md`; 64 programas mapeados com dimensão IVS e variáveis relacionadas; perguntas analíticas habilitadas |

---

*Documento de modelagem relacional — 02_modelagem_lógica/*  
*Atlas Social de Hortolândia — uso interno*
