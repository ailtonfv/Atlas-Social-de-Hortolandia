[dim_tipo_evento_v01.md](https://github.com/user-attachments/files/26141538/dim_tipo_evento_v01.md)
# DIM_TIPO_EVENTO
**Arquivo:** `dim_tipo_evento_v01.md`
**Localização:** `01_modelagem_conceitual/`
**Versão:** 01 | **Data:** "20/03/2026"
**Responsável:** Ailton Vendramini / Claude (Anthropic)

---

## 1. Propósito

Cataloga os tipos de eventos sociais observáveis no município — crimes,
premiações, programas, ocorrências de saúde, entre outros — fornecendo
a estrutura de classificação que alimenta a `FATO_EVENTO_SOCIAL`.

Esta dimensão é **estável e controlada**: novos tipos são adicionados
por decisão metodológica, não automaticamente. Ela não registra
ocorrências — registra o **catálogo de o que pode ocorrer**.

---

## 2. Estrutura

```
DIM_TIPO_EVENTO
  id_tipo_evento         PK — padrão: EVT_{CATEGORIA}_{SUBCATEGORIA}_{TIPO}
                              ex: EVT_SEG_CRIME_FURTO_VEICULO
  categoria              Segurança Pública | Educação | Saúde |
                         Segurança Alimentar | Habitação | Trabalho | Outro
  subcategoria           Detalhamento da categoria — texto controlado
                              ex: Crime Patrimonial | Tráfico |
                                  Desempenho Escolar | Transferência de Alimentos
  nome_tipo              Nome descritivo do tipo de evento
                              ex: Furto de Veículo | Distribuição PAA |
                                  Premiação Estadual de Alfabetização
  polaridade             Positiva | Negativa | Neutra
                              Positiva = indica melhoria, proteção ou avanço
                              Negativa = indica risco, vulnerabilidade ou problema
                              Neutra   = informativo, sem impacto claro (opcional)
  dimensao_ivsh          IU | CH | RT | Transversal | Nenhuma
                              Indica qual dimensão do IVS-H este tipo de evento
                              mais se relaciona analiticamente
  escala_registro        Loteamento | Núcleo | RP | Município
                              Granularidade esperada para registros deste tipo
  fonte_esperada         Segurança Pública | MEC | MDS | Saúde |
                         Imprensa | Secretaria Municipal | Sistema Municipal | Outro
  gravidade_padrao       Baixa | Média | Alta
                              Referência para o tipo — pode ser sobrescrita na fato
  ativo                  S | N
  observacoes
```

---

## 3. Registros Iniciais

| id_tipo_evento | categoria | subcategoria | nome_tipo | polaridade | dimensao_ivsh | escala_registro | gravidade_padrao |
| --- | --- | --- | --- | --- | --- | --- | --- |
| EVT_SEG_PATRIMONIAL_FURTO_VEICULO | Segurança Pública | Crime Patrimonial | Furto de Veículo | Negativa | RT | Loteamento | Média |
| EVT_SEG_TRAFICO_APREENSAO | Segurança Pública | Tráfico | Apreensão de Entorpecentes | Negativa | RT | Loteamento | Alta |
| EVT_SEG_PATRIMONIAL_ROUBO | Segurança Pública | Crime Patrimonial | Roubo a Pessoa | Negativa | RT | Loteamento | Alta |
| EVT_EDU_DESEMPENHO_PREMIACAO | Educação | Desempenho Escolar | Premiação Estadual de Alfabetização | Positiva | CH | Loteamento | Alta |
| EVT_EDU_DESEMPENHO_EVASAO | Educação | Desempenho Escolar | Evasão Escolar | Negativa | CH | Loteamento | Alta |
| EVT_ALI_TRANSFERENCIA_PAA | Segurança Alimentar | Transferência de Alimentos | Distribuição PAA | Positiva | RT | Município | Média |
| EVT_ALI_INSEGURANCA_GRAVE | Segurança Alimentar | Insegurança Alimentar | Insegurança Alimentar Grave (CADInsans) | Negativa | RT | Município | Alta |
| EVT_SAU_MATERNO_INFANTIL | Saúde | Materno-Infantil | Gravidez na Adolescência | Negativa | CH | Loteamento | Alta |
| EVT_HAB_IRREGULAR | Habitação | Irregularidade | Ocupação Irregular | Negativa | IU | Loteamento | Média |
| EVT_TRA_EMPREGO_FORMAL | Trabalho | Empregabilidade | Inserção em Emprego Formal | Positiva | RT | Loteamento | Média |

---

## 4. Regras de Uso

- `id_tipo_evento` é chave estrangeira em `FATO_EVENTO_SOCIAL`
- Novos tipos devem ser aprovados metodologicamente antes de inserção
- `gravidade_padrao` é referência — a gravidade real é registrada na fato
- `escala_registro` orienta o preenchimento das FKs na fato, mas não impede
  registros em escala diferente quando justificado
- `dimensao_ivsh = Transversal` indica evento que cruza duas ou mais dimensões
- `polaridade = Neutra` deve ser usada com parcimônia — preferir Positiva ou
  Negativa sempre que houver direção analítica identificável

---

## 5. Relação com Outros Documentos

| Documento | Relação |
| --- | --- |
| `fato_evento_social_v01.md` | Tabela fato que referencia esta dimensão via id_tipo_evento |
| `dim_municipio_regioes_loteamentos_v03.md` | FK id_loteamento, id_rp |
| `dim_nucleo_v01.md` | FK id_nucleo |
| `dim_variavel_IVS_v01r5.md` | Campo dimensao_ivsh espelha as dimensões IU, CH, RT |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "20/03/2026" | Criação. Catálogo inicial com 10 tipos derivados de casos reais do município (Tribuna Liberal 20/03/2026 + CadÚnico). |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
