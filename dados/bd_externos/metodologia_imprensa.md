# Metodologia — Fonte Externa: Imprensa

**Tipo de documento:** metodologia específica por fonte  
**Escopo:** coleta e classificação de evidências jornalísticas  
**Integração com:** metodologia_ivsh.md

## Objetivo

Registrar, classificar e consolidar evidências publicadas na imprensa local que possam sinalizar vulnerabilidade social, pressão sobre políticas públicas e temas recorrentes relacionados ao Atlas Social de Hortolândia.

---

## Finalidade

A coleta de imprensa não substitui bases administrativas ou indicadores oficiais.

Sua função é complementar a leitura do município, permitindo:

- identificar sinais públicos de vulnerabilidade
- acompanhar temas recorrentes no cotidiano da cidade
- comparar evidência empírica com dados estruturados
- apoiar a construção futura do IPST-H

---

## Fonte inicial

- Jornal Tribuna Liberal

---

## Unidade de registro

Cada linha do arquivo CSV representa **um evento, fato, programa, problema ou evidência** identificado em matéria jornalística.

---

## Estrutura do arquivo

Cada CSV diário utiliza as seguintes colunas:

- `fonte`
- `data`
- `item`
- `pagina`
- `dimensao_ivs`
- `codigo_variavel`
- `resumo`
- `localidade`
- `tipo_evento`
- `gravidade`
- `observacao`

---

## Regras de classificação

### Dimensão IVS
Utilizar apenas:
- `capital_humano`
- `renda_trabalho`
- `infraestrutura_urbana`

### Tipo de evento
Utilizar preferencialmente:
- `politica_publica`
- `problema`
- `caso_individual`
- `infraestrutura`
- `acao_institucional`

### Gravidade
Utilizar:
- `baixa`
- `media`
- `alta`

---

## Critério de inclusão

Devem ser registrados:

- fatos com relevância social clara
- políticas públicas relacionadas às dimensões do IVS
- casos concretos que sinalizem vulnerabilidade
- ocorrências recorrentes em bairros, loteamentos ou núcleos
- eventos que indiquem pressão sobre a rede pública

---

## Critério de exclusão

Não devem ser registrados:

- matérias sem relação com vulnerabilidade social
- opinião genérica sem vínculo com fato social concreto
- conteúdo promocional sem relevância analítica
- ocorrências sem conexão plausível com o modelo

---

## Limites metodológicos

A coleta de imprensa é uma camada exploratória de evidência empírica.

Ela:

- não constitui diagnóstico oficial
- não substitui CadÚnico, Censo ou sistemas municipais
- não mede incidência real
- pode refletir viés editorial e seletividade jornalística

---

## Uso analítico

Os registros de imprensa podem ser usados para:

- contagem por dimensão IVS
- identificação de variáveis recorrentes
- análise temporal
- apoio narrativo em apresentações
- sinalização preliminar de pressão social

---

## Situação atual

Metodologia em desenvolvimento, com coleta estruturada iniciada em março de 2026.