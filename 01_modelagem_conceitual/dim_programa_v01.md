# DIM_PROGRAMA — Versão 03
**Projeto:** Inteligência Territorial — Assistência Social Hortolândia  
**Atualizado em:** 28/02/2026  
**Responsável:** Ailton Vendramini  
**Alterações v03:** +Transporte Especial PCD; +Carnaval Inclusivo; +Parque Socioambiental Jd. Santa Emília. Pendência P09 (Fatec) descartada — Fatec é de Paulínia, fora do escopo.

---

## Estrutura da Dimensão

| Campo | Tipo | Descrição |
|---|---|---|
| id_programa | INT | Chave primária |
| nome_programa | TEXT | Nome oficial |
| grupo | TEXT | Grupo temático |
| secretaria_responsavel | TEXT | Secretaria gestora |
| publico_alvo | TEXT | Público beneficiário |
| tipo_beneficio | TEXT | Natureza da entrega |
| valor_beneficio | DECIMAL | Valor em R$ (se aplicável) |
| periodicidade | TEXT | Frequência de entrega |
| status | TEXT | Ativo / Implantação / Planejado / Encerrado |
| fonte_legal | TEXT | Base legal ou normativa |
| fonte_confirmacao | TEXT | Fonte documental |
| observacoes | TEXT | Notas complementares |

---

## Grupo 1 — Transferência de Renda e Benefícios Monetários

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | valor_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|---|
| 001 | Bolsa Família | Federal (SEAS local) | Famílias em pobreza/extrema pobreza | Transferência direta | Variável (federal) | Ativo | MDS / CadÚnico | Gestão federal, operação municipal via CRAS |
| 002 | BPC — Benefício de Prestação Continuada | Federal (INSS/SUAS) | Idosos ≥65 anos e PCD sem renda | Benefício mensal | R$ 1.518,00 (1 SM) | Ativo | LOAS / INSS | Requer laudo médico e CadÚnico |
| 003 | Cesta Básica Municipal | Sec. Inclusão | Famílias em situação de vulnerabilidade | Cesta de alimentos | — | Ativo | Registros CRAS | Volume e periodicidade a confirmar |
| 004 | Atendimento Emergencial | Sec. Inclusão | Famílias em situação de emergência/calamidade | Apoio material emergencial | — | Ativo | Tribuna Liberal 27/02/2026 | Acionado em 26/02/2026: 16 famílias afetadas por chuvas |

---

## Grupo 2 — Habitação e Moradia

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | valor_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|---|
| 005 | Minha Casa Minha Vida | Federal + Municipal | Famílias de baixa renda | Unidade habitacional | — | Ativo | Tribuna Liberal / registros municipais | 400 unidades Jardim Amanda; 520 famílias selecionadas |
| 006 | Aluguel Social | Sec. Inclusão / Habitação | Famílias em situação de rua ou emergência | Auxílio financeiro moradia | — | A confirmar | Registros CRAS | Modalidade a confirmar |

---

## Grupo 3 — Serviços Socioassistenciais (SUAS)

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|
| 007 | PAIF — Proteção e Atenção Integral à Família | Sec. Inclusão / CRAS | Famílias em vulnerabilidade social | Acompanhamento familiar | Ativo | Tipificação CNAS 109/2009 | Serviço base dos CRAS |
| 008 | PAEFI — Proteção e Atendimento Especializado | Sec. Inclusão / CREAS | Famílias com direitos violados | Acompanhamento especializado | Ativo | Tipificação CNAS 109/2009 | Operado pelo CREAS |
| 009 | Serviço de Convivência e Fortalecimento de Vínculos | Sec. Inclusão / CRAS | Crianças, adolescentes, idosos | Atividades socioeducativas | Ativo | Tipificação CNAS 109/2009 | Executado em CRAS e OSCs parceiras |
| 010 | Serviço Especializado em Abordagem Social | Sec. Inclusão / Centro POP | População em situação de rua | Abordagem e encaminhamento | Ativo | Tipificação CNAS 109/2009 | Centro POP |
| 011 | Serviço de Acolhimento Institucional | Sec. Inclusão | Crianças, adolescentes, idosos, adultos | Acolhimento temporário | Ativo | Tipificação CNAS 109/2009 | Alta complexidade |

---

## Grupo 4 — Inclusão Produtiva e Qualificação

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | valor_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|---|
| 012 | ACERTE | Sec. de Governo / Parceria | Jovens e adultos desempregados | Qualificação + bolsa | R$ 710,00/mês | Ativo | Tribuna Liberal / registros municipais | Inscrições abertas até 31/03/2026 |
| 013 | DECOLA | Sec. Desenvolvimento Econômico | Empreendedores locais / MEI | Qualificação empreendedora | — | Ativo | Registros municipais | Parceria com iniciativa privada |

---

## Grupo 5 — Inclusão de Pessoas com Deficiência (PCD)

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|
| 014 | Transporte Especial PCD | Sec. Mobilidade Urbana | Pessoas com deficiência | Transporte adaptado | Implantação | Tribuna Liberal 15/02/2026 p.6 | Nova concessão R$ 276 mi / 15 anos; 44 ônibus (40 op. + 4 reserva); todos c/ ar e wi-fi; 7 elétricos adquiridos; edital abril/2026 |
| 015 | Carnaval Inclusivo | Sec. Inclusão | Pessoas com deficiência | Evento de convivência/lazer | Ativo (recorrente) | Tribuna Liberal 17/02/2026 p.4 | 1ª edição fev/2026; ~150 PCDs; Chácara Gold Eventos, Jd. Rosolém; presença do prefeito e primeira-dama |
| 016 | Departamento PCD | Sec. Inclusão | Pessoas com deficiência | Coordenação de serviços PCD | A confirmar | Registros institucionais | Natureza organizacional a verificar (departamento ou programa?) |

---

## Grupo 6 — Esporte, Lazer e Convivência

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|
| 017 | Escolinhas Esportivas Municipais | Sec. Esporte e Lazer | Crianças e adolescentes | Prática esportiva gratuita | Ativo | Tribuna Liberal / registros municipais | 25 modalidades; 7.000+ atendimentos; 100 alunos PCD incluídos |
| 018 | Parque Socioambiental Jd. Santa Emília | Sec. Meio Ambiente / Obras | Moradores: Jd. Santa Emília, Chácaras Reymar, Vila América, Jd. Sumarezinho, Jd. do Braz, Vila Inema | Equipamento público de lazer/esporte | Implantação | Tribuna Liberal 12/02/2026 | 1,2 km às margens Córrego Jacuba; pista caminhada, ciclovia, parquinho, academia; prev. conclusão 2º sem. 2026 |

---

## Grupo 7 — Programas Habitacionais e Urbanos Complementares

| id | nome_programa | secretaria_responsavel | publico_alvo | tipo_beneficio | status | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|
| 019 | Obra Viária Vila Inema | Sec. Obras / Urbanismo | Moradores Vila Inema | Infraestrutura viária | Implantação | Tribuna Liberal 12/02/2026 | Prolongamento R. Sérgio Sidnei de Souza; ligação c/ Av. Panaíno; acesso ao Parque Jd. Santa Emília; prev. 2026 |

---

## Atores Institucionais Confirmados

| Ator | Papel no Ecossistema |
|---|---|
| CRAS (Centros de Referência de Assistência Social) | Porta de entrada proteção social básica |
| CREAS (Centro de Referência Especializado) | Proteção social especial média complexidade |
| Centro POP | Atendimento população em situação de rua |
| Conselho Tutelar | Proteção direitos crianças e adolescentes |
| Fundo Social de Solidariedade | Ações complementares e arrecadação |
| CMS — Conselho Municipal de Saúde | Controle social na saúde |
| CMMA — Conselho Municipal de Meio Ambiente | Controle social ambiental |
| OSCs parceiras | Execução serviços de convivência e acolhimento |

---

## Pendências Abertas

| # | Pendência | Prioridade | Observação |
|---|---|---|---|
| P01 | Número total de CRAS e endereços completos | Alta | Base territorial essencial para DIM_TERRITORIO |
| P02 | Capacidade instalada CRAS (famílias/mês) | Alta | Necessário para calcular cobertura |
| P03 | Critérios formais de elegibilidade — Cesta Básica | Média | Regras de acesso a documentar |
| P04 | Volume e periodicidade do Atendimento Emergencial | Média | Frequência de acionamento |
| P05 | Vínculo Escolinhas Esportivas × CadÚnico | Alta | Confirmar se há cruzamento com base socioassistencial |
| P06 | Departamento PCD — natureza organizacional | Média | É programa, departamento ou serviço? |
| P07 | Data de início edital Transporte Especial PCD | Baixa | Previsto para abril/2026 |
| P08 | Carnaval Inclusivo — recorrência e secretaria executora | Baixa | Indicado como "primeiro de muitos" pela secretária |

---

## Histórico de Versões

| Versão | Data | Alterações |
|---|---|---|
| v01 | 28/02/2026 | Criação inicial — catálogo base |
| v02 | 28/02/2026 | Correções ACERTE, Atend. Emergencial, MCMV, Escolinhas; tabela atores |
| v03 | 28/02/2026 | +Transporte Especial PCD (id014); +Carnaval Inclusivo (id015); +Parque Socioambiental Jd. Santa Emília (id018); +Obra Viária Vila Inema (id019); P09 (Fatec) descartada — Paulínia, fora do escopo |
