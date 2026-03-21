[palestra_marco_2026_v10 (1).md](https://github.com/user-attachments/files/26161410/palestra_marco_2026_v10.1.md)[Uploading palestra# ATLAS SOCIAL DE HORTOLÂNDIA

Vulnerabilidade Social e Integração de Políticas Públicas

*Palestra — Março de 2026*

Versão v10

Ailton Vendramini | Secretaria de Planejamento Estratégico | Hortolândia-SP

---

**Argumento Central**

> *"Nenhuma secretaria sozinha consegue reduzir a vulnerabilidade
> social. O IVS municipal não é apenas um indicador — é uma ferramenta
> de integração do governo."*

**Frase de abertura:**

> *"Como uma cidade de 236 mil habitantes identifica, com precisão,
> onde está a vulnerabilidade social?"*

*A resposta exige três elementos: dados, integração institucional e
visão territorial.*

---

## Slide 0 — Condições de Contorno

> **O que é o GitHub e por que ele importa aqui**
>
> O projeto vive em um repositório público, versionado e auditável. Cada
> decisão técnica e cada arquivo têm data, autor e histórico. GitHub é o
> caderno de campo do projeto, aberto ao mundo.
>
> **O que é o IVS — e o que ele não é**
>
> O IVS não é um ranking de pobreza. É uma medida multidimensional que
> identifica onde as condições de vida mais limitam as escolhas das
> pessoas.
>
> **O que são loteamentos, regiões de planejamento e núcleos**
>
> Hortolândia tem 141 loteamentos, agrupados em Regiões de Planejamento
> (RP), organizados em núcleos operacionais por setor (Inclusão, Saúde,
> Educação). Vulnerabilidade é sobre onde, não apenas quantos.
>
> A hierarquia do município é:
>
> Município → Região de Planejamento → Núcleo → Loteamento
>
> Um mesmo loteamento pode pertencer a núcleos diferentes dependendo do
> setor público que o atende. O CRAS define o núcleo de Inclusão. A UBS
> define o núcleo de Saúde. As coberturas não são idênticas — e essa
> diferença é informação estratégica.
>
> **A população de Hortolândia e o movimento pendular**
>
> 236.641 habitantes (Censo 2022). 58.472 pessoas fazem deslocamento
> intermunicipal diário. Integração com Campinas: 0,42. 40% dos
> trabalhadores levam mais de 30 minutos ao trabalho.
>
> **O que este projeto é — e o que não é**
>
> Não é TI operacional. A TI da prefeitura automatiza processos — e
> faz isso bem. O Atlas Social atua em outra camada: inteligência
> para decisão estratégica. Esse nicho ainda não existe
> formalmente no município.
>
> **Ponto focal na Secretaria de Inclusão**
>
> Solicita-se que seja designado formalmente um ponto focal na
> Secretaria de Inclusão para interface com o projeto, com autonomia
> para validar dados e participar das decisões metodológicas.

---

### Convênios institucionais para acesso a dados

O Atlas Social depende de fontes de dados que não estão disponíveis
publicamente no nível de detalhe necessário para análise por loteamento.
O acesso a essas fontes exige convênios formais.

**Solicita-se que a assessoria jurídica inicie os procedimentos formais.**

#### Convênios Federais

| Órgão | Dado acessado | Por que precisamos | O que perdemos sem ele |
| --- | --- | --- | --- |
| MTE / CAGED | Admissões e demissões de emprego formal, com salário declarado por CPF | Verificar consistência entre renda autodeclarada no CadÚnico e vínculo formal de emprego. Identificar famílias cadastradas como vulneráveis que possuem renda formal não declarada | Sem este convênio, não conseguimos detectar inconsistências cadastrais nem medir o segmento que transita entre vulnerabilidade e emprego formal |
| INSS / DATAPREV | BPC, histórico contributivo, vínculos formais históricos (CNIS) | O CNIS registra todo o histórico de vínculos, contribuições e benefícios previdenciários de cada CPF. Permite identificar dependência de BPC e aposentadoria como componente de renda familiar | Sem este convênio, não conseguimos separar renda de trabalho de renda de benefício previdenciário — distinção essencial para classificar famílias no eixo Renda e Trabalho do IVS-H |
| IBGE | Microdados do Censo 2022 por setor censitário | As variáveis do IVS-H requerem dados populacionais no nível de setor censitário. Os dados agregados disponíveis permitem análise parcial, mas os microdados permitem cruzamentos por domicílio que identificam bolsões internos de vulnerabilidade dentro de um mesmo loteamento | Sem este convênio, o IVS-H permanece calculado apenas em nível de loteamento |
| INEP / MEC | Matrículas, evasão e desempenho escolar por estabelecimento | Cruzar endereço do aluno com loteamento, identificando evasão escolar por núcleo | Evasão e fluxo escolar por loteamento ficam indisponíveis |
| MS / RNDS | Dados de saúde: gravidez na adolescência, mortalidade infantil, cobertura vacinal | Cruzar indicadores de saúde com o recorte por loteamento | As variáveis de saúde na dimensão Capital Humano ficam calculadas apenas por dados municipais, com cobertura incompleta |

#### Convênios Estaduais — São Paulo

| Órgão | Dado acessado | Por que precisamos | O que perdemos sem ele |
| --- | --- | --- | --- |
| SEADE | Dados demográficos estaduais, projeções populacionais | Estimativas populacionais intercensitárias para denominadores atualizados | Taxas calculadas sobre base demográfica desatualizada entre censos |
| SEDS-SP | Cadastro de programas e benefícios da assistência social estadual | Identificar quais famílias de Hortolândia recebem programas estaduais | Programas estaduais ficam invisíveis no mapa de cobertura |
| Secretaria de Educação SP | Dados das escolas estaduais: matrículas, evasão, fluxo escolar | Hortolândia possui escolas estaduais além das municipais | Evasão subestimada nos loteamentos com maior concentração de escolas estaduais |
| SES-SP | Dados do sistema de saúde estadual: internações, procedimentos, cobertura | A rede de saúde de Hortolândia inclui equipamentos estaduais | Indicadores de saúde por loteamento capturam apenas atendimentos municipais |

> **Nota sobre o CNIS:** acessado via convênio com INSS/DATAPREV — não é
> um convênio separado. Registra, por CPF, todos os vínculos formais
> históricos, contribuições previdenciárias e benefícios recebidos.

---

## Bloco 1 — O Problema (Slides 1–5)

**Slide 1 — A pergunta que a rede já faz**

> *"A rede já conhece muitos casos. O problema é transformar esse
> conhecimento disperso em leitura territorial comparável e acionável."*

A Secretaria de Inclusão acumula, diariamente, um conhecimento que
nenhuma outra secretaria possui: o retrato real das famílias mais
vulneráveis da cidade. O Atlas Social não descobre o que a Inclusão
já sabe. Ele organiza esse conhecimento em linguagem territorial
compartilhada — para que oriente decisões além dos limites de cada CRAS.

---

**Slide 1A — O dado que temos até aqui**

Hortolândia possui:

- **49.100** empregos formais com remuneração média de R$ 4.700
- **72.424** pessoas registradas no CadÚnico (dez/2025)

> *"Como uma cidade com esse nível de emprego formal ainda mantém uma
> base tão grande de vulnerabilidade?"*

**Esse é o paradoxo que o Atlas Social precisa explicar.**

Esse número não é abstrato para quem está nesta sala. Cada um dos
72.424 cadastros representa uma família que passou pelos CRAS, pelo
CREAS, pelo CadÚnico — e foi atendida ou está na fila. A pergunta
não é "quantos são". A pergunta é: **onde estão, o que precisam e
o que o Estado pode oferecer?**

---

**Slide 2 — O desafio das cidades modernas**

Os dados existem. Mas estão espalhados:

| Secretaria | Dados que possui |
| --- | --- |
| Assistência Social | CadÚnico, atendimentos CRAS/CREAS |
| Saúde | Mortalidade, gravidez adolescente, e-SUS |
| Educação | Matrículas, evasão escolar |
| Habitação | Favelas, regularização fundiária |
| Desenvolvimento Econômico | Emprego formal, capacitação |

**Cada secretaria possui uma parte do diagnóstico. Nenhuma possui o
quadro completo.**

**Slide 3 — O problema estrutural da gestão pública**

Historicamente, os governos funcionam por secretarias setoriais. Cada
uma possui seus programas, seus indicadores, seus relatórios.

**Resultado: diagnóstico fragmentado da realidade social.**

**Slide 4 — A vulnerabilidade social não pertence a uma secretaria**

| Problema social | Secretarias envolvidas |
| --- | --- |
| Evasão escolar | Educação + Assistência Social |
| Gravidez adolescente | Saúde + Educação |
| Desemprego juvenil | Desenvolvimento + Assistência |
| Pobreza familiar | Assistência + Desenvolvimento |

**Conclusão: a vulnerabilidade é intersetorial por natureza.**

**Slide 5 — A consequência**

Quando cada secretaria analisa apenas seus próprios dados:

- Perde-se a visão do loteamento
- Políticas podem se sobrepor ou se dispersar
- Áreas críticas podem permanecer invisíveis

---

## Bloco 2 — A Solução Metodológica (Slides 6–10)

**Slide 6 — A necessidade de um diagnóstico comum**

> *"Todos os setores do governo devem enxergar a mesma realidade
> social."*

Isso exige: indicadores comuns, bases integradas, leitura por loteamento
compartilhada.

**Slide 7 — O Índice de Vulnerabilidade Social (IVS)**

Desenvolvido pelo IPEA. 16 variáveis. Metodologia reconhecida nacional e
internacionalmente.

| Dimensão | Exemplos de variáveis |
| --- | --- |
| Infraestrutura Urbana | Saneamento, coleta de lixo, mobilidade |
| Capital Humano | Educação, saúde, infância, maternidade |
| Renda e Trabalho | Emprego, renda, informalidade |

**Slide 8 — O IVS como linguagem comum**

- Educação observa capital humano
- Assistência Social observa família
- Desenvolvimento Econômico observa renda e trabalho

**Todos analisam a mesma vulnerabilidade pelo mesmo loteamento.**

**Slide 9 — A realidade de Hortolândia**

| Indicador | Valor (2020) | Fonte |
| --- | --- | --- |
| Cobertura de abastecimento de água | 100% | SNIS / SABESP |
| Coleta de esgoto | 96,4% | SNIS / SABESP |
| Esgoto tratado por água consumida | 89,7% | SNIS / SABESP |

*Hortolândia foi destaque nacional no evento Casos de Sucesso em
Saneamento Básico — Instituto Trata Brasil (2019).*

**49.100 empregos formais convivem com 72.424 pessoas no CadÚnico
(dez/2025). Essa tensão é o desafio central do município.**

---

**Evidências recentes — março de 2026**

*Três fatos da semana confirmam que a vulnerabilidade é dinâmica e
intersetorial — e que os dados do Atlas Social precisam acompanhar
essa dinâmica.*

**1. Ampliação de equipamentos de saúde básica (UBS)**
A prefeitura recebeu na 17ª Caravana Federativa combos de equipamentos
para UBSs — fisioterapia, reabilitação, oftalmologia. Para o IVS-H,
isso afeta diretamente a dimensão Capital Humano: muda a capacidade de
resposta do Estado às variáveis de saúde por loteamento. O dado precisa
ser registrado no modelo.

**2. Inauguração de residencial sênior em Hortolândia**
A Rede Terça da Serra abriu sua segunda unidade no Parque Ortolândia,
com 30 leitos. O contexto é demográfico: a expectativa de vida do
brasileiro supera 76 anos (Censo IBGE). Hortolândia envelhece — e o
indicador de domicílios com renda abaixo de meio SM dependentes de
idosos tende a crescer. O Atlas Social precisa monitorar essa curva.

**3. Paradoxo hídrico nas bacias PCJ**
O Rio Atibaia registrou em março de 2026 vazão muito acima da média
histórica. Rios cheios não significam segurança hídrica estrutural.
Especialistas alertam que períodos de estiagem podem reverter o quadro.
Isso sustenta a decisão de manter os indicadores de infraestrutura no
modelo com peso reduzido mas não nulo: o saneamento atual é bom, mas o
risco de longo prazo é real e territorialmente concentrado.

> *"Vulnerabilidade não é uma fotografia. É um filme. O Atlas Social
> precisa capturar o movimento."*

---

**Slide 10 — A proposta: IVS-H**

> *"IVS-H — Índice de Vulnerabilidade Social de Hortolândia"*

Mesmas variáveis. Mesmas dimensões. Construído progressivamente com as
fontes disponíveis, preservando a âncora metodológica do IPEA.

| Dimensão | Peso IPEA | Peso IVS-H |
| --- | --- | --- |
| Infraestrutura Urbana | 33% | Menor — cobertura local elevada |
| Capital Humano | 33% | Maior — reprodução intergeracional da pobreza |
| Renda e Trabalho | 33% | Maior — tensão emprego formal × vulnerabilidade |

> O IVS-H preserva a estrutura metodológica do IPEA e será construído
> progressivamente, conforme a disponibilidade das 16 variáveis. A
> leitura local das dimensões será aprofundada em paralelo, sem romper
> a âncora metodológica do IPEA.

---

**Slide 10a — Três índices, três funções**

*Este slide apresenta a arquitetura analítica completa do Atlas Social.*

| Índice | Natureza | Pergunta central |
| --- | --- | --- |
| IVS-IPEA | Referência nacional | Onde está a vulnerabilidade no padrão científico nacional? |
| IVS-H | Aplicação local progressiva | Onde está a vulnerabilidade em Hortolândia, com os dados já disponíveis? |
| IPST-H | Leitura operacional | Onde essa vulnerabilidade está pressionando a rede e exigindo reforço do Estado? |

> *"O IPEA nos dá a base. O IVS-H territorializa essa base em
> Hortolândia. O IPST-H mostra onde essa realidade já está
> pressionando o Estado."*

**IVS-IPEA — âncora metodológica e comparabilidade**

- 16 variáveis, metodologia oficial do IPEA
- Comparabilidade nacional
- Atualização limitada ao ciclo do IBGE
- Função: saber onde Hortolândia está em relação ao Brasil

**IVS-H — aplicação local progressiva**

- Mesmas 16 variáveis do IPEA
- Calculado com dados disponíveis localmente (CadÚnico, CAGED, IBGE)
- Evolução em fases conforme acesso às fontes
- Função: medir vulnerabilidade com maior frequência e granularidade
  territorial

**IPST-H — leitura operacional da pressão**

- Índice próprio do município
- Mede pressão territorial, sobrecarga operacional e lacunas de cobertura
- Complementa o IVS — não o substitui
- Função: identificar onde a prefeitura precisa estar mais presente

---

**Slide 10b — IVS-IPEA × IVS-H: o que muda e por que**

*Lâmina de referência — pode ser impressa como material de apoio.*

**O que é igual:**

| Elemento | IVS-IPEA | IVS-H |
| --- | --- | --- |
| Número de variáveis | 16 | 16 |
| Dimensões | 3 (IU / CH / RT) | 3 (IU / CH / RT) |
| Base científica | IPEA, 2015 | IPEA, 2015 |
| Comparabilidade intermunicipal | Sim | Sim (via âncora IPEA) |

**O que muda:**

| Elemento | IVS-IPEA | IVS-H |
| --- | --- | --- |
| Recorte de análise | Nacional / municipal | Loteamento → RP → Núcleo |
| Fonte de dados | Censo IBGE (decenal) | CadÚnico + Censo + CAGED |
| Atualização | Decenal | Contínua (CadÚnico) |
| Construção | Completo | Progressiva — fase a fase |

**5 variáveis já disponíveis no CadÚnico dez/2025:**

| Código | Variável | Dimensão |
| --- | --- | --- |
| CH_05 | % mães chefes de família, sem fund. completo, filho menor de 15 anos | Capital Humano |
| CH_06 | Taxa de analfabetismo — 15 anos ou mais | Capital Humano |
| CH_07 | % crianças em domicílios sem nenhum morador com fund. completo | Capital Humano |
| RT_01 | % pessoas com renda per capita menor ou igual a meio SM | Renda e Trabalho |
| RT_04 | % domicílios com renda menor ou igual a meio SM dependentes de idosos | Renda e Trabalho |

---

**Slide 10c — Dois índices, duas funções**

*Para o público da Inclusão: a distinção que mais importa na prática.*

| | IVS-H | IPST-H |
| --- | --- | --- |
| Natureza | Índice estrutural | Índice operacional |
| Âncora | IPEA — 16 variáveis | Município — pressão territorial |
| Pergunta | Onde está a vulnerabilidade? | Onde a vulnerabilidade está pressionando a rede? |
| Atualização | Por fase de dados | Contínua |

> *"O IVS-H mostra onde está a vulnerabilidade. O IPST-H mostra onde
> a vulnerabilidade se transforma em pressão sobre o Estado."*

**Como os dois se combinam:**

| Situação | Interpretação | Ação |
| --- | --- | --- |
| IVS-H alto + IPST-H alto | Alta vulnerabilidade e rede pressionada | Prioridade máxima |
| IVS-H alto + IPST-H baixo | Vulnerabilidade alta, rede ainda absorvendo | Monitorar |
| IVS-H baixo + IPST-H alto | Pressão operacional — território invisível | Investigar causa |
| IVS-H baixo + IPST-H baixo | Situação estável | Manutenção |

---

**Slide 10d — Estrutura da Cidade e Funcionamento da Rede de Atendimento**

> Subtítulo: "Uma mesma base de loteamentos — múltiplas formas de
> organização e atendimento"

> Frase central: "Os loteamentos são a base comum. As formas de
> organização e atendimento variam conforme o serviço público."

Painel esquerdo — Organização Administrativa:
- REGIÃO DE PLANEJAMENTO (6 RPs)
- Descendentes: LOT_A, LOT_B, LOT_C
- LOT_B destacado: indica sobreposição de RPs
- "Um mesmo loteamento pode estar associado a mais de uma Região de
  Planejamento, especialmente em áreas de fronteira."

Painel direito — Cobertura da Rede de Assistência Social:
- CRAS 1 e CRAS 2 convergindo para NÚCLEO
- LOT_B aparece em ambos os CRAS
- "A cobertura dos serviços públicos é compartilhada e não exclusiva."

Rodapé: 6 Regiões de Planejamento · 141 Loteamentos · Cobertura
compartilhada entre unidades

Nota: "Essa estrutura torna invisíveis as lacunas quando analisada
só por recortes administrativos."

**Nota arquitetural:** a tabela de cobertura CRAS–Loteamento requer
`data_inicio` e `data_fim` para preservar histórico quando a abrangência
de uma unidade mudar. Um loteamento atendido pelo CRAS Brasil hoje pode
passar ao novo CRAS assim que este for implantado.

---

## Bloco 3 — O Modelo (Slides 11–15)

**Slide 11 — Por que adaptar o índice?**

- Saneamento relativamente desenvolvido → baixo poder discriminatório
  municipal, mas com variação territorial entre loteamentos
- Reprodução intergeracional da pobreza é o desafio central
- Polo de emprego formal convive com alta população em vulnerabilidade
- A construção progressiva preserva a credibilidade científica do IPEA
  e aumenta a relevância para o município

**Slide 12 — O que o IVS-H permite identificar**

- Quais loteamentos concentram mais famílias vulneráveis do CadÚnico
- Onde há maior chance de fila invisível — famílias cadastradas sem
  atendimento ativo
- Onde a rede está presente mas sob pressão crescente
- Quais políticas públicas atuam nesses loteamentos
- Onde há gap entre vulnerabilidade identificada e atendimento efetivo

**Slide 13 — Do indicador ao loteamento**

- A análise parte da cadeia: Pessoa → Família → Loteamento
- Permite compreender como vulnerabilidades individuais se concentram
  em loteamentos, RPs e núcleos
- CadÚnico não é população total — ele revela a demanda identificada.
  A demanda real é maior. Isso reforça a busca ativa como política
  permanente.

**Slide 14 — Programas públicos e vulnerabilidade**

| Dimensão | Exemplos de programas em Hortolândia |
| --- | --- |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Família, BPC, DECOLA |
| Infraestrutura | Agora a Casa é Sua, PHLIS, MCMV |
| Multidimensional | PAIF, PAEFI, CRAS, CREAS |

**Slide 15 — Um novo olhar sobre a gestão pública**

O que o Atlas Social permite que hoje depende de percepção:

- Identificar loteamentos com muita demanda e pouca cobertura
- Separar percepção de evidência — com dado comparável entre núcleos
- Justificar reforço territorial com base técnica
- Priorizar onde concentrar busca ativa
- Medir evolução — não apenas diagnosticar

---

## Bloco 4 — A Proposta Institucional (Slides 16–18)

**Slide 16 — Vocês já fazem o trabalho mais difícil**

A Secretaria de Inclusão atende diariamente as famílias mais
vulneráveis da cidade. Nos CRAS, no CREAS, no CadÚnico, na abordagem
social, no acompanhamento de casos complexos.

Esse trabalho existe. Está acontecendo. Mas acontece, em grande parte,
sem que outras secretarias consigam enxergar o que vocês enxergam.

**O Atlas Social não cria um novo sistema. Ele dá nome e estrutura
ao que já existe: a Secretaria de Inclusão como o núcleo de
inteligência social do município.**

O IVS-H e o IPST-H são as ferramentas que faltavam para que esse
conhecimento acumulado — que hoje mora nos relatórios, nas planilhas
e na memória das equipes — passe a orientar decisões de governo em
todas as secretarias.

*Quando o foco passa a ser o loteamento e a vulnerabilidade, as
secretarias cooperam em torno de famílias e loteamentos prioritários.*

**Slide 17 — O papel da tecnologia**

A tecnologia não é o objetivo. Ela é a infraestrutura que permite:

- Integrar bases de dados
- Organizar informações sociais
- Gerar indicadores por loteamento
- Tornar o diagnóstico auditável e reproduzível

**O Atlas Social começa com SQLite e scripts versionados — não com Big
Data. Começa com dados confiáveis, não com promessa.**

**Slide 18 — O resultado esperado**

Um sistema capaz de apoiar decisões como:

- Priorizar loteamentos para busca ativa com base em evidência
- Identificar famílias vulneráveis sem acompanhamento proporcional
- Justificar reforço de cobertura CRAS e articulação com OSC
- Dar base técnica para decisões da Secretaria junto a outras pastas
- Comprovar redução de vulnerabilidade ao longo do tempo

---

## Bloco 5 — Visão de Futuro e Conclusão (Slides 19–28)

**Slide 19 — Visão de futuro**

Hortolândia pode construir um sistema de Inteligência Social Municipal
capaz de integrar:

- Dados sociais (CadÚnico, SIGAS)
- Políticas públicas (programas mapeados)
- Planejamento municipal (loteamentos, RPs, núcleos)
- Fontes externas (IBGE, CAGED, Saúde, Educação)

**Slide 20 — O que isso representa para a Secretaria de Inclusão**

> *"A Secretaria de Inclusão passa a ter linguagem técnica para
> dialogar com qualquer outra secretaria sobre qualquer loteamento
> da cidade."*

Hoje, quando Inclusão precisa de apoio de Saúde, Educação ou
Desenvolvimento Econômico para atender uma família, esse diálogo
acontece por caso, por relato, por e-mail.

Com o IVS-H e o IPST-H, esse diálogo passa a acontecer por evidência:
*"O loteamento X apresenta índice Y nas variáveis Z — e o CRAS já
atende N famílias. Precisamos de mais."*

*Nota institucional: Em março de 2025, a Prefeitura assumiu
publicamente, em diagnóstico PPA 2026–2029, o compromisso de implantar
'Data Lakehouse Municipal e uso de IA na gestão pública'. O Atlas Social
não esperou o orçamento. Ele entregou o primeiro produto desse
compromisso — com CadÚnico, SQLite e método — antes que qualquer
contrato fosse assinado.*

**Slide 21 — Conclusão**

> *"O IVS municipal não é apenas um indicador. Ele pode se tornar uma
> ferramenta de integração do governo."*

Quando a vulnerabilidade passa a orientar o planejamento:

- As secretarias deixam de competir por agendas
- Passam a cooperar por loteamentos e núcleos
- O governo fala a mesma língua sobre a mesma realidade

---

**Slide 22 — O limite dos sistemas atuais**

*Este é o slide de pausa. Leia em voz alta. Deixe o silêncio trabalhar.*

> *"A maioria dos sistemas de assistência social responde onde está
> a vulnerabilidade.*
>
> *Poucos respondem se o Estado está preparado para agir."*

---

**O Atlas Social responde as duas coisas.**

---

> *"Não basta saber onde está a vulnerabilidade. É preciso saber onde
> ela já está pressionando a capacidade do Estado."*

*Referência: JANNUZZI, P. M. Indicadores Sociais no Brasil. 5. ed.
Campinas: Alínea, 2012. p. 157.*

| Camada | O que responde | Fonte principal |
| --- | --- | --- |
| Camada 1 — IVS-H | Onde está a vulnerabilidade e qual é sua intensidade | CadÚnico + IBGE |
| Camada 2 — Capacidade | O Estado tem estrutura para responder? | Sistemas municipais / CRAS |
| Camada 3 — Lacuna | Onde há vulnerabilidade sem resposta proporcional? | Cruzamento das duas camadas |

---

**Slide 23 — Exemplo: três camadas em ação**

**AVISO METODOLÓGICO: Este slide apresenta estrutura ILUSTRATIVA. Os
valores do Jardim Amanda NÃO foram calculados com microdados do IBGE.
O exemplo demonstra a lógica analítica do modelo, não um resultado
empírico validado.**

*Loteamento de referência: Jardim Amanda (estrutura real, valores
ilustrativos)*

| Camada | Situação identificada | Resultado |
| --- | --- | --- |
| Camada 1 — IVS-H | Alta proporção de baixa renda, chefia feminina, baixa escolaridade | Alta vulnerabilidade (hipotética) |
| Camada 2 — Capacidade | CRAS Amanda com demanda elevada, programas ativos (PAIF, BF) | Cobertura parcial |
| Camada 3 — Lacuna | Famílias elegíveis sem acompanhamento regular | Alta vulnerabilidade + cobertura insuficiente |

**Decisões que passam a ser possíveis:**

- Reforçar busca ativa neste loteamento
- Redirecionar cobertura de outros núcleos com menor pressão
- Priorizar visitas domiciliares
- Justificar expansão de equipe com dado técnico
- Acionar Desenvolvimento Econômico, Saúde ou Educação com evidência

**Slide 24 — Arquitetura do Atlas Social**

Como os dados chegam até a decisão:

| Camada | Conteúdo |
| --- | --- |
| Fontes de dados | CadÚnico / IBGE / CAGED / Sistemas municipais |
| Ingestão e padronização | Limpeza / deduplicação / padronização por loteamento |
| Modelo analítico | Pessoa / Família / Loteamento / Programa / Variável IVS |
| Indicadores | IVS-H / IPST-H / cobertura por loteamento / lacunas operacionais |
| Visualização e decisão | Painéis / relatórios / alertas por núcleo |

**Princípio central: a unidade mínima de análise é a Pessoa.**

Pessoa → Família → Loteamento → CRAS / Núcleo / RP

| Fase | Descrição |
| --- | --- |
| Hoje — MVP | IVS-H parcial (5 variáveis CadÚnico) + IPST-H v0.1 + primeiros indicadores por loteamento |
| Próximo passo | 16 variáveis IVS-H + integração IBGE / CAGED / Saúde / Educação |
| Futuro | Pipeline analítico em camadas + monitoramento contínuo de políticas |

**Slide 25 — O que muda na prática**

| Dimensão | Antes do Atlas Social | Com o Atlas Social |
| --- | --- | --- |
| Base da decisão | Percepção e experiência | Evidência por loteamento mensurável |
| Visão do município | Agregada por secretaria | Por loteamento, núcleo e RP |
| Integração de dados | Cada secretaria no seu sistema | Visão unificada por pessoa e família |
| Identificação de lacunas | Invisível — depende de relato | Calculada e rastreável |
| Prestação de contas | Relatório narrativo | Indicador auditável com fonte documentada |
| Ciclo de melhoria | Eventual | Contínuo — a cada atualização do CadÚnico |

> *"Não é apenas um painel. É uma infraestrutura de dados para governar
> com precisão."*

**Slide 26 — Duas camadas de análise: administrativa x censitária**

*A próxima fronteira técnica do Atlas Social — e Hortolândia já está
posicionada para cruzá-la.*

| Camada | Base | Fonte | Função |
| --- | --- | --- | --- |
| Administrativa | Loteamento / Núcleo / RP | PMH / CRAS | Gestão operacional de políticas |
| Estatística | Setor censitário IBGE | IBGE Censo 2022 | Precisão científica e comparabilidade |

**Evidência já disponível — dados agregados Censo 2022:**

Setores com cobertura de esgoto de 29,21% convivem com média municipal
de 97,59% — bolsão invisível no agregado municipal.

> *"Os microdados do Censo 2022 ainda não foram liberados pelo IBGE.*
>
> *Quando forem, Hortolândia estará pronta.*
>
> *Porque o modelo já está construído."*

**Slide 27 — Uma nova camada de inteligência para Hortolândia**

A TI municipal faz bem o que faz: automatiza processos, desenvolve
sistemas, sustenta a infraestrutura digital. Essa é a camada
operacional.

**O Atlas Social ocupa outra camada — inteligência estratégica:**

- Integra dados de múltiplas secretarias
- Produz diagnóstico por loteamento de forma contínua
- Orienta alocação de recursos e políticas públicas
- Comprova resultados com metodologia auditável

**Essa camada ainda não existe formalmente em Hortolândia.**

O que poderia ser: uma estrutura dedicada a inteligência de dados para
políticas públicas — vinculada ao planejamento estratégico, com
interface com todas as secretarias, ancorada na Secretaria de Inclusão.

---

**Slide 28 — O que está ao alcance**

> *"Hortolândia pode ser uma das primeiras cidades do Brasil a medir,
> de forma contínua, a redução da vulnerabilidade social."*
>
> *"E mais importante: provar isso com dados."*

Não como promessa. Como entrega.

O primeiro produto já existe: 5 variáveis calculáveis hoje, com os
dados que a Secretaria de Inclusão já possui, no CadÚnico de
dezembro de 2025.

**O Atlas Social não começa quando o orçamento chegar.**
**Ele já começou.**

---

## Referências

COSTA, M. A.; MARGUTI, B. O. Atlas da Vulnerabilidade Social nos
Municípios Brasileiros. Brasília: IPEA, 2015.

FUNARI, A. P. et al. Atualização do IVS a partir dos dados da PNAD
Contínua 2022. Boletim Regional, Urbano e Ambiental, IPEA, 2024.

JANNUZZI, P. M. Indicadores Sociais no Brasil: conceitos, fontes de
dados e aplicações. 5. ed. Campinas: Alínea, 2012.

OECD. Handbook on Constructing Composite Indicators. OECD Publishing,
2008.

World Bank. Whole-of-Government Approaches to Public Sector Reform.

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01–v06 | anteriores | Desenvolvimento progressivo do conteúdo |
| v07 | "19/03/2026" | Slide 10b com nota arquitetural de cobertura temporal CRAS |
| v08 | "20/03/2026" | Convênios expandidos com justificativa objetiva. CNIS posicionado via INSS/DATAPREV. Terminologia loteamento/núcleo padronizada. |
| v09 | "21/03/2026" | Público redefinido para corpo técnico da Inclusão. Slide 1A adicionado. Evidências recentes 2026 no Slide 9. Slide 16 reescrito. Slide 20 reescrito para a Secretaria. Slide 22 como slide de impacto. Slide 26 reescrito como fronteira científica. Slide 28 adicionado. |
| v10 | "22/03/2026" | Slide 1 reescrito: pergunta da rede como abertura. Slide 10 reescrito: pesos como leitura local progressiva, sem calibração prematura. Slide 10a criado: três índices, três funções (IVS-IPEA / IVS-H / IPST-H). Slide 10b renumerado (era 10a). Slide 10c criado: dois índices, duas funções para o público da Inclusão, com matriz IVS-H × IPST-H. Slide 10d renumerado (era 10b). Slide 12 expandido: fila invisível e pressão sobre a rede. Slide 13 expandido: nota CadÚnico ≠ população total. Slide 15 reescrito: linguagem da rotina da Inclusão. Slide 18 reescrito: decisões práticas da Secretaria. Slide 22 expandido: frase de fechamento adicional. Slide 23 expandido: decisões práticas da Inclusão. IPST-H integrado ao Slide 24 (arquitetura). |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
*Versão 10 — palestra de março de 2026*
_marco_2026_v10 (1).md…]()
