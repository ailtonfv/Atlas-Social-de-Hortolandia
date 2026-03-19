[conceito_vulnerabilidade_v01.md](https://github.com/user-attachments/files/26125374/conceito_vulnerabilidade_v01.md)
# Conceito de Pessoa Vulnerável — Atlas Social de Hortolândia
**Arquivo:** `conceito_vulnerabilidade_v01.md`
**Localização:** `01_modelagem_conceitual/`
**Versão:** 01 | **Data:** "19/03/2026"
**Responsável:** Ailton Vendramini / Claude (Anthropic)

---

## 1. Definição Central

> **Pessoa vulnerável é aquela exposta a múltiplos fatores de privação
> simultaneamente, nos eixos de capital humano, estrutura familiar,
> condições do domicílio e renda.**

A vulnerabilidade não é uma condição binária — não se está vulnerável
ou não vulnerável. É uma **gradação** determinada pelo número e pela
intensidade dos fatores de privação que afetam simultaneamente uma
pessoa e sua família.

**Princípio fundamental:** nenhum fator isolado classifica uma pessoa
como vulnerável. É o acúmulo de privações em diferentes eixos que
determina o risco social.

---

## 2. Eixos de Privação

O projeto adota quatro eixos de privação para a classificação de
vulnerabilidade. Os três primeiros são derivados da metodologia IVS-IPEA
(2015), preservando comparabilidade nacional. O quarto — Estrutura
Familiar — constitui **decisão metodológica local**, justificada pela
disponibilidade direta desses dados no CadÚnico e pela sua relevância
para a política socioassistencial de Hortolândia.

### 2.1 Capital Humano
Privações que comprometem a capacidade de superação da vulnerabilidade
no longo prazo.

| Fator de risco | Variável IVS-H |
|---|---|
| Responsável sem ensino fundamental completo, com filho menor de 15 anos | CH_05 |
| Analfabetismo — morador não sabe ler ou escrever, 15 anos ou mais | CH_06 |
| Criança em domicílio onde nenhum morador tem fundamental completo | CH_07 |
| Gravidez na adolescência | CH_04 |
| Mortalidade infantil | CH_01 |

### 2.2 Estrutura Familiar
Configurações familiares que amplificam o risco social e a dependência
de serviços públicos. **Dimensão de calibração local** — não prevista
isoladamente no IVS-IPEA.

| Fator de risco | Critério operacional |
|---|---|
| Monoparentalidade | Responsável sem cônjuge com filho(s) e/ou enteado(s) |
| Dependência de idosos | Domicílio com renda principal proveniente de idoso |
| Alta razão de dependência | Mais de 3 dependentes por responsável |
| Família unipessoal em situação de risco | Pessoa sozinha + renda ≤ ½ SM |

### 2.3 Condições do Domicílio
Privações de infraestrutura que agravam a vulnerabilidade e limitam
as condições de vida.

| Fator de risco | Variável IVS-H / IBGE |
|---|---|
| Sem esgotamento sanitário adequado | IU_02 |
| Sem coleta de lixo | IU_01 |
| Sem acesso adequado à água | IU_01 |
| Esgoto a céu aberto no entorno do domicílio | v05215 (IBGE Censo 2022) |
| Coabitação — múltiplas famílias no mesmo domicílio | DIM_DOMICILIO |

### 2.4 Renda
Privações econômicas que determinam a capacidade de acesso a bens e
serviços essenciais.

| Fator de risco | Critério operacional | Variável IVS-H |
|---|---|---|
| Renda per capita domiciliar ≤ ½ SM | renda_total_familia / qtd_pessoas_domic_fam | RT_01 |
| Domicílio dependente de renda de idoso ≤ ½ SM | — | RT_04 |
| Ocupado com renda ≤ ½ SM trabalhando fora do município | deslocamento intermunicipal | RT_06 |
| Pessoa que estuda fora do município | fluxo pendular educacional | RT_07 |

**Exemplo operacional:**
Uma pessoa com renda bruta de R$ 3.200/mês, em domicílio com 4 moradores,
tem renda per capita de R$ 800 — abaixo do limiar de ½ salário mínimo
(R$ 811 em 2026). Essa pessoa **é enquadrada como vulnerável no eixo
renda**, independentemente do valor bruto do seu salário.

---

## 3. Metodologia — Score de Vulnerabilidade

### 3.1 Princípio

Cada pessoa recebe um **score** baseado na presença de fatores de risco
nos quatro eixos. O score não é um julgamento moral — é uma
**classificação operacional** que orienta a priorização de políticas
públicas.

### 3.2 Lógica de composição

```
Score_Pessoa = Σ (fatores de risco presentes × peso do fator)
```

Os pesos dos fatores serão definidos na camada analítica, após
validação dos dados do CadÚnico, e registrados em documento próprio
(`pesos_ivf_v01.md`). Para o MVP, cada fator presente contribui com
peso igual.

### 3.3 Classificação por faixa de score

| Faixa | Classificação | Implicação operacional |
|---|---|---|
| 0 — 1 fator | Baixa vulnerabilidade | Monitoramento preventivo |
| 2 — 3 fatores | Média vulnerabilidade | Acompanhamento ativo — PAIF |
| 4 — 5 fatores | Alta vulnerabilidade | Prioridade — PAIF intensivo / PAEFI |
| 6+ fatores | Vulnerabilidade crítica | Ação imediata — intersetorialidade obrigatória |

### 3.4 Relação com o IVS-H

O score individual (nível pessoa/família) e o IVS-H (nível loteamento)
são instrumentos complementares — não substituíveis:

| Instrumento | Nível | Fonte principal | Frequência |
|---|---|---|---|
| Score de vulnerabilidade | Pessoa / Família | CadÚnico | Contínua |
| IVS-H | Loteamento / RP | CadÚnico + IBGE | Semestral |

O IVS-H agrega os scores do território. O score individual permite
identificar **quem** dentro de um loteamento crítico é prioritário.

---

## 4. Aplicações

### 4.1 Identificação de público prioritário
Famílias com score elevado são candidatas prioritárias a:
- Inclusão no PAIF (proteção básica)
- Encaminhamento ao PAEFI (proteção especial)
- Acesso a programas de transferência de renda
- Busca ativa — especialmente em loteamentos com gap de cobertura

### 4.2 Cruzamento com serviços
O score permite responder:
- Quais famílias vulneráveis **não** estão sendo atendidas?
- Há concentração de famílias críticas em loteamentos sem cobertura adequada?
- Quais programas estão alcançando os fatores de risco corretos?

### 4.3 Monitoramento de saída da vulnerabilidade
**Esta é a aplicação mais inovadora do projeto** — não existente nos
índices nacionais como o IVS-IPEA, que medem vulnerabilidade de forma
estática.

O Atlas Social se propõe a medir **mobilidade social**:

```
Pessoa vulnerável → recebe serviço / programa → reavaliação do score
→ score reduz → saída monitorada da vulnerabilidade
```

Isso permite responder:
- Quantas pessoas saíram da vulnerabilidade no último semestre?
- Quais programas estão associados à redução do score?
- A saída é sustentável ou há reincidência?

> **Nota metodológica:** A medição de saída da vulnerabilidade depende
> da atualização periódica do CadÚnico e da integração com CAGED
> (vínculo formal). É um produto do MVP expandido — não do MVP inicial.

---

## 5. Relação com Outros Documentos do Projeto

| Documento | Relação |
|---|---|
| `glossario_conceitual_v01.md` | Definições de Pessoa, Família, Domicílio |
| `dim_variavel_IVS_v01r5.md` | Especificação técnica das variáveis CH, RT, IU |
| `ivs_vs_ivsh_comparativo_v05.md` | Comparação IVS-IPEA × IVS-H |
| `ind_densidade_vulnerabilidade_v02.md` | Indicador territorial que agrega este conceito |
| `03_indicadores_mvp/README.md` | Posição deste conceito na cadeia analítica |

---

## 6. Limites e Advertências

**O que este conceito NÃO é:**
- Não é um ranking de pobreza
- Não é um julgamento sobre a capacidade das pessoas
- Não substitui a avaliação técnica do assistente social
- Não é definitivo — os pesos e limiares serão calibrados com base em
  evidências empíricas do CadÚnico de Hortolândia

**Limitação atual de dados:**
As variáveis de condições do domicílio (eixo 2.3) dependem parcialmente
dos microdados do Censo 2022, ainda não liberados pelo IBGE. Para o
MVP, este eixo será calculado com os dados agregados por setor
censitário disponíveis e com os campos de estrutura habitacional do
CadÚnico.

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | "19/03/2026" | Criação — conceito, quatro eixos, metodologia de score, três aplicações |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
*Versão 01 — base conceitual para os indicadores do MVP*
