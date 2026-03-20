[readme_evento_social_v01.md](https://github.com/user-attachments/files/26141371/readme_evento_social_v01.md)
# README — Módulo de Eventos Sociais
**Arquivo:** `README_evento_social_v01.md`
**Localização:** `01_modelagem_conceitual/`
**Versão:** 01 | **Data:** "20/03/2026"
**Responsável:** Ailton Vendramini / Claude (Anthropic)

---

## O que é este módulo

O módulo de Eventos Sociais registra ocorrências observáveis no
município que não são capturadas pelo IVS-H nem pelo CadÚnico, mas
que enriquecem a leitura analítica por loteamento.

Enquanto o IVS-H mede **privação estrutural acumulada**, os eventos
sociais medem **pressão emergente e dinâmica**. Os dois instrumentos
são complementares — não concorrentes.

---

## Por que este módulo existe

O IVS-H é calculado a partir de variáveis estruturais — escolaridade,
renda, saneamento. Ele responde bem à pergunta "onde a vulnerabilidade
se acumulou historicamente". Mas não responde a:

- Por que um loteamento de IVS-H médio apresenta alta criminalidade?
- Por que uma escola premiada fica num loteamento de alta vulnerabilidade?
- Quais loteamentos estão recebendo programas federais de transferência?
- Onde o Estado está presente — e onde está ausente?

O módulo de Eventos Sociais responde a essas perguntas registrando
ocorrências concretas, datadas, georreferenciadas e classificadas.

---

## Arquivos do módulo

| Arquivo | Tipo | Conteúdo |
| --- | --- | --- |
| `dim_tipo_evento_v01.md` | Dimensão | Catálogo controlado de tipos de eventos |
| `fato_evento_social_v01.md` | Fato | Registro de ocorrências reais por loteamento e data |

---

## Lógica do módulo

```
DIM_TIPO_EVENTO
  categoria
  subcategoria
  nome_tipo
  polaridade          (Positiva | Negativa | Neutra)
  dimensao_ivsh       (IU | CH | RT | Transversal | Nenhuma)
  escala_registro     (Loteamento | Núcleo | RP | Município)
  gravidade_padrao
        ↓
        FK id_tipo_evento
        ↓
FATO_EVENTO_SOCIAL
  data_evento
  data_referencia
  id_loteamento / id_nucleo / id_rp / id_municipio
  valor_referencia + unidade_medida
  gravidade           (real — pode diferir do padrão)
  confianca_fonte
  fonte_registro
  referencia_fonte
```

---

## Combinações analíticas centrais

### Combinação 1 — IVS-H x Pressão Social

```
FATO_IVS_LOTEAMENTO  x  FATO_EVENTO_SOCIAL
      ↓                        ↓
   ivs_h                 polaridade = Negativa
   por loteamento        por loteamento
```

Resultado: matriz 2x2 que classifica cada loteamento em:

| | IVS-H alto | IVS-H baixo |
| --- | --- | --- |
| **Pressão alta** | Emergência — prioridade máxima | Alerta — mudança não capturada pelo índice |
| **Pressão baixa** | Vulnerabilidade silenciosa — invisível sem o índice | Estável |

### Combinação 2 — Cobertura positiva x Vulnerabilidade

Eventos de polaridade Positiva em loteamentos de IVS-H alto =
evidência de política pública funcionando onde o contexto é adverso.
Argumento direto para o painel executivo e para a prestação de contas.

### Combinação 3 — Série temporal por loteamento

```
SELECT id_loteamento, data_referencia, COUNT(*) as ocorrencias
FROM FATO_EVENTO_SOCIAL
WHERE id_tipo_evento LIKE 'EVT_SEG%'
AND polaridade = 'Negativa'
GROUP BY id_loteamento, data_referencia
ORDER BY ocorrencias DESC
```

Permite identificar tendência de agravamento ou melhora ao longo do tempo.

---

## Fontes de dados esperadas

| fonte | confianca | exemplos |
| --- | --- | --- |
| Boletim Oficial / BO | Alta | Furtos, apreensões, ocorrências PM |
| Secretaria Municipal | Alta | Premiações, programas, atendimentos |
| Sistema Municipal | Alta | SIGAS, sistemas de saúde, educação |
| Imprensa local | Média | Tribuna Liberal, outros veículos regionais |
| Observação de campo | Baixa | Relatos de equipe CRAS, visitas |

---

## Origem dos primeiros registros

Os 4 registros iniciais da `FATO_EVENTO_SOCIAL` foram derivados da
edição da Tribuna Liberal de 20/03/2026, demonstrando que o jornal
local é fonte legítima de dado com confiança média — desde que
a referência seja documentada e a fonte original seja identificada.

Isso valida o princípio: **qualquer evento observável e documentado
pode entrar no modelo**, desde que sua origem, confiança e escala
sejam registradas com precisão.

---

## Pendências do módulo

| # | pendência | prioridade |
| --- | --- | --- |
| P01 | Mapear endereço das 5 EMEFs premiadas para vincular a id_loteamento | Alta |
| P02 | Verificar elegibilidade de Hortolândia ao PAA via CADInsans | Alta |
| P03 | Implementar DDL SQLite para FATO_EVENTO_SOCIAL e DIM_TIPO_EVENTO | Média |
| P04 | Expandir catálogo DIM_TIPO_EVENTO com tipos de Saúde e Habitação | Média |
| P05 | Cruzar primeiros registros com FATO_IVS_LOTEAMENTO quando disponível | Alta |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
*Versão 01 — módulo criado a partir de casos reais — 20/03/2026*
