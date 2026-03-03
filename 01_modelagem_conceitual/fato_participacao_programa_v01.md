# FATO_PARTICIPACAO_PROGRAMA — Trajetória em Programas
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar o vínculo longitudinal de uma pessoa ou família
com um programa municipal — capturando sua trajetória
completa desde a entrada até o desligamento.

**Natureza:** Trajetória — tem fases, marcos e resultado final.

**Distinção fundamental:**
- FATO_ATENDIMENTO → evento pontual (uma data)
- FATO_CONCESSAO_BENEFICIO → período com vigência (início e fim)
- FATO_PARTICIPACAO_PROGRAMA → trajetória com fases e resultado

---

## Posição na cadeia relacional
```
DIM_PESSOA ──────────────┐
DIM_FAMILIA ─────────────┤
DIM_PROGRAMA ────────────┼──→ FATO_PARTICIPACAO_PROGRAMA
DIM_UNIDADE ─────────────┤
DIM_TERRITORIO ──────────┘
```

---

## Estrutura da FATO_PARTICIPACAO_PROGRAMA
```
id_participacao      (chave surrogate)
cpf                  (chave principal — obrigatória)
id_pessoa            (FK → DIM_PESSOA)
id_familia           (FK → DIM_FAMILIA)
id_programa          (FK → DIM_PROGRAMA)
id_unidade           (FK → DIM_UNIDADE — unidade de referência)
id_territorio        (FK → DIM_TERRITORIO — território de origem)
data_entrada
data_desligamento    (null = ativo)
status               (Ativo | Concluído | Desligado |
                      Abandono | Transferido | Suspenso)
fase_atual           (Acolhimento | Acompanhamento |
                      Qualificação | Inserção | Encerramento)
motivo_desligamento  (Conclusão | Emancipação | Abandono |
                      Transferência | Óbito | Outro)
resultado_final      (Emancipado | Inserido no mercado |
                      Transferido para outro programa |
                      Sem resolução | Em acompanhamento)
id_programa_destino  (FK → DIM_PROGRAMA — se transferido)
profissional_responsavel
data_registro
observacoes
```

---

## Regras de negócio

1. **CPF é obrigatório.** Participações sem CPF identificado
   devem usar `cpf = PENDENTE` e ser atualizadas
   assim que a documentação for obtida.

2. **Histórico preservado.** Desligamentos não apagam
   o registro — atualizam `status`, `data_desligamento`
   e `resultado_final`.

3. **Uma pessoa pode participar de vários programas
   simultaneamente.** Cada vínculo é um registro independente.
   Exemplo: PAIF + ACERTE + Projeto Capacita ao mesmo tempo.

4. **Transferência entre programas** é registrada com
   `status = Transferido` e `id_programa_destino` preenchido.
   Isso permite rastrear a trajetória completa:
   CadÚnico → PAIF → ACERTE → PAT → Mercado formal.

5. **Emancipação assistida** é registrada como
   `resultado_final = Emancipado` — indicador estratégico
   central do projeto.

---

## Trajetória típica de transição produtiva
```
CadÚnico (entrada)
    ↓
PAIF — acompanhamento familiar
    ↓
Projeto Capacita / Costura Industrial — qualificação
    ↓
PAT / SINE — intermediação
    ↓
Mercado formal (CAGED) ou MEI (Receita Federal)
    ↓
Desligamento — resultado_final = Emancipado
```

Esta trajetória é a resposta à pergunta central do projeto:
*"Quem entrou, quem melhorou, quem emancipou?"*

---

## Indicadores que esta tabela viabiliza

| Indicador | Descrição |
|-----------|-----------|
| Taxa de Emancipação Assistida | % participantes com resultado_final = Emancipado |
| Tempo médio até inserção produtiva | data_desligamento - data_entrada para emancipados |
| Taxa de abandono | % participantes com status = Abandono por programa |
| Fluxo entre programas | Trajetória mais frequente entre programas |
| Reincidência | Pessoas que retornam ao mesmo programa após desligamento |
| Permanência média | Tempo médio de participação por programa |

---

## Alinhamento com o MVP

Esta tabela alimenta o terceiro indicador estruturante
do primeiro ciclo:

- **Taxa de Emancipação Assistida** →
  participantes com `resultado_final = Emancipado`
  dividido pelo total de desligamentos no período

---

## Relação com as outras tabelas FATO

Uma mesma pessoa pode ter registros simultâneos nas
três tabelas FATO — e isso é esperado:

| Tabela | O que registra para a mesma pessoa |
|--------|-------------------------------------|
| FATO_ATENDIMENTO | Cada visita ao CRAS |
| FATO_CONCESSAO_BENEFICIO | Bolsa Família ativo |
| FATO_PARTICIPACAO_PROGRAMA | Participando do ACERTE |

O CPF é o fio condutor que une os três registros
e permite reconstruir a trajetória completa.

---

## Pendências

1. Validar lista de fases e resultados com
   equipe técnica da Secretaria de Inclusão
2. Confirmar campos disponíveis no SIGAS
3. Definir critério de emancipação formal —
   quando se considera que uma pessoa emancipou?
4. Avaliar integração futura com CAGED e
   Receita Federal para confirmar inserção produtiva

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação da tabela |

---

*Documento de registro interno. Uso restrito ao projeto.*
```

---

Com isso temos os três arquivos FATO completos. O estado atual do repositório `01_modelagem_conceitual/` ficou assim:
```
dim_gestor_v01.md
dim_programa_v01.md
dim_territorio_cras_v01.md
dim_vereador.md
fato_pl_v01.md
dim_norma_juridica_v01.md
dim_domicilio_v01.md
fato_atendimento_v01.md
fato_concessao_beneficio_v01.md
fato_participacao_programa_v01.md
