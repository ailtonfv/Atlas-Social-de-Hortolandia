# REL_PROGRAMA_DIMENSAO_IVS — Relação Programa × Dimensão IVS
**Versão:** v02  
**Data:** 2026-03-11  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 02_modelagem_lógica

> Ponte analítica entre `DIM_PROGRAMA` e `DIM_VARIAVEL_IVS`.
> Permite responder: quais programas atuam em RT_02? Quais cobrem CH_07?
> Quais são multidimensionais? Onde há lacuna programática por variável IVS?

---

## Estrutura

```
id_programa              FK → dim_programa
dimensao_ivs             infraestrutura_urbana | capital_humano |
                         renda_trabalho | multidimensional | governanca
cod_variavel_ivs         lista de variáveis relacionadas (IU_01, CH_05 etc.)
                         FK → dim_variavel_ivs — separadas por vírgula
tipo_relacao             direta       = programa atua explicitamente sobre a variável
                         indireta     = programa contribui para a variável por via secundária
                         multidimensional = programa atua em 2+ dimensões simultaneamente
justificativa_analitica  explicação da relação programa × IVS
observacoes              nota metodológica adicional
```

---

## Grupo 1 — Proteção Social Básica

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| PAIF | multidimensional | CH_05, CH_06, CH_07, RT_01, RT_02, IU_01 | multidimensional | Acompanhamento familiar preventivo — atua em renda (RT_01/RT_02), capital humano (CH_05/CH_06/CH_07) e moradia (IU_01) simultaneamente | Maior cobertura transversal do catálogo |
| SCFV | capital_humano | CH_02, CH_03, CH_06, CH_07, CH_08 | direta | Frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos — incidência direta em CH_02 e CH_03 | — |
| CCS | capital_humano | CH_06, CH_07 | indireta | Convivência comunitária contribui para capital humano do território de abrangência | Cobertura territorial localizada — NUCLEO_ROSOLEM |

---

## Grupo 2 — Proteção Social Especial — Média Complexidade

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| PAEFI | multidimensional | CH_03, CH_05, CH_06, RT_01, RT_02, IU_01 | multidimensional | Violação de direitos cruza escolaridade (CH_03/CH_06), monoparentalidade (CH_05), renda (RT_01/RT_02) e moradia (IU_01) | Perfil de vulnerabilidade mais severa que o PAIF |
| CENTROPOP | multidimensional | IU_01, IU_02, IU_03, CH_06, CH_08, RT_01, RT_02, RT_03 | multidimensional | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | ⚠️ Ponto cego: atende sem CPF — registros sem CadÚnico |
| ABORDAGEM_SOCIAL | multidimensional | IU_01, IU_02, RT_01, RT_02, CH_08 | multidimensional | Abordagem de rua — perfil idêntico ao Centro POP | — |
| MSE_LA_PSC | capital_humano | CH_03, CH_06, CH_08 | direta | Medida socioeducativa atua diretamente sobre escolaridade e situação nem-nem | — |
| APOIO_RISCO | multidimensional | CH_05, RT_01, RT_02, IU_01 | multidimensional | Situação de risco cruza monoparentalidade, renda e moradia | — |
| EMERGENCIAS | multidimensional | IU_01, IU_02, RT_01 | direta | Emergências climáticas atingem famílias sem moradia adequada e sem renda para recuperação | — |

---

## Grupo 3 — Proteção Social Especial — Alta Complexidade

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| SAICA | capital_humano | CH_02, CH_03, CH_05, CH_06, CH_07 | direta | Acolhimento de crianças — escolaridade, vínculo familiar, reprodução intergeracional da pobreza | — |
| ABRIGO_ADULTOS | infraestrutura_urbana | IU_01, IU_02, RT_01, RT_02 | direta | Provisão de moradia temporária (IU_01/IU_02) + caminho para inserção produtiva (RT_01/RT_02) | — |
| ABRIGO_MULHERES | multidimensional | CH_04, CH_05, RT_01, RT_02, IU_01 | multidimensional | Violência contra a mulher: dependência econômica (RT), ausência de moradia segura (IU), saúde reprodutiva (CH_04) | — |
| RESIDENCIA_INCLUSIVA | capital_humano | CH_01, CH_06, CH_08 | direta | PCD: desenvolvimento de capacidades adaptativas, escolaridade, inserção produtiva futura | — |
| ILPI | capital_humano | CH_01, RT_04 | direta | Idosos: saúde (CH_01) + dependência econômica de idoso com renda ≤ ½ SM (RT_04) | RT_04: retirada do idoso da família requer recomposição de renda |
| REPUBLICA | renda_trabalho | RT_02, RT_03 | direta | Última etapa da saída da rua: autonomia e inserção produtiva formal | Perfil: já inserido ou em vias de inserção |
| APADRINHAMENTO | capital_humano | CH_02, CH_03, CH_05, CH_07 | indireta | Apadrinhamento contribui indiretamente para escolaridade e reprodução intergeracional | — |
| TRAB_INFANTIL | capital_humano | CH_08 | direta | Combate direto ao trabalho infantil — variável RT_05 do IVS (atividade 10–14 anos) | Interface: CREAS + Conselho Tutelar |
| ATEND_DOMICILIAR | capital_humano | CH_01, RT_04 | indireta | Atenção domiciliar contribui para saúde e autonomia de PCD e idosos | — |
| PROTECAO_PCD_IDOSO | capital_humano | CH_01, RT_04 | direta | PCD e idosos: saúde (CH_01) + dependência econômica (RT_04) | — |

---

## Grupo 4 — Programas Municipais Específicos (Inclusão)

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| FUNDO_EMERG | renda_trabalho | RT_01 | direta | Transferência emergencial de renda e bens — impacto direto em RT_01 | — |
| ACERTE | renda_trabalho | RT_02, RT_03 | direta | Qualificação + intermediação: reduz desocupação (RT_02) e informalidade (RT_03) | Caso Suelen: CRAS → ACERTE → emprego no CRAS |
| CUIDAR | capital_humano | CH_01, CH_04 | direta | Saúde materno-infantil: mortalidade infantil (CH_01) e gravidez na adolescência (CH_04) | — |
| CAPACITA | renda_trabalho | RT_02, RT_03 | direta | Qualificação profissional: reduz desocupação e informalidade | — |
| COSTURA_IND | renda_trabalho | RT_02, RT_03 | direta | Capacitação + inserção no setor têxtil | Modalidade do ACERTE |
| FARMACIA_SOL | capital_humano | CH_01 | indireta | Acesso a medicamentos contribui para saúde como capital humano | — |
| FEIRAS_EMPREEND | renda_trabalho | RT_01, RT_03 | indireta | Economia solidária: geração de renda informal — contribuição indireta a RT | — |
| RESSIGNIFICA | multidimensional | RT_01, RT_02, IU_01, IU_02, CH_06, CH_08 | multidimensional | Reintegração ampla: renda + moradia + capital humano + qualificação | Programa de saída da rua mais estruturado |
| BOLSA_CRECHE | capital_humano | CH_02 | direta | Acesso à educação infantil: incidência direta em CH_02 (0–5 fora da escola) | — |
| INSCRICAO_CMAS | governanca | — | direta | Controle social da política de assistência social | — |
| INSCRICAO_CMDCA | governanca | — | direta | Controle social das políticas para criança e adolescente | — |

---

## Grupo 5 — Segurança Alimentar

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| BAH | renda_trabalho | RT_01 | indireta | Redução de insegurança alimentar via OSCs — contribuição indireta a RT_01 | 1.762 pessoas (2024) |
| PAA | renda_trabalho | RT_01 | indireta | Transferência indireta de renda via alimentação | — |
| CESTAS | renda_trabalho | RT_01 | direta | Complemento alimentar emergencial: impacto direto em RT_01 | — |
| CREAN | capital_humano | CH_02, CH_05 | indireta | Educação alimentar contribui para capital humano via saúde | Em planejamento |
| COZINHA_COM | renda_trabalho | RT_01 | indireta | Refeição subsidiada reduz impacto de RT_01 | — |

---

## Grupo 6 — Habitação

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| AGORA_CASA | infraestrutura_urbana | IU_01, IU_02 | direta | Regularização fundiária: acesso a água, esgoto e moradia adequada | ~3.000 títulos 2021–2024 |
| VIDA_LONGA | infraestrutura_urbana | IU_01, RT_04 | direta | Habitação para idosos: moradia adequada + dependência de renda do idoso (RT_04) | Em negociação |
| MCMV | infraestrutura_urbana | IU_01, IU_02 | direta | Provisão habitacional: acesso a água e esgoto adequados | 400 unidades — Jd. Amanda |
| PHLIS | infraestrutura_urbana | IU_01, IU_02, IU_03 | indireta | Política habitacional estruturante — cobertura indireta das três variáveis IU | Instrumento de planejamento |

---

## Grupo 7 — Inserção Produtiva e Qualificação

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| PAT | renda_trabalho | RT_02 | direta | Intermediação de emprego: reduz desocupação (RT_02) | Cruzamento CadÚnico × mercado formal |
| PAT_VAGAS | renda_trabalho | RT_02 | direta | Idem PAT — lado da oferta de vagas | — |
| SINE | renda_trabalho | RT_02, RT_03 | direta | Intermediação federal: desocupação e informalidade | Dados ficam no MTE federal |
| PEI | renda_trabalho | RT_02, CH_06 | direta | Inclusão produtiva de PCD: desocupação (RT_02) + deficiência como dimensão CH | ⚠️ Pendência #23 |
| BANCO_POVO | renda_trabalho | RT_03 | direta | Crédito para formalização: reduz informalidade (RT_03) | Executor: Desenvolve SP |
| ORIENT_MEI | renda_trabalho | RT_03 | direta | Formalização MEI: reduz informalidade estrutural | MEI não aparece no CAGED |
| SEBRAE_AQUI | renda_trabalho | RT_02, RT_03 | indireta | Capacitação empresarial contribui para empregabilidade e formalização | — |
| SEG_DESEMPREGO | renda_trabalho | RT_01, RT_02 | indireta | Proteção temporária de renda: evita queda abrupta em RT_01/RT_02 | Esgotamento → entrada previsível no CadÚnico |
| FEIRAS_LIVRES | renda_trabalho | RT_01, RT_03 | indireta | Renda informal de feirantes contribui para RT_01/RT_03 do território | 5 territórios coincidem com áreas de CRAS |
| FUNDO_CURSOS | renda_trabalho | RT_02, RT_03 | direta | Qualificação via SENAI: desocupação e informalidade | — |
| MEU_EMPREGO | renda_trabalho | RT_02 | direta | Empregabilidade de jovens: reduz desocupação (RT_02) | — |
| DECOLA | renda_trabalho | RT_02, RT_03 | direta | Empregabilidade e inserção produtiva | ⚠️ Pendência #20 |
| APRENDIZ_SOCIAL | renda_trabalho | RT_02, CH_08 | direta | Formação de jovens: desocupação (RT_02) + geração nem-nem (CH_08) | ⚠️ Pendência #20 |
| FATEC | renda_trabalho | RT_02, RT_03 | indireta | Ensino superior tecnológico gratuito como vetor de mobilidade social | Em estudo de viabilidade |

---

## Grupo 8 — Públicos Específicos / Direitos Humanos

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| POL_PCD | capital_humano | CH_01, CH_06 | indireta | Políticas para PCD contribuem para saúde e escolaridade | Instrumento de política |
| POL_IDOSO | capital_humano | CH_01, RT_04 | indireta | Atenção ao idoso: saúde e dependência econômica | — |
| CCMI | capital_humano | CH_01, RT_04 | indireta | Convivência e saúde do idoso contribuem para CH e RT_04 | — |
| POL_JUVENTUDE | capital_humano | CH_03, CH_08 | indireta | Juventude: evasão escolar (CH_03) e geração nem-nem (CH_08) | — |
| IGUALDADE_RACIAL | multidimensional | CH_06, CH_07, RT_01, RT_02, IU_01 | multidimensional | Desigualdade racial cruza todas as dimensões IVS | — |
| CRAM | multidimensional | CH_04, CH_05, RT_01, RT_02 | multidimensional | Violência contra a mulher: dependência econômica (RT) + gravidez adolescente (CH_04) + monoparentalidade (CH_05) | Fluxo CRAM → CT → CREAS confirmado 08/03/2026 |
| CLOSET_SOL | capital_humano | CH_05 | indireta | Apoio material a mulheres atendidas pelo CRAM — contribuição indireta ao CH_05 | — |
| VIVA_MAIS | capital_humano | CH_01 | indireta | Saúde e bem-estar comunitário | — |
| AMBULATORIO_TRANS | capital_humano | CH_01 | direta | Saúde de população vulnerável: reduz barreira de acesso ao SUS | — |
| COM_PRIMEIRA_INF | capital_humano | CH_01, CH_02 | direta | Primeira infância: mortalidade (CH_01) e acesso à escola (CH_02) | — |

---

## Grupo 9 — Formação Cultural

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| FORMACOES_CULT | capital_humano | CH_06, CH_07 | indireta | Cultura como fator de capital humano e coesão social | — |

---

## Grupo 10 — Saúde com Interface SUAS

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica | observacoes |
|---|---|---|---|---|---|
| SAMU | capital_humano | CH_01 | direta | Urgência e emergência: impacto direto em mortalidade (CH_01) | Abrangência: Hortolândia + Sumaré |
| VILA_SAUDE | capital_humano | CH_01, CH_02 | direta | Equipamento de saúde comunitária: mortalidade e acesso | Em planejamento |

---

## Grupo 11 — Governança e Conselhos

| id_programa | dimensao_ivs | cod_variavel_ivs | tipo_relacao | justificativa_analitica |
|---|---|---|---|---|
| COMSEA | governanca | — | direta | Controle social da segurança alimentar |
| CAISAN | governanca | — | direta | Articulação intersetorial da política alimentar |
| CMPcD | governanca | — | direta | Controle social das políticas para PCD |
| CMDCA | governanca | — | direta | Controle social para criança e adolescente |
| CMAS | governanca | — | direta | Controle social da assistência social |
| CMI | governanca | — | direta | Controle social para idosos |
| COMJUV | governanca | — | direta | Controle social para juventude |
| COMPIR | governanca | — | direta | Controle social de igualdade racial |
| CT_I | governanca | — | direta | Proteção de direitos — Território I |
| CT_II | governanca | — | direta | Proteção de direitos — Território II |
| CMDM | governanca | — | direta | Controle social para mulheres |

---

## Perguntas Analíticas Habilitadas

| Pergunta | Query |
|---|---|
| Quais programas atuam diretamente em CH_02? | `WHERE cod_variavel_ivs LIKE '%CH_02%' AND tipo_relacao = 'direta'` |
| Quais programas cobrem RT_02? | `WHERE cod_variavel_ivs LIKE '%RT_02%'` |
| Quais são multidimensionais? | `WHERE tipo_relacao = 'multidimensional'` |
| Há lacuna em IU_03 (mobilidade)? | `WHERE cod_variavel_ivs LIKE '%IU_03%'` |
| Programas com relação indireta a CH_07? | `WHERE cod_variavel_ivs LIKE '%CH_07%' AND tipo_relacao = 'indireta'` |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — 64 programas × dimensão IVS + variáveis |
| v02 | 2026-03-11 | Campo `tipo_relacao` adicionado (direta | indireta | multidimensional) a todos os 64 registros |

---

*Documento de modelagem relacional — 02_modelagem_lógica/*  
*Atlas Social de Hortolândia — uso interno*
