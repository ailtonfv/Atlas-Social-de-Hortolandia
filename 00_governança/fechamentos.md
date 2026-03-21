
[files (1).zip](https://github.com/user-attachments/files/26161486/files.1.zip)
[fechamento_dia_21_03_2026.md](https://github.com/user-attachments/files/26161663/fechamento_dia_21_03_2026.md)
# Fechamento do Dia — 21/03/2026

**Projeto:** Atlas Social de Hortolândia  
**Repositório:** `ailtonfv/Atlas-Social-de-Hortolandia`  
**Sessão:** Sábado, 21 de março de 2026

---

## 1. Contexto da Sessão

Sessão de sábado com dupla frente: leitura e análise das edições do jornal
Tribuna Liberal (21 e 22/03/2026) e avanço conceitual e documental do projeto,
com três entregas principais — IPST-H v02, palestra v10 e cinco slides SVG do
bloco metodológico IVS.

---

## 2. Decisões Definitivas da Sessão

Estas decisões são estruturantes e não devem ser revertidas sem registro explícito.

### 2.1 Arquitetura dos índices — definição final

O Atlas Social opera com dois índices distintos e complementares:

**Índice 1 — IVS (Base Estrutural)**

| Camada | Descrição |
| --- | --- |
| IVS-IPEA | 16 variáveis oficiais, metodologia IPEA, comparabilidade nacional |
| IVS-H | Mesmas 16 variáveis, dados locais, construção progressiva por fases |

O IVS-H não altera o modelo do IPEA. Altera apenas a cobertura de dados.

**Índice 2 — IPST-H (Leitura Operacional)**

Índice próprio municipal. Mede pressão sobre o Estado em três eixos:
pressão territorial, pressão operacional sobre a rede e lacunas de cobertura.

### 2.2 As 16 variáveis oficiais do IVS-IPEA — fechadas

| Dimensão | Código | Variável |
| --- | --- | --- |
| Infraestrutura Urbana | IU_01 | % pessoas em domicílios com água/esgoto inadequados |
| Infraestrutura Urbana | IU_02 | % população urbana sem coleta de lixo |
| Infraestrutura Urbana | IU_03 | % pessoas com renda ≤ ½ SM e deslocamento ao trabalho > 1h |
| Capital Humano | CH_01 | Mortalidade infantil (até 1 ano) |
| Capital Humano | CH_02 | % crianças de 0 a 5 anos fora da escola |
| Capital Humano | CH_03 | % crianças de 6 a 14 anos fora da escola |
| Capital Humano | CH_04 | % mulheres de 10 a 17 anos que tiveram filhos |
| Capital Humano | CH_05 | % mães chefes de família, sem fund. completo, filho < 15 anos |
| Capital Humano | CH_06 | Taxa de analfabetismo — 15 anos ou mais |
| Capital Humano | CH_07 | % crianças em domicílios sem morador com fund. completo |
| Capital Humano | CH_08 | % jovens 15–24 que não estudam, não trabalham, renda ≤ ½ SM |
| Renda e Trabalho | RT_01 | % pessoas com renda domiciliar per capita ≤ ½ SM |
| Renda e Trabalho | RT_02 | Taxa de desocupação — 18 anos ou mais |
| Renda e Trabalho | RT_03 | % pessoas 18+ sem fund. completo em ocupação informal |
| Renda e Trabalho | RT_04 | % pessoas em domicílios com renda ≤ ½ SM dependentes de idosos |
| Renda e Trabalho | RT_05 | Taxa de atividade de crianças de 10 a 14 anos (trabalho infantil) |

### 2.3 Estrutura de fases do IVS-H

- **Fase 1 — MVP:** 5 variáveis imediatamente disponíveis no CadÚnico
  (CH_05, CH_06, CH_07, RT_01, RT_04)
- **Fase 2 — Expansão:** variáveis adicionais conforme acesso às fontes
- **Fase 3 — Horizonte metodológico** (não é fase operacional):
  *"O modelo converge para a incorporação das 16 variáveis do IVS/IPEA
  à medida que as fontes forem disponibilizadas, preservando a estrutura
  original do índice."*

### 2.4 Frase síntese oficial IVS × IPST-H

> *"O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a
> vulnerabilidade se transforma em pressão sobre o Estado."*

### 2.5 RT_06 e RT_07 — destino definido

RT_06 (deslocamento para trabalho) e RT_07 (deslocamento para estudo)
**não pertencem ao IVS-H**. Pertencem ao IPST-H (eixo Pressão
Territorial, variáveis PT_05 e PT_06). O IVS-H preserva as 16
variáveis do IPEA sem acréscimos.

---

## 3. Arquivos Produzidos

| Arquivo | Versão | Destino no Repositório | Status |
| --- | --- | --- | --- |
| `ipst_h_v01.md` | v01 | `01_modelagem_conceitual/` | Commitado |
| `ipst_h_v02.md` | v02 | `01_modelagem_conceitual/` | Aguarda upload |
| `palestra_marco_2026_v10.md` | v10 | `00_governança/` | Aguarda upload |
| `slide_07_ivs_ipea.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10_ivsh_proposta.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10a_tres_indices.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10b_comparativo.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10c_dois_indices.svg` | v01 | uso externo / PowerPoint | Gerado |

### Pendência crítica

A `dim_variavel_IVS_v01r5.md` precisa de revisão para v01r6:

- Restaurar IU_03 na dimensão Infraestrutura Urbana
- Remover RT_06 e RT_07 do arquivo (pertencem ao IPST-H)
- Ajustar total de variáveis IVS-H para 16 (não 17)

---

## 4. O que Mudou em Cada Arquivo

### `ipst_h_v02.md`

Alterações em relação à v01:

- Eixo 2 renomeado: "Sobrecarga da Rede" → "Pressão Operacional sobre a Rede"
- PT_01 redefinido: proporção sobre população total → densidade sobre
  domicílios Censo 2022 (CadÚnico ≠ população total)
- Seção 2 expandida: CadÚnico como demanda identificada, não demanda real
- Seção 3 criada: "O que o IPST-H NÃO é" — 4 itens com justificativa
  (não é ranking, não é avaliação, não é punição, não é produtividade)
- Pesos: de fixos para "pesos iniciais sugeridos (MVP)" com nota de
  recalibração empírica
- Frase síntese atualizada para versão definitiva

### `palestra_marco_2026_v10.md`

Alterações em relação à v09:

- Público redefinido: secretário adjunto, diretores e corpo técnico da Inclusão
- Slide 1 reescrito: abre com a pergunta da rede, não com argumento metodológico
- Slide 10 reescrito: pesos como leitura progressiva (sem calibração prematura)
- Slide 10a criado: três índices, três funções
- Slide 10c criado: dois índices para o público da Inclusão + matriz IVS-H × IPST-H
- Slides 12, 13, 15, 18: reescritos com vocabulário da rotina da Inclusão
  (fila invisível, busca ativa, cobertura, lacuna, priorização)
- Slide 16 reescrito: Inclusão como núcleo de inteligência social do município
- Slide 20 reescrito: argumento para a Secretaria (não para o prefeito)
- Slide 22 expandido: frase de fechamento adicional
- Slide 23 expandido: decisões práticas da Inclusão
- Referências ao número de variáveis removidas da palestra

---

## 5. Análise do Jornal — Tribuna Liberal 21 e 22/03/2026

### Itens com impacto direto no projeto

**Hortolândia — alta relevância:**

- Exposição "Mulheres que Inspiram" (SMIDS/DPP PcD) — abre segunda-feira (23/03)
  no Palácio dos Migrantes. Quézia Garcia (DPP PcD) citada nominalmente.
- Reajuste do funcionalismo: Lei 4.606/2026 — 2,51% para 5.200 servidores,
  IPCA de 10 meses (data-base antecipada para março por período eleitoral).
- Residencial sênior Terça da Serra — segunda unidade no Parque Ortolândia,
  30 leitos. Contexto: envelhecimento demográfico, Economia Prateada,
  impacto futuro em RT_04.
- Saúde recebeu equipamentos na 17ª Caravana Federativa — fisioterapia,
  reabilitação, oftalmologia. Impacta capacidade de resposta Capital Humano.

**Região — relevância contextual:**

- Paradoxo hídrico bacias PCJ — rios cheios mas risco estrutural de longo prazo.
  Sustenta peso reduzido mas não nulo de IU no IVS-H.
- SEAS de Sumaré amplia abordagem social via Bom Prato — modelo operacional
  comparativo para o eixo SR do IPST-H.

---

## 6. Situação do Projeto — Etapas

| Etapa | Status |
| --- | --- |
| Catálogo de programas (66 programas) | Concluído |
| DIM_ORGAO_EXECUTOR v05 | Concluído |
| DIM_NUCLEO v01 | Concluído |
| REL_PROGRAMA_INDICADOR v01 | Concluído |
| DIM_DINAMICA_METROPOLITANA v03 | Concluído |
| Arquitetura dados IVS v10 | Concluído |
| IPST-H v02 | Concluído hoje |
| Palestra marco 2026 v10 | Concluído hoje |
| Slides SVG bloco IVS (5 slides) | Concluído hoje |
| dim_variavel_IVS_v01r6 | Pendente — próxima sessão |
| id_programa = SISTEMA em DIM_PROGRAMA | Pendente |
| Dicionário domicilio1/2/3 — variáveis IU | Pendente |
| Reunião com Cláudia — sobreposições territoriais | Bloqueado — externo |
| Sign-off Jesus José — planilha territorial v03 | Pendente |
| Cálculo IVS-H MVP — Produto 1 (CadÚnico) | Próximas sessões |
| Apresentação para equipe da Inclusão | Esta semana |

---

## 7. Agenda para a Próxima Sessão

| Prioridade | Ação |
| --- | --- |
| 1 | Subir `ipst_h_v02.md` e `palestra_marco_2026_v10.md` no GitHub |
| 2 | Produzir `dim_variavel_IVS_v01r6.md` — restaurar IU_03, remover RT_06/RT_07, ajustar total para 16 |
| 3 | Adicionar `id_programa = SISTEMA` em DIM_PROGRAMA |
| 4 | Verificar dicionário domicilio1/2/3 — localizar IU_01, IU_02 |
| 5 | Preparar apresentação para equipe da Inclusão |
| 6 | Retomar pipeline IVS-H — avançar no Produto 1 (5 variáveis CadÚnico) |

---

## 8. Nota Estratégica — Apresentação para a Inclusão

A sessão produziu três argumentos novos especificamente calibrados para
o público técnico da Secretaria:

1. **A frase da rede:** *"A rede já conhece muitos casos. O problema é
   transformar esse conhecimento disperso em leitura territorial
   comparável e acionável."* — posiciona o Atlas Social como
   organização do que já existe, não como descoberta externa.

2. **O IPST-H como instrumento de proteção:** o índice mede condições
   estruturais do território — não desempenho de equipes. Alta pressão
   é argumento para reforço, nunca para responsabilização.

3. **Três promessas práticas:** o Atlas Social ajuda a enxergar melhor,
   priorizar territórios e comprovar resultados. Cada uma tem resposta
   direta para a rotina do CRAS.

---

*Fechamento — Atlas Social de Hortolândia*  
*Sessão de 21 de março de 2026*
