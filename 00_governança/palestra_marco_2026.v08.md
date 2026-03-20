[palestra_marco_2026_v08.md](https://github.com/user-attachments/files/26139658/palestra_marco_2026_v08.md)
# ATLAS SOCIAL DE HORTOLÂNDIA

Vulnerabilidade Social e Integração de Políticas Públicas

*Palestra — Março de 2026*

Versão v08

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

*Este slide abre a palestra antes de qualquer argumento técnico. Seu
papel é calibrar expectativas, apresentar vocabulário e situar o público
no projeto.*

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
> pessoas. O IVS-H é a versão calibrada para Hortolândia.
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
> Solicita-se ao prefeito que designe formalmente um ponto focal na
> Secretaria de Inclusão para interface com o projeto, com autonomia
> para validar dados e participar das decisões metodológicas.

---

### Convênios institucionais para acesso a dados

O Atlas Social depende de fontes de dados que não estão disponíveis
publicamente no nível de detalhe necessário para análise por loteamento.
O acesso a essas fontes exige convênios formais. Abaixo, cada convênio
com sua justificativa objetiva.

**Solicita-se que a assessoria jurídica inicie os procedimentos formais.**

#### Convênios Federais

| Órgão | Dado acessado | Por que precisamos | O que perdemos sem ele |
| --- | --- | --- | --- |
| MTE / CAGED | Admissões e demissões de emprego formal, com salário declarado por CPF | Verificar consistência entre renda autodeclarada no CadÚnico e vínculo formal de emprego. Identificar famílias cadastradas como vulneráveis que possuem renda formal não declarada | Sem este convênio, não conseguimos detectar inconsistências cadastrais nem medir o segmento que transita entre vulnerabilidade e emprego formal |
| INSS / DATAPREV | BPC, histórico contributivo, vínculos formais históricos (CNIS) | O CNIS — Cadastro Nacional de Informações Sociais — é acessado via DATAPREV e registra todo o histórico de vínculos, contribuições e benefícios previdenciários de cada CPF. Permite identificar dependência de BPC e aposentadoria como componente de renda familiar | Sem este convênio, não conseguimos separar renda de trabalho de renda de benefício previdenciário — distinção essencial para classificar famílias no eixo Renda e Trabalho do IVS-H |
| IBGE | Microdados do Censo 2022 por setor censitário | As 16 variáveis do IVS-H requerem dados populacionais no nível de setor censitário. Os dados agregados já disponíveis permitem análise parcial, mas os microdados permitem cruzamentos por domicílio que identificam bolsões internos de vulnerabilidade dentro de um mesmo loteamento | Sem este convênio, o IVS-H permanece calculado apenas em nível de loteamento. A camada estatística por setor censitário — que revela desigualdade interna — fica bloqueada |
| INEP / MEC | Matrículas, evasão e desempenho escolar por estabelecimento | A dimensão Capital Humano do IVS-H inclui variáveis de escolaridade e acesso à educação. O INEP permite cruzar endereço do aluno com loteamento, identificando evasão escolar por núcleo | Sem este convênio, a variável CH_05 (chefe sem fundamental com filho menor) fica limitada ao CadÚnico. Evasão e fluxo escolar por loteamento ficam indisponíveis |
| MS / RNDS | Dados de saúde: gravidez na adolescência, mortalidade infantil, cobertura vacinal | A Rede Nacional de Dados em Saúde permite cruzar indicadores de saúde com o recorte por loteamento. As variáveis CH_01 a CH_04 do IVS-H dependem de dados de saúde que o município não produz diretamente | Sem este convênio, as variáveis de saúde na dimensão Capital Humano ficam calculadas apenas por dados municipais, com cobertura incompleta |

#### Convênios Estaduais — São Paulo

| Órgão | Dado acessado | Por que precisamos | O que perdemos sem ele |
| --- | --- | --- | --- |
| SEADE | Dados demográficos estaduais, projeções populacionais, mortalidade por município | O SEADE produz estimativas populacionais intercensitárias e dados de mortalidade mais atualizados que o Censo. Essencial para denominadores populacionais entre ciclos do IBGE | Sem este convênio, os denominadores populacionais do IVS-H ficam desatualizados entre censos. Taxas calculadas sobre base demográfica errada |
| SEDS-SP | Cadastro de programas e benefícios da assistência social estadual | Permite identificar quais famílias de Hortolândia recebem programas estaduais — que não aparecem no CadÚnico municipal. Evita dupla contagem e permite visão completa da cobertura por família | Sem este convênio, programas estaduais ficam invisíveis no mapa de cobertura. Famílias podem aparecer como descobertas quando já estão atendidas pelo Estado |
| Secretaria de Educação SP | Dados das escolas estaduais: matrículas, evasão, fluxo escolar | Hortolândia possui escolas estaduais além das municipais. Sem os dados estaduais, a análise educacional por loteamento captura apenas alunos da rede municipal | Sem este convênio, evasão e escolaridade por loteamento ficam subestimadas para os loteamentos com maior concentração de escolas estaduais |
| SES-SP | Dados do sistema de saúde estadual: internações, procedimentos, cobertura | A rede de saúde de Hortolândia inclui equipamentos estaduais. Os dados de saúde por CPF permitem cruzar com loteamento e identificar gaps de cobertura | Sem este convênio, indicadores de saúde por loteamento capturam apenas atendimentos municipais, com visão parcial da realidade |

> **Nota sobre o CNIS:** O Cadastro Nacional de Informações Sociais
> (CNIS) não é um convênio separado — é um dado acessado via o convênio
> com INSS/DATAPREV. Ele registra, por CPF, todos os vínculos formais
> históricos, contribuições previdenciárias e benefícios recebidos. É a
> principal fonte para triangular a renda autodeclarada no CadÚnico com
> registros formais de emprego e benefício.

---

## Bloco 1 — O Problema (Slides 1–5)

**Slide 1 — A pergunta central**

> *"Como uma cidade de 236 mil habitantes identifica, com precisão,
> onde está a vulnerabilidade social?"*

A resposta exige: dados, integração institucional e visão por loteamento.

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

**49.100 empregos formais (remuneração média R$ 4.700) convivem com
72.424 pessoas no CadÚnico (dez/2025). Essa tensão é o desafio central
do município.**

**Slide 10 — A proposta: IVS-H**

> *"IVS-H — Índice de Vulnerabilidade Social de Hortolândia"*

Mesmas variáveis. Mesmas dimensões. Pesos calibrados à realidade local.

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) |
| --- | --- | --- |
| Infraestrutura Urbana | 33% | ~15–20% |
| Capital Humano | 33% | ~40–45% |
| Renda e Trabalho | 33% | ~35–40% |

**Slide 10a — IVS-IPEA x IVS-H: o que muda e por que**

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
| Peso por dimensão | 33% cada | Calibrado à realidade local |
| Recorte de análise | Nacional / municipal | Loteamento → RP → Núcleo |
| Fonte de dados | Censo IBGE (decenal) | CadÚnico + Censo + CAGED |
| Atualização | Decenal | Contínua (CadÚnico) |

**5 variáveis já disponíveis no CadÚnico dez/2025:**

| Código | Variável | Dimensão |
| --- | --- | --- |
| CH_05 | % mães chefes de família, sem fund. completo, filho menor de 15 anos | Capital Humano |
| CH_06 | Taxa de analfabetismo — 15 anos ou mais | Capital Humano |
| CH_07 | % crianças em domicílios sem nenhum morador com fund. completo | Capital Humano |
| RT_01 | % pessoas com renda per capita menor ou igual a 1/2 SM | Renda e Trabalho |
| RT_04 | % domicílios com renda menor ou igual a 1/2 SM dependentes de idosos | Renda e Trabalho |

**Slide 10b — Estrutura da Cidade e Funcionamento da Rede de Atendimento**

> Subtítulo: "Uma mesma base de loteamentos — múltiplas formas de organização e atendimento"

> Frase central: "Os loteamentos são a base comum. As formas de organização e atendimento variam conforme o serviço público."

**Estrutura visual do slide (dois painéis):**

Painel esquerdo — Organização Administrativa:

- Caixa superior: REGIÃO DE PLANEJAMENTO (6 RPs · ex: RP_Centro)
- Descendentes: LOT_A, LOT_B, LOT_C (loteamentos exemplares)
- LOT_B destacado com borda tracejada âmbar: indica sobreposição de RPs
- Caixa de atenção: "Um mesmo loteamento pode estar associado a mais de uma Região de Planejamento, especialmente em áreas de fronteira."

Painel direito — Cobertura da Rede de Assistência Social:

- CRAS 1 e CRAS 2 convergindo para caixa NÚCLEO
- Núcleo: "Agrupamento de loteamentos definido pela lógica de cobertura da unidade de atendimento"
- Tabela CRAS x Loteamento: CRAS 1 → LOT_A; CRAS 1 → LOT_B; CRAS 2 → LOT_B; CRAS 2 → LOT_C
- LOT_B aparece em ambos os CRAS: destaque em âmbar
- Frase de impacto: "A cobertura dos serviços públicos é compartilhada e não exclusiva."

Rodapé: 6 Regiões de Planejamento · 141 Loteamentos · Cobertura compartilhada entre unidades

Nota de tensão (rodapé discreto, itálico): "Essa estrutura torna invisíveis as lacunas quando analisada só por recortes administrativos."

**Notas de apresentação:**

"A cidade possui uma base única de loteamentos. A partir dessa base,
existem diferentes formas de organização. Do lado esquerdo, mostramos a
organização administrativa. Do lado direito, mostramos como o
atendimento realmente acontece. E aqui está o ponto central: um mesmo
loteamento pode estar em mais de uma região e ser atendido por mais de
uma unidade — CRAS, Escola, UPA, UBS. Por isso, não modelamos a cidade
como uma hierarquia rígida, mas como uma rede de relações."

**Nota arquitetural (banco de dados):** A tabela de cobertura
CRAS–Loteamento requer os campos `data_inicio` e `data_fim` para
preservar histórico quando a abrangência de uma unidade mudar — por
exemplo, na abertura de um novo CRAS para atender demanda reprimida. A
cobertura do CRAS é definida por limite operacional de atendimento, não
por fronteira geográfica fixa. Um loteamento atendido pelo CRAS Brasil
hoje pode passar ao novo CRAS assim que este for implantado. Esse
histórico precisa ser preservado.

---

## Bloco 3 — O Modelo (Slides 11–15)

**Slide 11 — Por que adaptar o índice?**

- Saneamento relativamente desenvolvido → baixo poder discriminatório
- Reprodução intergeracional da pobreza é o desafio central
- Polo de emprego formal convive com alta população em vulnerabilidade
- A calibração local preserva a credibilidade científica do IPEA e
  aumenta a relevância política para o município.

**Slide 12 — O que o IVS-H permite identificar**

- Onde estão as famílias mais vulneráveis?
- Quais loteamentos apresentam maior risco social?
- Quais políticas públicas atuam nesses loteamentos?
- Onde há gap entre vulnerabilidade e atendimento?

**Slide 13 — Do indicador ao loteamento**

- A análise parte da cadeia: Pessoa → Família → Loteamento
- Permite compreender como vulnerabilidades individuais se concentram
  em loteamentos, RPs e núcleos.

**Slide 14 — Programas públicos e vulnerabilidade**

| Dimensão | Exemplos de programas em Hortolândia |
| --- | --- |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Família, BPC, DECOLA |
| Infraestrutura | Agora a Casa é Sua, PHLIS, MCMV |
| Multidimensional | PAIF, PAEFI, CRAS, CREAS |

**Slide 15 — Um novo olhar sobre a gestão pública**

- Identificar sobreposições
- Detectar lacunas
- Priorizar loteamentos
- Medir impacto

---

## Bloco 4 — A Proposta Institucional (Slides 16–18)

**Slide 16 — Rompendo a lógica dos feudos administrativos**

Modelo tradicional: cada secretaria com seus programas e seus dados.

Modelo orientado por vulnerabilidade: IVS-H como eixo comum de
coordenação intersecretarial.

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

- Onde concentrar políticas sociais
- Quais loteamentos precisam de maior atenção
- Quais programas estão gerando impacto
- Como comprovar redução de vulnerabilidade ao longo do tempo

---

## Bloco 5 — Visão de Futuro e Conclusão (Slides 19–27)

**Slide 19 — Visão de futuro**

Hortolândia pode construir um sistema de Inteligência Social Municipal
capaz de integrar:

- Dados sociais (CadÚnico, SIGAS)
- Políticas públicas (programas mapeados)
- Planejamento municipal (loteamentos, RPs, núcleos)
- Fontes externas (IBGE, CAGED, Saúde, Educação)

**Slide 20 — O argumento para o prefeito**

> *"Construir um índice que mostra que Hortolândia reduziu
> vulnerabilidade de forma mensurável, com metodologia reconhecida pelo
> IPEA."*

**Isso é legado. Um legado que pertence à cidade — não a uma
secretaria.**

*Nota institucional: Em março de 2025, a Prefeitura assumiu
publicamente, em diagnóstico PPA 2026–2029 destinado a investidores, o
compromisso de implantar 'Data Lakehouse Municipal e uso de IA na
gestão pública'. O Atlas Social não esperou o orçamento. Ele entregou o
primeiro produto desse compromisso — com CadÚnico, SQLite e método —
antes que qualquer contrato fosse assinado.*

**Slide 21 — Conclusão**

> *"O IVS municipal não é apenas um indicador. Ele pode se tornar uma
> ferramenta de integração do governo."*

Quando a vulnerabilidade passa a orientar o planejamento:

- As secretarias deixam de competir por agendas
- Passam a cooperar por loteamentos e núcleos
- O governo fala a mesma língua sobre a mesma realidade

**Slide 22 — Do diagnóstico à capacidade de ação do Estado**

*Referência: JANNUZZI, P. M. Indicadores Sociais no Brasil. 5. ed.
Campinas: Alínea, 2012. p. 157.*

O problema clássico da gestão pública:

> *"A maioria dos sistemas responde onde está a vulnerabilidade. Poucos
> conseguem responder se o Estado está preparado para agir."*

| Camada | O que responde | Fonte principal |
| --- | --- | --- |
| Camada 1 — IVS-H | Onde está a vulnerabilidade e qual é sua intensidade | CadÚnico + IBGE |
| Camada 2 — Capacidade | O Estado tem estrutura para responder? | Sistemas municipais / CRAS |
| Camada 3 — Lacuna | Onde há vulnerabilidade sem resposta proporcional? | Cruzamento das duas camadas |

> *"Não basta saber onde está a vulnerabilidade. É preciso saber se o
> Estado está presente — e se tem capacidade de agir."*

**Slide 23 — Exemplo: três camadas em ação**

**AVISO METODOLÓGICO: Este slide apresenta estrutura ILUSTRATIVA. Os
valores de vulnerabilidade do Jardim Amanda NÃO foram calculados com
microdados do IBGE — esses dados ainda não estão disponíveis
publicamente para o Censo 2022. O exemplo demonstra a lógica analítica
do modelo, não um resultado empírico validado.**

*Loteamento de referência: Jardim Amanda (estrutura real, valores ilustrativos)*

| Camada | Situação identificada | Resultado |
| --- | --- | --- |
| Camada 1 — IVS-H | Alta proporção de baixa renda, chefia feminina, baixa escolaridade | Alta vulnerabilidade (hipotética) |
| Camada 2 — Capacidade | CRAS Amanda com demanda elevada, programas ativos (PAIF, BF) | Cobertura parcial |
| Camada 3 — Lacuna | Famílias elegíveis sem acompanhamento regular, possível fila invisível | Alta vulnerabilidade + cobertura insuficiente |

**Decisão que passa a ser possível:**

*"Precisamos reforçar a atuação neste loteamento?" → realocar equipe,
priorizar visitas, redirecionar programas, acionar Desenvolvimento
Econômico.*

**Slide 24 — Arquitetura do Atlas Social**

Como os dados chegam até a decisão:

| Camada | Conteúdo |
| --- | --- |
| Fontes de dados | CadÚnico / IBGE / CAGED / Sistemas municipais |
| Ingestão e padronização | Limpeza / deduplicação / padronização por loteamento |
| Modelo analítico | Dimensões: Pessoa / Família / Loteamento / Programa / Variável IVS |
| Indicadores | IVS-H / cobertura por loteamento / lacunas operacionais |
| Visualização e decisão | Painéis / relatórios / alertas por núcleo |

**Princípio central: a unidade mínima de análise é a Pessoa.**

Pessoa → Família → Loteamento → CRAS / Núcleo / RP

| Fase | Descrição |
| --- | --- |
| Hoje — MVP | IVS-H parcial (5 variáveis CadÚnico) + primeiros indicadores por loteamento |
| Próximo passo | 16 variáveis + integração IBGE / CAGED / Saúde / Educação |
| Futuro | Pipeline analítico estruturado em camadas + monitoramento contínuo de políticas |

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

*A próxima fronteira técnica do Atlas Social.*

| Camada | Base | Fonte | Função |
| --- | --- | --- | --- |
| Administrativa | Loteamento / Núcleo / RP | PMH / CRAS | Gestão operacional de políticas |
| Estatística | Setor censitário IBGE | IBGE Censo 2022 | Precisão científica e comparabilidade |

**O que a camada censitária permite:**

- Identificar bolsões de vulnerabilidade dentro de um mesmo loteamento
- Provar que dentro de um núcleo há desigualdade interna
- Validar ou corrigir percepções locais com base científica

**Evidência já disponível — dados agregados Censo 2022:**

**Setores com cobertura de esgoto adequado de 29,21% convivem com média
municipal de 97,59% — bolsão invisível no agregado municipal.**

**LIMITAÇÃO ATUAL: Os microdados do Censo 2022 ainda não foram liberados
pelo IBGE, sem previsão de data. O cálculo do IVS no nível individual
por setor censitário aguarda essa liberação — e o convênio IBGE formaliza
o acesso quando os dados forem disponibilizados.**

> *"O Atlas Social operará com duas camadas complementares: a camada
> administrativa, baseada em loteamentos e núcleos, e a camada
> estatística, baseada em setores censitários do IBGE."*

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
interface com todas as secretarias.

> *"Não precisamos esperar a infraestrutura ideal. Já provamos que é
> possível começar — com método, sem promessa, e com resultados que
> podem ser verificados por qualquer pessoa."*

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
| v08 | "20/03/2026" | Slide 0: convênios expandidos com justificativa objetiva por item. CNIS posicionado como dado acessado via INSS/DATAPREV, não como convênio separado. Substituição de "territorio" por "loteamento" e "nucleo" no corpo do texto. Nota arquitetural de cobertura temporal CRAS expandida na Slide 10b. |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
*Versão 08 — palestra de março de 2026*
