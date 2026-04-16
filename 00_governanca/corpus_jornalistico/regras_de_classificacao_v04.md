# Regras de Classificacao -- Corpus Jornalistico
**Versao:** v04  
**Data:** "16/04/2026"  
**Responsavel:** Ailton Vendramini  
**Repositorio:** Atlas-Social-de-Hortolandia / 00_governanca/corpus_jornalistico/

---

## 0. Framework Analitico de 3 Camadas

O corpus registra eventos em tres camadas analiticas distintas. Manter essa separacao e essencial para preservar o poder discriminativo do modelo.

| Camada | Tipo | Codigos | Funcao |
|---|---|---|---|
| **Camada 1 — IVS** | Vulnerabilidade | `infraestrutura_urbana`, `capital_humano`, `renda_trabalho`, `multidimensional` | Mede ou sinaliza vulnerabilidade da populacao |
| **Camada 2 — Governanca** | Resposta do Estado | `GOV_MUNICIPAL`, `GOV_ESTADUAL`, `GOV_FEDERAL` | Explica capacidade de resposta institucional |
| **Camada 3 — Contexto** | Sinais fracos | `SMIDS_EXT` | Antecipa tendencias; pressao social; narrativas difusas |

> **Principio operacional:**  
> *"IVS mede. Governanca e SMIDS_EXT explicam."*

> **Regra R00 (fundamental):**  
> `dimensao_ivs` so pode assumir valores da Camada 1 (IVS).  
> Eventos de governanca ou contexto nao devem preencher `dimensao_ivs`.

---

## 1. nivel_criticidade

| Valor | Criterio |
|---|---|
| `alta` | Impacto direto na populacao vulneravel |
| `media` | Impacto indireto |
| `baixa` | Acao institucional / preventiva |
| `alerta` | Evento critico -- violencia, risco grave, morte |

---

## 2. tipo_relacao_variavel

| Valor | Criterio |
|---|---|
| `direta` | O evento mede a variavel IVS (explicita ou estatisticamente defensavel) |
| `indireta` | Contribuicao secundaria (obra, programa, investimento) |
| `contextual` | Sem metrica IVS defensavel |
| `latente` | Politica recente com potencial mensuravel ainda nao observado |

### Regras:

- **R01:** `direta` exige mensuracao explicita OU inferencia estatistica robusta  
- **R02:** Obras, programas e investimentos → normalmente `indireta`  
- **R03:** Politicas publicas → `indireta` ou `latente`  
- **R04:** Sem metrica IVS → `contextual` + `codigo_variavel = vazio`  
- **R10:** `latente` so pode ser usado quando ha vinculo claro com variavel IVS e expectativa plausivel de mensuracao futura  

---

## 3. codigo_variavel

| Situacao | Preenchimento |
|---|---|
| Evento com metrica IVS | Codigo da variavel (`IU_01`, `CH_05`, etc.) |
| Sem metrica IVS | Vazio |
| Politica latente | Codigo + `latente` + nota obrigatoria |
| Variavel aproximada | Codigo + nota: "variavel proxima -- ..." |
| Governanca municipal | `GOV_MUNICIPAL` |
| Governanca estadual | `GOV_ESTADUAL` |
| Governanca federal | `GOV_FEDERAL` |
| Contexto / sinal fraco | `SMIDS_EXT` |

---

## 4. Regra para "multidimensional"

Nao e codigo de incerteza. Representa atuacao simultanea comprovada em mais de uma dimensao do IVS.

### Uso correto:
- PAIF
- Situacao de rua
- Programas com atuacao institucional transversal

### Uso incorreto:
- Duvida classificatoria
- Repercussao difusa sem evidencia clara

> **R05:** uso de `multidimensional` exige justificativa obrigatoria na coluna `observacao`  
> **R05b:** se a justificativa nao for clara em uma linha, nao usar  

---

## 5. Rebaixamento de Eventos (Regra de Conservacao do Dado)

| Tipo | Tratamento |
|---|---|
| Politico-institucional sem impacto IVS | `SMIDS_EXT | contextual | baixa` |
| Beneficios corporativos internos | `SMIDS_EXT | contextual | baixa` |
| Eventos sem nexo IVS direto | `SMIDS_EXT | contextual | baixa` |

> **R06:** nao excluir eventos — rebaixar  
> Excecao: remover apenas se comprometer a integridade metodologica  

---

## 6. SMIDS_EXT — Regra de Uso

> **R09:** `SMIDS_EXT` nao e categoria residual.

Usar somente quando:

- nao ha variavel IVS defensavel  
- ha potencial interpretativo futuro  
- o evento contribui para leitura de contexto social  

Nao usar para:

- ruido irrelevante  
- eventos administrativos triviais  
- ausencia de classificacao  

---

## 7. Casos Especiais

| Situacao | Tratamento |
|---|---|
| Politica publica recente | `latente` + codigo + nota |
| Presenca estatal positiva | Registrar normalmente (contraponto analitico) |
| Evento regional | `localidade = Regional`; sem loteamento |
| Evento fora de Hortolandia com impacto local | origem externa + municipio_impactado = Hortolandia |

> **R07:** Politica latente exige nota obrigatoria  
> **R08:** Sinais positivos do Estado sao parte do modelo  

---

## 8. Distincao Conceitual

| Instrumento | Logica | Funcao |
|---|---|---|
| rel_programa_variavel_ivs | Potencial teorico | O que pode medir |
| Corpus jornalistico | Evidencia empirica | O que efetivamente mede |

---

## 9. Nota Arquitetural — Governanca (Fase 2)

Possivel futura tabela:

`REL_INSTANCIA_GOVERNANCA_DIMENSAO`

Exemplos:
- CMAS
- CMDCA
- Conselhos Tutelares

**Status:** pendente

---

## 10. Nota Arquitetural — Politicas Publicas (Fase 2)

Futura tabela:

`DIM_POLITICA_PUBLICA`

Campos:
- tipo
- nome
- eixo
- status
- datas

**Status:** pendente

---

## Log de Alteracoes

| Versao | Data | Alteracoes |
|---|---|---|
| v01 | "14/04/2026" | Criacao inicial |
| v02 | "15/04/2026" | Framework 3 camadas |
| v03 | "15/04/2026" | Refinamentos metodologicos |
| v04 | "16/04/2026" | Separacao estrutural IVS vs Governanca; R00 adicionada; R09 e R10 formalizadas; refinamento de multidimensional |

---

*Arquivo de governanca -- Atlas Social de Hortolandia*  
*00_governanca/corpus_jornalistico/*
