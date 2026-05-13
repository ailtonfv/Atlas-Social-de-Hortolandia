# REL_PROGRAMA_DIMENSAO_IVS
**Versão:** v01
**Data:** "13/05/2026"
**Responsável:** Ailton Vendramini
**Repositório:** Atlas-Social-de-Hortolândia / 02_modelagem_logica
**Origem:** Derivado de `programa_dim_v08.md` — 64 programas ativos

> Esta tabela transforma a DIM_PROGRAMA em **eixo de integração intersetorial**,
> conectando cada programa às variáveis IVS que ele endereça.
>
> **Permite responder:**
> - Quais programas cobrem uma variável específica?
> - Quais variáveis não têm cobertura programática?
> - Onde há redundância ou vazio de atuação?
>
> **Notação de variáveis:**
> - Código específico (ex: `RT_01`) = mapeamento direto confirmado
> - *Faixa em itálico* (ex: `*CH_01–CH_08*`) = dimensão confirmada, código específico a refinar na REL_PROGRAMA_INDICADOR futura

---

## Legenda de variáveis IVS

| Código | Descrição |
|---|---|
| IU_01 | Domicílios sem água/esgoto adequados |
| IU_02 | Domicílios sem coleta de lixo |
| IU_03 | Renda ≤ ½ SM + deslocamento > 1h |
| CH_01 | Mortalidade infantil |
| CH_02 | Crianças 0–5 fora da escola |
| CH_03 | Crianças 6–14 fora da escola |
| CH_04 | Mães 10–17 anos |
| CH_05 | Mães chefes de família sem fundamental e com filhos menores |
| CH_06 | Analfabetismo 15+ |
| CH_07 | Crianças sem ensino fundamental concluído (responsável) |
| CH_08 | Jovens 15–24 não estudam e não trabalham (nem-nem) |
| RT_01 | Renda per capita ≤ ½ SM |
| RT_02 | Taxa de desocupação |
| RT_03 | Informalidade no trabalho |
| RT_04 | Idosos sem previdência / dependência de renda de terceiros |
| RT_05 | Trabalho infantil |

---

### Assistência Social

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| PAIF | Serviço de Proteção e Atendimento Integral às Famílias | SMIDS | CH_05, RT_01, RT_02 | Municipal | Famílias em vulnerabilidade |
| SCFV | Serviço de Convivência e Fortalecimento de Vínculos | SMIDS | CH_03, CH_07, CH_08 | Municipal | Crianças, adolescentes, adultos e idosos em vulnerabilidade |
| CCS | Centro de Convivência Social — Jd. Rosolém | SMIDS | *CH_01–CH_08* | NUCLEO_ROSOLEM | Comunidade da área de abrangência |
| PAEFI | Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos | SMIDS | CH_04, CH_05, RT_01 | Municipal | Famílias com violação de direitos |
| CENTRO_POP | Centro de Referência Especializado para População em Situação de Rua | SMIDS | RT_01, RT_02, IU_03 | Municipal | População em situação de rua |
| ABORDAGEM_SOCIAL | Serviço Especializado em Abordagem Social | SMIDS | RT_01, RT_02, IU_03 | Municipal | População em situação de rua |
| MSE_LA_PSC | Serviço de Proteção Social a Adolescentes em Cumprimento de MSE | SMIDS | CH_04, CH_08 | Municipal | Adolescentes em LA ou PSC |
| APOIO_RISCO | Serviço de Apoio a Famílias e Pessoas em Situação de Risco | SMIDS | IU_01, CH_05, RT_01 | Municipal | Famílias e pessoas em situação de risco |
| SAICA | Serviço de Acolhimento Institucional para Crianças e Adolescentes | SMIDS | CH_01, CH_04, CH_05 | Municipal | Crianças e adolescentes com direitos violados |
| ABRIGO_ADULTOS | Abrigo Institucional para Adultos e Famílias em Situação de Rua | SMIDS | IU_03, RT_01, RT_02 | Municipal | Adultos em situação de rua |
| ABRIGO_MULHERES | Abrigo Institucional para Mulheres em Situação de Violência | SMIDS | CH_04, CH_05 | Municipal | Mulheres em violência doméstica ou sexual |
| RESIDENCIA_INCLUSIVA | Residência Inclusiva para Jovens e Adultos com Deficiência | SMIDS | *CH_01–CH_08* | Municipal | Jovens e adultos com deficiência |
| ILPI | Casa-Lar e ILPI — Acolhimento para Idosos | SMIDS | RT_04, CH_06 | Municipal | Idosos sem suporte familiar |
| REPUBLICA | República — Acolhimento para Jovens e Adultos em Saída da Rua | SMIDS | RT_01, RT_02, RT_03 | Municipal | Jovens e adultos em saída da situação de rua |
| APADRINHAMENTO | Programa de Apadrinhamento para Crianças e Adolescentes em Acolhimento | SMIDS | CH_04, CH_05 | Municipal | Crianças e adolescentes em acolhimento |
| TRAB_INFANTIL | Programa de Enfrentamento ao Trabalho Infantil | SMIDS | RT_05, CH_03 | Municipal | Crianças e adolescentes em trabalho infantil |
| ATEND_DOMICILIAR | Serviço de Atendimento Domiciliar para PCD e Idosos | SMIDS | RT_04, CH_06 | Municipal | PCD e idosos em domicílio |
| PROTECAO_PCD_IDOSO | Serviço de Proteção Social Especial para PCD, Idosos e suas Famílias | SMIDS | RT_04, CH_06 | Municipal | PCD, idosos e famílias |
| RESSIGNIFICA | Programa Ressignifica Hortolândia | SMIDS | RT_01, RT_02, IU_03, CH_05 | Municipal | Moradores em situação de rua |

---

### Emprego e Renda

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| ACERTE | Ação Cidadã de Requalificação, Trabalho e Educação | Gov. (Dep. Rel. Inst.) | RT_01, RT_02, RT_03 | Municipal | Pessoas em vulnerabilidade, egressos, pop. rua |
| CAPACITA | Projeto Capacita | SMIDS | RT_01, RT_03 | Municipal | Pessoas em vulnerabilidade — qualificação |
| COSTURA_IND | Projeto Costura Industrial | SMIDS | RT_01, RT_03 | Municipal | Pessoas em vulnerabilidade — setor têxtil |
| FEIRAS_EMPREEND | Feiras de Empreendedores | SMIDS | RT_01, RT_03 | Municipal | Empreendedores em vulnerabilidade |
| PAT | Posto de Atendimento ao Trabalhador | Sec. Des. Econômico | RT_01, RT_02 | Municipal | Desempregados em geral, PCD |
| PAT_VAGAS | Cadastro de Vagas por Empresa — PAT | Sec. Des. Econômico | RT_01, RT_02 | Municipal | Empresas (oferta) + trabalhadores (demanda) |
| SINE | Cadastro no SINE e Encaminhamento para Vagas | Sec. Des. Econômico | RT_01, RT_02 | Municipal | Trabalhadores desempregados |
| PEI | Polo de Empregabilidade Inclusiva | SMIDS | RT_01, RT_02 | Municipal | PCD em busca de inserção no mercado |
| BANCO_POVO | Banco do Povo | Sec. Des. Econômico | RT_01, RT_03 | Municipal | MEI, ME, EPP, LTDA, EIRELI |
| ORIENT_MEI | Orientação ao MEI | Sec. Des. Econômico | RT_01, RT_03 | Municipal | MEIs |
| SEBRAE_AQUI | SEBRAE Aqui | Sec. Des. Econômico | RT_01, RT_03 | Municipal | Empreendedores |
| SEG_DESEMPREGO | Seguro Desemprego | Sec. Des. Econômico | RT_01, RT_02 | Municipal | Trabalhador formal dispensado sem justa causa |
| FEIRAS_LIVRES | Feiras Livres e Noturnas | Sec. Des. Econômico | RT_01, RT_03 | Municipal | Feirantes + população geral |
| FUNDO_CURSOS | Fundo Social — Cursos Profissionalizantes | Fundo Social | RT_01, RT_03 | Municipal | Pessoas 16+ em vulnerabilidade |
| MEU_EMPREGO | Programa Meu Emprego — Trabalho em Equipe | SMIDS | RT_01, RT_02, CH_08 | Municipal | Jovens 16–20 + desempregados +3 meses |
| DECOLA | DECOLA | SMIDS | RT_01, RT_02 | Municipal | A confirmar — empregabilidade |
| APRENDIZ_SOCIAL | Aprendiz Social | SMIDS | *RT_01–RT_05* | Municipal | Jovens — formação para o mercado |
| EMPREGA_HORTOLANDIA | Emprega Hortolândia — Política Pública de Empregabilidade | Sec. Des. Econômico | RT_01, RT_02, RT_03 | Municipal | Trabalhadores residentes e empresas instaladas |
| FEIRAO_EMPREGO | Feirão do Emprego | Sec. Des. Econômico | RT_01, RT_02 | Municipal | Trabalhadores em busca de emprego + empresas |

---

### Habitação

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| AGORA_CASA | Agora a Casa é Sua | Habitação | IU_01 | Municipal | Famílias em situação irregular |
| MCMV | Minha Casa, Minha Vida — Hortolândia | Habitação | IU_01, IU_02 | Municipal | Famílias em vulnerabilidade |
| PHLIS | Plano Municipal de Habitação de Interesse Social | Habitação | *IU_01, IU_02, IU_03* | Municipal | Município |

---

### Segurança Alimentar

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| BAH | Banco de Alimentos de Hortolândia | Educação | RT_01 | Municipal | Pop. em insegurança via 19 OSCs parceiras |
| PAA | Programa de Aquisição de Alimentos | Educação | RT_01 | Municipal | Agricultores familiares + beneficiários BAH |
| CESTAS | Distribuição de Cestas Básicas | SMIDS / Fundo Social | RT_01 | Municipal | Famílias em vulnerabilidade |
| COZINHA_COM | Cozinha Comunitária | Educação | *RT_01–RT_05* | A confirmar | Comunidade |

---

### Direitos Humanos

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| POL_PCD | Cadastro e Políticas para PCD | Gov. (DPCD) | CH_06, CH_07 | Municipal | Pessoas com deficiência |
| POL_IDOSO | Políticas para Pessoa Idosa | Gov. (Dep. Dir. Humanos) | *CH_01–CH_08* | Municipal | Idosos em vulnerabilidade |
| CCMI | Centro de Convivência da Melhor Idade | Gov. (Dep. Dir. Humanos) | RT_04 | Municipal | Idosos 60+ |
| POL_JUVENTUDE | Políticas para a Juventude | Gov. (Dep. Dir. Humanos) | *CH_01–CH_08* | Municipal | Jovens 15–29 anos |
| IGUALDADE_RACIAL | Políticas de Igualdade Racial | Gov. (Dep. Dir. Humanos) | *IU + CH + RT* | Municipal | Pop. negra, indígena, comunidades tradicionais |
| CRAM | CRAM — Centro de Referência de Atendimento à Mulher | Gov. (Dep. Mulheres) | CH_04, CH_05 | Municipal | Mulheres em situação de violência |
| CLOSET_SOL | Closet Solidário | Gov. (Dep. Mulheres) | CH_05 | Municipal | Mulheres atendidas pelo CRAM |
| ELES_ELAS | Movimento Eles Por Elas Hortolândia | Gov. (Dep. Mulheres) | CH_04 | Municipal | População masculina — conscientização contra violência |

---

### Saúde

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| CUIDAR | Programa Cuidar | Fundo Social | CH_01, CH_04 | Municipal | Gestantes a partir da 34ª semana |
| FARMACIA_SOL | Farmácia Solidária | SMIDS | CH_06 | Municipal | Pessoas em vulnerabilidade socioeconômica |
| VIVA_MAIS | Viva Mais | Gov. (Dep. Rel. Inst.) | *CH_01–CH_08* | Municipal | Comunidade geral |
| AMBULATORIO_TRANS | Ambulatório Trans | Saúde | CH_06 | Municipal | População transexual |
| SAMU | SAMU Regional Hortolândia e Sumaré | Saúde | CH_01 | Municipal | Pop. geral em urgência/emergência |

---

### Educação

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| BOLSA_CRECHE | Bolsa Creche | Educação | CH_02, CH_03 | Municipal | Crianças sem vaga na rede pública |
| CRIANCA_FELIZ | Programa Criança Feliz | SMIDS | CH_01, CH_02, CH_05 | Municipal | Gestantes, crianças 0–6 anos em vulnerabilidade |
| COM_PRIMEIRA_INF | Comitê Intersetorial de Políticas para a Primeira Infância | Educação | *CH_01–CH_08* | Municipal | Crianças 0–6 anos |

---

### Cultura

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| FORMACOES_CULT | Formações Culturais (bloco) | Cultura | CH_07, CH_08 | Municipal | Comunidade geral — acesso universal e gratuito |

---

### Governança

| id_programa | Programa | Secretaria | Variáveis IVS | Território | Público-alvo |
| --- | --- | --- | --- | --- | --- |
| INSCRICAO_CMAS | Inscrição de OSCs no CMAS | SMIDS | *GOV* | Municipal | Organizações da Sociedade Civil |
| INSCRICAO_CMDCA | Inscrição de OSCs no CMDCA | SMIDS | *GOV* | Municipal | OSCs voltadas à criança e adolescente |

---

## Análise de cobertura por variável IVS

| Variável | Programas que a endereçam | Gaps identificados |
| --- | --- | --- |
| IU_01 | APOIO_RISCO, AGORA_CASA, MCMV, PHLIS | Sem programa de saneamento direto |
| IU_02 | MCMV, PHLIS | Cobertura restrita a habitação formal |
| IU_03 | CENTRO_POP, ABORDAGEM_SOCIAL, ABRIGO_ADULTOS, RESSIGNIFICA | Mobilidade/deslocamento sem cobertura específica |
| CH_01 | SAICA, CRIANCA_FELIZ, CUIDAR, SAMU | Cobertura presente |
| CH_02 | BOLSA_CRECHE, CRIANCA_FELIZ | Cobertura restrita à primeira infância |
| CH_03 | SCFV, TRAB_INFANTIL, BOLSA_CRECHE | Evasão 6–14 com cobertura razoável |
| CH_04 | PAEFI, SAICA, ABRIGO_MULHERES, MSE_LA_PSC, APADRINHAMENTO, CRAM, ELES_ELAS, CUIDAR | Boa cobertura |
| CH_05 | PAIF, PAEFI, SAICA, ABRIGO_MULHERES, APOIO_RISCO, APADRINHAMENTO, RESSIGNIFICA, CRIANCA_FELIZ, CLOSET_SOL | Boa cobertura |
| CH_06 | ILPI, ATEND_DOMICILIAR, PROTECAO_PCD_IDOSO, POL_PCD, FARMACIA_SOL, AMBULATORIO_TRANS | Cobertura presente; analfabetismo adulto com gap de qualificação |
| CH_07 | SCFV, POL_PCD, FORMACOES_CULT | Gap: baixa cobertura programática |
| CH_08 | SCFV, MSE_LA_PSC, MEU_EMPREGO, FORMACOES_CULT | Nem-nem com cobertura parcial |
| RT_01 | PAIF, PAEFI, CENTRO_POP, ABORDAGEM_SOCIAL, APOIO_RISCO, ABRIGO_ADULTOS, REPUBLICA, RESSIGNIFICA, ACERTE, CAPACITA, COSTURA_IND, PAT, PAT_VAGAS, SINE, BANCO_POVO, ORIENT_MEI, FEIRAS_LIVRES, FUNDO_CURSOS, EMPREGA_HORTOLANDIA, FEIRAO_EMPREGO, BAH, PAA, CESTAS | Variável mais coberta — risco de redundância |
| RT_02 | PAIF, CENTRO_POP, ABORDAGEM_SOCIAL, ABRIGO_ADULTOS, REPUBLICA, RESSIGNIFICA, ACERTE, PAT, PAT_VAGAS, SINE, SEG_DESEMPREGO, MEU_EMPREGO, DECOLA, EMPREGA_HORTOLANDIA, FEIRAO_EMPREGO | Boa cobertura |
| RT_03 | REPUBLICA, ACERTE, CAPACITA, COSTURA_IND, FEIRAS_EMPREEND, BANCO_POVO, ORIENT_MEI, SEBRAE_AQUI, FEIRAS_LIVRES, FUNDO_CURSOS, EMPREGA_HORTOLANDIA | Informalidade com boa cobertura |
| RT_04 | ILPI, ATEND_DOMICILIAR, PROTECAO_PCD_IDOSO, CCMI | **GAP: cobertura restrita — idosos dependentes pouco alcançados** |
| RT_05 | TRAB_INFANTIL | **GAP: apenas 1 programa específico para trabalho infantil** |

---

## Notas metodológicas

1. Variáveis em *itálico* indicam mapeamento por dimensão — aguardam refinamento na `REL_PROGRAMA_INDICADOR` futura.
2. A coluna "Território" reflete o campo `abrangencia_nucleo` do `programa_dim_v08.md`. Quando territorial específico, o loteamento ou núcleo estará disponível após integração com `loteamentosregiao.xls`.
3. A análise de cobertura por variável é ponto de partida — o cruzamento com dados do IVS-H e CadÚnico revelará os gaps reais por loteamento.
4. Programas `planejamento` e `estudo_viabilidade` foram excluídos desta versão.

---

*Documento de modelagem relacional — 02_modelagem_logica/*
*Atlas Social de Hortolândia — uso interno*
