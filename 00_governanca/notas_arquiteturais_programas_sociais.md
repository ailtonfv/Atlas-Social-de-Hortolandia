[notas_arquiteturais_programas_sociais_v03 (1).md](https://github.com/user-attachments/files/27608886/notas_arquiteturais_programas_sociais_v03.1.md)[Uploading notas_# NOTAS ARQUITETURAIS — Programas Sociais de Hortolândia
**Versão:** v03  
**Data:** "11/05/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 00_governanca

---

> **Escopo deste documento:** Laboratório vivo e etnografia operacional da construção do Atlas Social. Registro histórico de fluxos reais, casos documentados, pendências abertas e cronologia de decisões. O conteúdo consolidado e permanente foi extraído para o repositório core — ver seção abaixo.

---

## Conteúdo migrado para o core

| Arquivo no core | Conteúdo extraído deste documento |
|---|---|
| `metodologia/modelagem_operacional/fluxos_e_regras_operacionais.md` | Regras de modelagem, pontos cegos estruturais, fluxos institucionais, trajetórias típicas, decisão sobre loteamentos de fronteira, dependência estrutural em IU |

> O repositório core é privado. O conteúdo aqui permanece como registro histórico completo, rastreável e evolutivo.

---

> Este arquivo concentra o conhecimento operacional e institucional do
> catálogo de programas sociais que **não é cadastro puro**:
> pontos cegos de dados, dependências de convênio, trajetórias típicas,
> fluxos institucionais e pendências de governança.
>
> **É um documento vivo** — deve ser atualizado a cada novo ciclo
> jornalístico, reunião técnica ou decisão arquitetural que afete
> a modelagem dos programas.

---

## 1. Notas Arquiteturais Consolidadas

| # | Nota | Impacto no modelo |
|---|------|-----------------|
| 01 | Centro POP atende sem documentação | Ponto cego no CadÚnico — CPF = PENDENTE em FATO_ATENDIMENTO |
| 02 | Fluxo: Centro POP → Casa de Passagem (triagem, até 30 dias) → Alta Complexidade | Mesma pessoa gera múltiplos registros — CPF é âncora obrigatória para deduplicação |
| 03 | Banco do Povo e SEBRAE: dados ficam nos operadores externos (Desenvolve SP, SEBRAE-SP) | Integração futura requer convênio específico com cada operador |
| 04 | SINE / Seguro Desemprego: dados ficam no MTE federal (Emprega Brasil) | Integração futura requer API federal — prazo indefinido |
| 05 | MEI não aparece no CAGED | Ponto cego no monitoramento de transição produtiva — formalização via MEI não é capturada automaticamente |
| 06 | Seguro Desemprego esgotado sem recolocação → tendência de entrada no CadÚnico | Fluxo de entrada previsível — modelar alerta em FATO_ATENDIMENTO |
| 07 | Feiras Livres: renda informal não declarada ao CadÚnico | Impacto na classificação de vulnerabilidade — subestimação de renda real |
| 08 | `base_legal_principal` em DIM_PROGRAMA é atalho analítico — denormalização consciente | Não substitui REL_NORMA_PROGRAMA (a criar) |
| 09 | `id_orgao_executor` é FK para JOIN | Liga DIM_PROGRAMA → DIM_ORGAO_EXECUTOR → FATO_ATENDIMENTO |
| 10 | Operadores externos (EXT_) sem dimensão interna no modelo | Integração futura via convênio ou API — dados não estão no SIGAS municipal |
| 11 | MCMV Amanda: divergência 421×576 documentações coletadas | Validar junto à Secretaria de Habitação antes de inserir em FATO_ATENDIMENTO |
| 12 | Fluxo CRAM → Conselho Tutelar → CREAS confirmado em "08/03/2026" (dois casos documentados) | Modelar campo `id_encaminhamento_destino` em FATO_ATENDIMENTO — encaminhamento como dado estruturado |
| 13 | Fatec: dados de matrícula ficam no Centro Paula Souza (operador estadual) | Cruzamento CadÚnico × matrículas Fatec futuro — requer convênio estadual |
| 14 | Alta Complexidade executada por OSCs — maioria sem `id_orgao_executor` confirmado | Pendência #19: identificar e cadastrar OSCs executoras antes de inserir registros em FATO_ATENDIMENTO |
| 15 | PEI: dados ficam na Secretaria Estadual de Direitos da PCD | Parceria via Termo de Cooperação Técnica — integração futura requer convênio estadual |
| 16 | Códigos de Região de Planejamento (1 a 6) são gerados pela Prefeitura de Campinas — gestor do SIG regional | Campo `REGIAO-PLAN` em `loteamentos-regiao.xlsx` é somente leitura para Hortolândia — não renomear, não renumerar, não adaptar |
| 17 | Jardim Ricardo: padrão territorial de vulnerabilidade climática recorrente — duas ativações documentadas em 14 dias ("26/02/2026" e "09-10/03/2026") | Flag de risco climático para `dim_municipio_regioes_loteamentos`; variável de déficit de drenagem urbana na dimensão `infraestrutura_urbana` |

---

## 2. Pontos Cegos Estruturais

| Tipo | Descrição | Variável IVS afetada | Mitigação possível |
|---|---|---|---|
| **Sem documentação** | Centro POP atende sem CPF obrigatório | RT_01, IU_01, CH_06 | Registrar CPF = PENDENTE + deduplicação posterior |
| **MEI** | Trabalhadores que se formalizam como MEI não aparecem no CAGED | RT_02, RT_03 | Cruzamento eventual com Receita Federal (CNPJ MEI) |
| **Renda informal** | Feirantes e informais não declaram renda ao CadÚnico | RT_01, RT_03 | Censo 2022 como referência externa |
| **Jovens fora do CadÚnico** | Geração nem-nem não cadastrada — ponto cego em CH_08 | CH_08 | IBGE Censo 2022 para estimativa territorial |
| **Alta Complexidade** | OSCs executoras sem dados integrados ao SIGAS municipal | Todos | Convênio + integração de sistemas (médio prazo) |
| **Operadores externos** | Banco do Povo, SEBRAE, SINE: dados fora do alcance municipal | RT_02, RT_03 | Convênios e API federais (longo prazo) |
| **Renda Censo 2022** | Dados de renda por setor censitário ainda não publicados pelo IBGE | RT_01 | CadÚnico como fonte primária — limitação reconhecida |
| **Drenagem urbana** | Déficit de infraestrutura de drenagem não tem fonte de dados estruturada | IU_01 (variável auxiliar) | Série de ativações do EMERGENCIAS como proxy temporal |

---

## 3. Fluxo Institucional do SUAS em Hortolândia

```
Entrada (3 vias):
  Busca Ativa | Demanda Espontânea | Encaminhamento
       ↓
🟢 PROTEÇÃO BÁSICA (CRAS × 7)
   PAIF · SCFV · BPC · Bolsa Família · Cesta Básica
       ↓ (violação de direitos confirmada)
🟡 PROTEÇÃO ESPECIAL — MÉDIA COMPLEXIDADE (CREAS / Centro POP)
   PAEFI · Medida Socioeducativa · Abordagem Social
   Centro POP → Casa de Passagem Triagem (até 30 dias)
       ↓ (acolhimento necessário)
🔴 PROTEÇÃO ESPECIAL — ALTA COMPLEXIDADE (OSCs conveniadas)
   SAICA (crianças/adolescentes)
   Abrigo Adultos / Famílias em situação de rua (Instituto Esperançar)
   Abrigo Mulheres em situação de violência (OSC a confirmar)
   Residência Inclusiva (PCD — OSC a confirmar)
   Casa-Lar / ILPI (idosos — OSC a confirmar)
   República (jovens/adultos em saída da rua — OSC a confirmar)
```

> **Nota arquitetural:** a Casa de Passagem de Triagem (até 30 dias)
> é subcomponente do Centro POP — distinta da Casa de Passagem como
> modalidade de Alta Complexidade. A mesma pessoa transita pelos dois
> registros — CPF é âncora obrigatória.

---

## 4. Trajetória Típica de Transição Produtiva

```
CadÚnico (entrada)
    ↓
PAIF — acompanhamento familiar (CRAS)
    ↓
Projeto Capacita / Costura Industrial / DECOLA — qualificação
    ↓
PEI — inclusão produtiva para PCD (quando aplicável)
    ↓
[futuro] Fatec Hortolândia — ensino superior tecnológico gratuito
    ↓
PAT / SINE — intermediação de mão de obra
    ↓
BIFURCAÇÃO:
  → Inserção formal (CAGED registra)
  → OU Formalização MEI (Receita Federal registra — ponto cego no CAGED)
    ↓
Banco do Povo — crédito produtivo (opcional)
    ↓
Saída do perfil CadÚnico
(resultado_final = 'emancipado' em FATO_PARTICIPACAO_PROGRAMA)
```

> **Caso documentado:** Suelen — CRAS → ACERTE → assistente administrativa
> → emprego no próprio CRAS. (Tribuna Liberal, "08/03/2026")

---

## 5. Trajetória Típica de Saída da Situação de Rua

```
Busca Ativa / Demanda Espontânea
    ↓
Centro POP — acolhimento, higiene, alimentação, documentação
    ↓
Casa de Passagem Triagem (até 30 dias) — identificação de perfil
    ↓
BIFURCAÇÃO por perfil:
  → Adulto 24–59 anos           → Abrigo Institucional (Instituto Esperançar)
  → Mulher em violência         → Abrigo Mulheres (OSC a confirmar)
  → PCD                         → Residência Inclusiva (OSC a confirmar)
  → Idoso 60+                   → Casa-Lar / ILPI (OSC a confirmar)
  → Jovem/adulto com emprego    → República masc./fem. (OSC a confirmar)
    ↓
Programa Ressignifica — bolsa R$ 700 + cesta + auxílio aluguel
    ↓
ACERTE / DECOLA — qualificação e inserção produtiva
    ↓
Autonomia
```

---

## 6. Fluxo Confirmado CRAM → Conselho Tutelar → CREAS ("08/03/2026")

Dois casos documentados pela Tribuna Liberal em "08/03/2026":

- **Caso 1:** violência doméstica → filho do casal encaminhado ao Conselho Tutelar → fluxo CRAM → CT ativado
- **Caso 2:** companheiro preso em flagrante → vítima buscou medida protetiva → fluxo CRAM → CREAS ativado

> **Implicação para FATO_ATENDIMENTO:** modelar campo `id_encaminhamento_destino` como dado estruturado (não texto livre).

---

## 7. Programa EMERGENCIAS — Histórico de Ativações Documentadas

| Ocorrência | Data | Território | Órgãos envolvidos | Famílias afetadas | Fonte |
|---|---|---|---|---|---|
| 1ª | "26/02/2026" | Jardim Ricardo | SMIDS | 16 famílias desabrigadas | Fechamento "26/02/2026" |
| 2ª | "09-10/03/2026" | Jardim Ricardo | Defesa Civil + Obras + Serviços Urbanos + Meio Ambiente | A confirmar | Tribuna Liberal "12/03/2026", p. 04 |

**Detalhes da 2ª ocorrência:**
- Força-tarefa após reunião do Prefeito Zezé Gomes com moradores (dia 9)
- Defesa Civil: vistorias residência a residência
- Secretaria de Obras: licitação aberta para elevação da ponte sobre o córrego (prazo: 2 meses)
- Concessionária Rodovias do Tietê: obras na SP-101 previstas para agosto/2026
- IPTU prorrogado para "20/03/2026" para moradores atingidos

> Duas ativações em 14 dias configuram **padrão territorial de vulnerabilidade climática recorrente**.

---

## 8. Dados Territoriais — SIG Municipal ("12/03/2026")

| Categoria | Quantidade |
|---|---|
| Total de loteamentos no SIG | 141 |
| Loteamentos em região única | 131 |
| Loteamentos em fronteira entre regiões | 10 |

**Distribuição por Região de Planejamento:**

| Região | Loteamentos |
|---|---|
| 1 | 3 |
| 2 | 35 |
| 3 | 19 |
| 4 | 17 |
| 5 | 33 |
| 6 | 24 |
| **Total** | **131** |

**Loteamentos em fronteira entre regiões (10):**

| Cód. | Nome | Regiões |
|---|---|---|
| 324 | PARQUE DOS PINHEIROS | 2 – 6 |
| 352 | JARDIM ESTEFANIA | 6 – 5 |
| 70 | CHÁCARAS FAZENDA DO COELHO | 4 – 5 |
| 84 | JARDIM SANTA IZABEL | 4 – 5 |
| 302 | JARDIM MINDA | 6 – 5 |
| 81 | NÚCLEO SANTA IZABEL | 4 – 5 |
| 74 | JARDIM SANTANA | 1 – 2 |
| 354 | JARDIM SÃO CAMILO | 6 – 5 |
| 313 | JARDIM CARMEM CRISTINA | 6 – 5 |
| 67 | PARQUE SÃO MIGUEL | 2 – 1 |

> 5 dos 10 loteamentos de fronteira estão entre as Regiões 5 e 6 — zona de maior ambiguidade territorial do município.

**Decisão arquitetural sobre fronteiras:** atribuição à região de menor número para o MVP, com campo `obs_fronteira` documentando a ambiguidade.

**Nota sobre a Região 1:** apenas 3 loteamentos — verificar cobertura de CRAS (pendência #26).

---

## 9. Dependências de Convênio e Integração

| Programa | Dado disponível em | Requisito | Prazo estimado |
|---|---|---|---|
| Banco do Povo | Desenvolve SP | Convênio com Desenvolve SP | Médio prazo |
| SEBRAE Aqui | SEBRAE-SP | Convênio com SEBRAE | Médio prazo |
| SINE / Emprega Brasil | MTE federal | API federal | Longo prazo |
| Seguro Desemprego | MTE federal | API federal | Longo prazo |
| Fatec | Centro Paula Souza | Convênio estadual | Dependente de implantação |
| PEI | Sec. Est. Direitos PCD | Extensão do Termo de Cooperação | Curto prazo |
| Alta Complexidade (OSCs) | Sistemas das OSCs | Convênio de compartilhamento | Médio prazo |
| CAGED | MTE federal | Já disponível — extração mensal | Imediato |
| DATASUS | MS federal | Já disponível — solicitação formal | Imediato |

---

## 10. Contexto — Mercado Formal e CadÚnico

| Indicador | Valor | Fonte |
|---|---|---|
| Empregos formais | 49.100 | CAGED jan–mar/2023 |
| Remuneração média formal | R$ 4.700 | CAGED jan–mar/2023 |
| Saldo CAGED jan/2026 | +140 vagas (+57,3% vs jan/2025) | CAGED jan/2026 |
| CadÚnico dez/2025 | ~73.000 pessoas | CECAD |
| População estimada | ~240.000 habitantes | IBGE |
| Cobertura CadÚnico/população | ~30% | Estimativa |

> **Tensão analítica central:** 49.100 empregos formais com R$ 4.700 de remuneração média convivem com ~73.000 pessoas no CadÚnico. Essa tensão é o ponto de partida do IVS-H e da análise de emancipação assistida.

---

## 11. Dependência Estrutural em Infraestrutura Urbana

A prefeitura tem baixa capacidade de política própria na dimensão IU — os programas dependem majoritariamente de CDHU, MCMV (União), SABESP e Cidade Legal (Estado).

> **Implicação para o IVS-H:** variáveis IU_01 e IU_02 têm baixo poder discriminatório entre territórios porque a cobertura de saneamento é elevada (~100% água, ~96% esgoto). **Exceção emergente:** o déficit de drenagem urbana documentado no Jardim Ricardo indica que IU_01 pode ter poder discriminatório maior do que aparenta — desde que a variável capture drenagem, não apenas abastecimento e esgoto.

---

## 12. Pendências Abertas

| # | Pendência | Prioridade | Arquivo impactado |
|---|---|---|---|
| 01 | Confirmar distinção Projeto Capacita × Capacita Hortolândia (Fundo Social) | Alta | dim_programa |
| 02 | Confirmar distinção Escola Comunitária × Cozinha Comunitária | Média | dim_programa |
| 03 | Confirmar se Atend. Domiciliar e Proteção Especial PCD/Idosos são modalidades distintas | Média | dim_programa |
| 04 | Detalhar critério de acesso da Farmácia Solidária — vínculo CadÚnico? | Média | dim_programa |
| 05 | Verificar registro de matrículas nas Formações Culturais para FATO_ATENDIMENTO | Baixa | dim_programa |
| 06 | Confirmar vínculo CadÚnico para acesso ao Banco do Povo | Média | dim_programa |
| 07 | DECOLA Juventude — confirmar relação com Aprendiz Social | Alta | dim_programa |
| 08 | Vila da Saúde — monitorar confirmação de secretaria e prazo | Baixa | dim_programa |
| 09 | Cruzar cobertura territorial dos 7 CRAS com `loteamentos-regiao.xlsx` | Alta | dim_territorio |
| 10 | Levantar leis municipais de criação dos CRAS, Centro POP, ACERTE e Ressignifica | Alta | dim_programa |
| 11 | Confirmar `id_orgao_executor` para ESPACO_INCLUIR e EMPORIO_JACUBA | Média | dim_orgao_executor |
| 12 | Catalogar 12 OSCs parceiras dos CRAS individualmente | Média | dim_orgao_executor |
| 13 | MCMV Amanda: confirmar número oficial de documentações (576?) | Alta | dim_programa |
| 14 | Closet Solidário: confirmar base legal municipal e critérios formais de acesso | Média | dim_programa |
| 15 | Confirmar `id_orgao_executor` DEP_MULHERES | Média | dim_orgao_executor |
| 16 | Programa Vida Longa: monitorar negociações com o Estado | Média | dim_programa |
| 17 | Fatec Hortolândia: monitorar evolução do estudo de viabilidade | Alta | dim_programa |
| 18 | Monte Sinai: confirmar número oficial de famílias beneficiadas (~650) | Média | dim_programa |
| 19 | Identificar OSCs executoras das 5 modalidades de Alta Complexidade | Alta | dim_orgao_executor + dim_programa |
| 20 | Confirmar se Aprendiz Social é denominação atual do DECOLA Juventude ou programa distinto | Alta | dim_programa |
| 21 | Confirmar quais dados de Alta Complexidade vão ao SIGAS e quais ao CadÚnico | Alta | fato_atendimento |
| 22 | Fatec — confirmar local da reunião de "09/03/2026": Câmara Municipal ou SMIDS | Média | dim_programa |
| 23 | PEI — confirmar `id_orgao_executor` definitivo, base legal municipal e critérios de acesso | Alta | dim_programa + dim_orgao_executor |
| 24 | Verificar se Cooperuni (CNPJ 06.871.886/0001-25) tem vínculo com público CadÚnico | Média | dim_osc |
| 25 | Jardim Ricardo: confirmar número de famílias afetadas na 2ª ocorrência junto à Defesa Civil | Média | FATO_IVS_LOTEAMENTO (futuro) |
| 26 | Verificar cobertura de CRAS para a Região 1 (3 loteamentos) | Alta | dim_orgao_executor + dim_territorio |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | "11/03/2026" | Criação — 15 notas arquiteturais; 7 pontos cegos; 2 trajetórias típicas; fluxo CRAM confirmado; 23 pendências |
| v02 | "12/03/2026" | Notas 16 e 17 adicionadas; Seções 7 e 8 criadas; ponto cego de drenagem; pendências 24–26 |
| v03 | "11/05/2026" | Cabeçalho de escopo adicionado; seção "Conteúdo migrado para o core" incluída |

---

*Documento de governança — 00_governanca/*  
*Atlas Social de Hortolândia — uso interno*
arquiteturais_programas_sociais_v03 (1).md…]()
