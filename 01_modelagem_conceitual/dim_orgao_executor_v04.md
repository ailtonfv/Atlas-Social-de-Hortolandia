# DIM_ORGAO_EXECUTOR
**Versão:** v05  
**Data:** 2026-03-15  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Este documento consolida `dim_osc_v01.md`, `dim_gestores_municipais_v06.md` e
> `dim_unidades_de_atendimento_v01.md` numa dimensão única e consultável,
> referenciada por FK em `DIM_PROGRAMA` e em `FATO_ATENDIMENTO`.
>
> **Não contém:**
> - Classificação por IVS — em `02_modelagem_lógica/rel_programa_dimensao_ivs.md`
> - Pendências metodológicas de programas — em `00_governanca/notas_arquiteturais_programas_sociais.md`

---

## Nota Estrutural

O município de referência é exclusivamente **Hortolândia-SP (IBGE 3519071)**.
O código IBGE não é campo analítico — é constante estrutural do projeto.

---

## Estrutura da DIM_ORGAO_EXECUTOR

```
id_orgao_executor      PK — padrão: TIPO_NOME (ex: CRAS_AMANDA, OSC_ESPERANCAR)
nome_completo          nome oficial completo
sigla                  sigla operacional, se houver
tipo                   Equipamento SUAS | Equipamento Municipal | Secretaria |
                       Departamento | OSC Conveniada | Operador Externo |
                       Fundo | Conselho
secretaria_mae         secretaria à qual o órgão está subordinado
esfera                 Municipal | Estadual | Federal
endereco               endereço completo
telefone
email
coordenador            nome do responsável atual
nucleo_referencia      id_nucleo do Atlas Social — liga o equipamento à sua
                       área de abrangência territorial (ex: NUCLEO_ROSOLEM)
                       Nulo para secretarias, departamentos e operadores externos
ativo                  S | N
observacoes
```

**Nota sobre `nucleo_referencia`:**
Campo introduzido na v02. Cada CRAS é a sede de um núcleo territorial.
Equipamentos vinculados a um CRAS (ex: CCS Rosolém → CRAS Rosolém)
recebem o mesmo `nucleo_referencia`. Secretarias e operadores externos
recebem NULL — sua atuação é municipal, não territorial.

**Convenção de `id_orgao_executor`:**

```
CRAS_{NOME}        → unidades CRAS
CREAS_{N}          → CREAS
CENTROPOP_{N}      → Centro POP
CRAM_{N}           → CRAM
CQP_{N}            → Centros de Qualificação
CESP               → Centro de Empreendimentos Solidários
PAT_{N}            → PAT
SEC_{SIGLA}        → secretarias municipais
DEP_{NOME}         → departamentos
FUNDO_{NOME}       → fundos municipais
OSC_{NOME}         → OSCs conveniadas
EXT_{NOME}         → operadores externos (SEBRAE, Desenvolve SP etc.)
```

---

## Bloco 1 — Equipamentos SUAS

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | endereço | telefone | email | coordenador | nucleo_referencia | ativo | observacoes |
|---|---|---|---|---|---|---|---|---|---|---|---|
| CRAS_SANTA_CLARA | CRAS Jardim Santa Clara | Equipamento SUAS | SMIDS | Municipal | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 / 3897-2519 | — | A confirmar | NUCLEO_SANTA_CLARA | S | — |
| CRAS_AMANDA | CRAS Jardim Amanda | Equipamento SUAS | SMIDS | Municipal | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 / 3865-7276 | — | A confirmar | NUCLEO_AMANDA | S | Novo coordenador designado mar/2026 (mat. 13868100) — nome a confirmar via portaria 2026 |
| CRAS_NOVO_ANGULO | CRAS Jardim Novo Ângulo | Equipamento SUAS | SMIDS | Municipal | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 / 3845-7629 | — | A confirmar | NUCLEO_NOVO_ANGULO | S | — |
| CRAS_ROSOLEM | CRAS Rosolém — Joel Alves Assunção | Equipamento SUAS | SMIDS | Municipal | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 | — | Joel Alves Assunção | NUCLEO_ROSOLEM | S | — |
| CRAS_PRIMAVERA | CRAS Primavera — Chico Vigilante | Equipamento SUAS | SMIDS | Municipal | Rua Amoreira, 35, Jd. Primavera | 3865-1225 / 3819-6899 | — | A confirmar | NUCLEO_PRIMAVERA | S | — |
| CRAS_BRASIL | CRAS Jardim Brasil — Maria Humilde Antunes (Zuma) | Equipamento SUAS | SMIDS | Municipal | Rua da Amizade, 240, Jardim Brasil | 3909-1398 | — | A confirmar | NUCLEO_BRASIL | S | — |
| CRAS_VILA_REAL | CRAS Vila Real | Equipamento SUAS | SMIDS | Municipal | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 | — | A confirmar | NUCLEO_VILA_REAL | S | Endereço confirmado via PL 15/2026 (Câmara Municipal, mar/2026) |
| CREAS_01 | CREAS — Remanso Campineiro | Equipamento SUAS | SMIDS | Municipal | Rua Francisco Castilho, 298, Remanso Campineiro | (19) 3909-4546 | — | A confirmar | NULL | S | — |
| CENTROPOP_01 | Centro POP — Remanso Campineiro | Equipamento SUAS | SMIDS | Municipal | Rua Maria Bernardes, 505, Remanso Campineiro | (19) 9 9976-1742 | centropop.smids@hortolandia.sp.gov.br | A confirmar | NULL | S | — |

---

## Bloco 2 — Equipamentos Municipais de Apoio

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | endereço | telefone | email | coordenador | nucleo_referencia | ativo | observações |
|---|---|---|---|---|---|---|---|---|---|---|---|
| CRAM_01 | CRAM "Débora Regina Leme dos Santos" | Equipamento Municipal | Dep. de Políticas Públicas para a Mulher | Municipal | Rua Alberto Gomes, 18, Jardim das Paineiras | A confirmar | — | A confirmar | NULL | S | 94 medidas protetivas jan–fev/2026, maior volume da região (+11,9% vs 2025). Fonte: TJ-SP / Tribuna Liberal, 15/03/2026. Interface com Comissão Intersetorial de VD — Decreto 5.810/2026 |
| CQP_I | CQP I — Centro de Qualificação Pessoal e Profissional | Equipamento Municipal | SMIDS | Municipal | Rua Estados Unidos, 271, Jd. Santa Clara do Lago II | A confirmar | — | A confirmar | NUCLEO_SANTA_CLARA | S | — |
| CQP_II | CQP II — Centro de Qualificação — Costura e Moda | Equipamento Municipal | SMIDS | Municipal | Rua Eleusina Batista Silva, 14, Jd. Terras de Santo Antônio | A confirmar | — | A confirmar | NULL | S | — |
| CESP | CESP — Centro de Empreendimentos Solidários e Popular | Equipamento Municipal | SMIDS | Municipal | Rua Zacarias Costa Camargo, 50, Remanso Campineiro | A confirmar | — | A confirmar | NULL | S | — |
| PAT_01 | Posto de Atendimento ao Trabalhador | Equipamento Municipal | Sec. Desenvolvimento Econômico | Municipal | A confirmar | (19) 3965-1400 r. 8904/8925 | pat@hortolandia.sp.gov.br | A confirmar | NULL | S | — |

---

## Bloco 3 — Secretarias Municipais

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|
| SEC_INCLUSAO | Secretaria Municipal de Inclusão e Desenvolvimento Social (SMIDS) | Secretaria | Prefeitura Municipal | Municipal | Maria dos Anjos Assis Barros | NULL | S |
| SEC_EDUCACAO | Secretaria de Educação, Ciência e Tecnologia | Secretaria | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| SEC_HABITACAO | Secretaria de Habitação | Secretaria | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| SEC_SAUDE | Secretaria Municipal de Saúde | Secretaria | Prefeitura Municipal | Municipal | Renato Lopes Machado | NULL | S |
| SEC_DES_ECONOMICO | Secretaria de Desenvolvimento Econômico, Trabalho, Turismo e Inovação | Secretaria | Prefeitura Municipal | Municipal | Dimas Corrêa Pádua | NULL | S |

---

## Bloco 4 — Departamentos Municipais

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|
| DEP_DIPGR | Dep. de Inclusão Produtiva e Gestão de Relações Institucionais | Departamento | SMIDS | Municipal | A confirmar | NULL | S |
| DEP_SEG_ALIMENTAR | Departamento de Segurança Alimentar | Departamento | SEC_EDUCACAO | Municipal | Marcela Bueno Alves | NULL | S |
| DEP_PCD | Dep. de Políticas Públicas para a Pessoa com Deficiência | Departamento | Prefeitura Municipal | Municipal | Quézia Garcia | NULL | S |
| DEP_DIR_HUMANOS | Dep. de Direitos Humanos e Políticas Públicas | Departamento | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| DEP_EMPREEND | Dep. de Empreendedorismo e Microempresas | Departamento | SEC_DES_ECONOMICO | Municipal | A confirmar | NULL | S |
| DEP_CULTURA | Departamento de Cidadania Cultural | Departamento | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| DEP_MULHERES | Dep. de Políticas Públicas para a Mulher | Departamento | Prefeitura Municipal | Municipal | A confirmar | NULL | S |
| DEP_LICIT_CONV | Dep. de Licitações, Projetos e Convênios | Departamento | SMIDS | Municipal | Roberto Morelli | NULL | S |

---

## Bloco 5 — Fundos

| id_orgao_executor | nome_completo | tipo | secretaria_mae | esfera | coordenador | nucleo_referencia | ativo |
|---|---|---|---|---|---|---|---|
| FUNDO_SOCIAL | Fundo Social de Solidariedade de Hortolândia | Fundo | Prefeitura Municipal (Primeira-Dama) | Municipal | A confirmar | NULL | S |

---

## Bloco 6 — OSCs Conveniadas (Identificadas)

| id_orgao_executor | nome_completo | tipo | esfera | foco | nucleo_referencia | convênio_ativo | observações |
|---|---|---|---|---|---|---|---|
| OSC_ESPERANCAR | Instituto Esperançar — Projetos e Ações Sociais | OSC Conveniada | Municipal | Abrigo institucional — alta complexidade | NULL | N | **Encerrou atividades fev/2026.** Parceria rescindida com o Município — Res. CMAS 007/2026 (05/02/2026). Saldo remanescente de R$ 964.288,20 reprogramado para OSC_SAO_PEDRO. Serviços transferidos: SAICA, Casa Lar, República |
| OSC_SAO_PEDRO | Centro Comunitário São Pedro (CCSP) | OSC Conveniada | Municipal | Alta complexidade (SAICA, Casa Lar, República) + Proteção Básica (SCFV) | NULL | S | Principal OSC executora do município após encerramento da Esperançar. Assumiu SAICA + Casa Lar + República (Res. CMAS 007/2026) + R$ 300.000 em emendas para SCFV (Dep. João Cury + Dep. Baleia Rossi, Res. CMAS 11 e 13/2026) + emenda anterior R$ 33.751,96 para equipamentos (Res. CMAS 005/2026). Representante: Laurindo Manoel da Silva |
| OSC_APAE | APAE Hortolândia | OSC Conveniada | Municipal | Deficiência intelectual — Proteção Social Especial PCD | NULL | S | Unidade referenciada para Serviço de Proteção Social Especial para PCD e famílias (18+). Emenda parlamentar R$ 100.000 aprovada — Dep. Rosângela Moro (Res. CMAS 09/2026, mar/2026). Emenda Jonas Donizette R$ 300.000 com prazo prorrogado — Res. CMAS 14/2026 |
| OSC_INSTITUTO_RECRIE | Instituto Recrie | OSC Conveniada | Municipal | Serviço de Convivência e Fortalecimento de Vínculos — SCFV | NULL | S | Classificado em 1º lugar no Chamamento Público 01/2026 (84 pontos) para execução do SCFV por grupos e territórios. Resultado preliminar publicado DO edição 2712 (10/03/2026). Aguarda homologação e assinatura do Termo de Colaboração |
| OSC_AMAAH | AMAAH-SP | OSC Conveniada | Municipal | Autismo — Transtorno do Espectro Autista (TEA) | NULL | S | Projeto Integrado de Desenvolvimento e Autonomia para Crianças e Adolescentes com TEA aprovado no CMDCA (mar/2026). Representante presente nas reuniões do CMDCA: Priscila S. de Paula Silva |
| OSC_CASA_BETANIA | Casa Betânia da Paz | OSC Conveniada | Municipal | A confirmar | NULL | A confirmar | Presente na ata do CMDCA mar/2026. Representantes: Dulcineia Lourdes dos Santos e Thaís Santana. Serviço executado não identificado — ⚠️ Pendência P10 |
| OSC_ASBAFE | ASBAFE | OSC Conveniada | Municipal | A confirmar | NULL | A confirmar | Presente na ata do CMASH mar/2026. Representantes: Maria Carla da Silva S. Amorim e Sara Nobre. Serviço executado não identificado — ⚠️ Pendência P11 |
| OSC_CADEFI | CADEFI / CENDEFI | OSC Conveniada | Municipal | Deficiência | NULL | A confirmar | Parceira dos CRAS |
| OSC_AHDV | AHDV | OSC Conveniada | Municipal | Deficiência visual | NULL | A confirmar | Parceira dos CRAS |
| OSC_PERNAS_VOL | Instituto Pernas Voluntárias | OSC Conveniada | Municipal | PCD | NULL | A confirmar | Parceira dos CRAS |
| OSC_TODOS_AUTISMO | Todos Pelo Autismo | OSC Conveniada | Municipal | Autismo | NULL | A confirmar | Parceira dos CRAS |
| OSC_LUTA_VIDA | Luta pela Vida Hortolândia | OSC Conveniada | Municipal | PCD / esporte | NULL | A confirmar | Parceira dos CRAS |
| OSC_PATRULHEIROS | Assoc. Patrulheiros e Guarda Mirim | OSC Conveniada | Municipal | Juventude | NULL | A confirmar | Parceira dos CRAS |
| OSC_A_CONFIRMAR | OSC executora Alta Complexidade — a identificar | OSC Conveniada | Municipal | Abrigo Mulheres / Residência Inclusiva / ILPI | NULL | A confirmar | ⚠️ Pendência #19 — SAICA, Casa Lar e República agora confirmados em OSC_SAO_PEDRO |

> ⚠️ 12 OSCs parceiras dos CRAS ainda sem `id_orgao_executor` individual — Pendência #12.

---

## Bloco 7 — Operadores Externos (Estaduais e Federais)

| id_orgao_executor | nome_completo | tipo | esfera | contato | nucleo_referencia | observações |
|---|---|---|---|---|---|---|
| EXT_DESENVOLVE_SP | Desenvolve SP | Operador Externo | Estadual | bancodopovo@hortolandia.sp.gov.br / (19) 9 9919-5984 | NULL | Executor do Banco do Povo em Hortolândia |
| EXT_SEBRAE_SP | SEBRAE-SP | Operador Externo | Estadual | A confirmar | NULL | Executor do SEBRAE Aqui |
| EXT_CENTRO_PAULA_SOUZA | Centro Paula Souza — Governo do Estado de SP | Operador Externo | Estadual | A confirmar | NULL | Gestor das Fatecs e Etecs estaduais — estudo de viabilidade Fatec Hortolândia |
| EXT_SEC_DIREITOS_PCD_SP | Secretaria Estadual de Direitos da Pessoa com Deficiência | Operador Externo | Estadual | A confirmar | NULL | Parceira no PEI — Termo de Cooperação Técnica, fev/2026 |

---

## Dado de Contexto — Rede Municipal SUAS

| Indicador | Valor |
|-----------|-------|
| CRAS ativos | 7 |
| CREAS ativos | 1 |
| Centro POP ativo | 1 |
| CRAM ativo | 1 |
| Centros de Qualificação (CQP) | 2 |
| OSCs conveniadas identificadas | 14 (+ pendências) |
| OSCs parceiras CRAS não catalogadas individualmente | 12 (Pendência #12) |
| OSCs encerradas (inativas) | 1 (OSC_ESPERANCAR) |
| Novo CRAS planejado | 1 — FEAS 2026: R$ 515.984,27 reservados; localização a definir |

---

## Pendências Abertas

| # | Pendência | Prioridade |
|---|---|---|
| P01 | Levantar coordenadores atuais de todos os 7 CRAS | Alta |
| P02 | Confirmar telefone do CRAM_01 | Média |
| P03 | Confirmar endereço e telefone do CQP_I e CQP_II | Média |
| P04 | Confirmar endereço e telefone do CESP | Média |
| P05 | Confirmar endereço e contato do PAT_01 | Média |
| P06 | Catalogar 12 OSCs parceiras dos CRAS individualmente | Média |
| P07 | Identificar OSCs executoras de Abrigo Mulheres, Residência Inclusiva e ILPI | Alta |
| P08 | Confirmar `id_orgao_executor` definitivo para o PEI (hoje DEP_PCD provisório) | Alta |
| P09 | Definir `nucleo_referencia` para CREAS_01, CENTROPOP_01, CESP e CQP_II | Média |
| P10 | Identificar serviço executado pela Casa Betânia da Paz | Média |
| P11 | Identificar serviço executado pela ASBAFE | Média |
| P12 | Confirmar resultado final do Chamamento 01/2026 (Instituto Recrie) — aguardar homologação | Alta |
| P13 | Identificar OSC executora do Programa Criança Feliz (atendimento domiciliar primeira infância) | Alta |
| P14 | Confirmar localização do novo CRAS previsto (R$ 515k FEAS reservado) | Alta |
| P15 | Confirmar nome do novo coordenador do CRAS Amanda (mat. 13868100, portaria mar/2026) | Baixa |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — consolida dim_osc, dim_gestores e dim_unidades; 7 blocos |
| v02 | 2026-03-11 | Campo `nucleo_referencia` adicionado; campo `esfera` explicitado em todos os blocos |
| v03 | 2026-03-13 | Correção crítica: código IBGE corrigido de 3519070 para 3519071 |
| v04 | 2026-03-15 | CRAM_01: observacoes com dado de medidas protetivas jan–fev/2026; coluna observacoes adicionada ao Bloco 2 |
| v05 | 2026-03-15 | Atualizações com base em pesquisa DO (edições 2691, 2712, 2715) e atas CMASH/CMDCA jan–mar/2026: (1) OSC_ESPERANCAR → convênio_ativo = N, encerramento documentado; (2) OSC_SAO_PEDRO → novo registro — executor consolidado de alta complexidade + SCFV, R$ 964.288,20 + R$ 300k emendas; (3) OSC_INSTITUTO_RECRIE → novo registro — 1º lugar Chamamento 01/2026; (4) OSC_AMAAH → projeto TEA aprovado CMDCA; (5) OSC_CASA_BETANIA → novo registro; (6) OSC_ASBAFE → novo registro; (7) OSC_APAE → emendas parlamentares documentadas R$ 400k; (8) OSC_A_CONFIRMAR → obs. atualizada (SAICA/Casa Lar/República migrados); (9) DEP_LICIT_CONV → novo departamento SMIDS (Roberto Morelli, portaria 0929/2026); (10) DEP_SEG_ALIMENTAR → coordenador Marcela Bueno Alves; (11) SEC_INCLUSAO → secretária Maria dos Anjos Assis Barros; (12) CRAS_AMANDA → nota coordenador mat. 13868100; (13) CRAS_VILA_REAL → endereço confirmado PL 15/2026; (14) Dado de Contexto: novo CRAS planejado; (15) Pendências P10–P15 adicionadas |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
