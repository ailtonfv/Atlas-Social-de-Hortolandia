[fechamento_dia_19_03_2026.txt](https://github.com/user-attachments/files/26117017/fechamento_dia_19_03_2026.txt)
# Fechamento do Dia — 19/03/2026

**Projeto:** Atlas Social de Hortolândia  
**Responsável:** Ailton Vendramini  
**Repositório:** ailtonfv/Atlas-Social-de-Hortolandia

---

## Resumo da Sessão

Dia focado em documentação institucional, atualização do catálogo de
programas e produção de conteúdo para o e-book. Sem execução técnica
na Debian — prioridade transferida para próxima sessão.

---

## Arquivos Gerados

| Arquivo | Versão | Localização | O que mudou |
| --- | --- | --- | --- |
| `palestra_marco_2026.md` | v09 → v10 | `00_governanca/` | Slide de Suporte: caminho exato FTP IBGE (8 etapas), dado fossa séptica (Domicilio_SP.zip), distinção SNIS x IBGE formalizada |
| `dim_programa.md` | v05 → v06 | `01_modelagem_conceitual/` | CASA_MULHER_BR e ELES_ELAS adicionados ao Grupo 8. Total: 69 programas |
| `reuniao_17_03_2026_nota_tecnica_v01.docx` | v01 (novo) | e-book / Reuniões | Nota técnica da ata Caio x Cláudia (17/03/2026) — pronta para inserir após 10/02/2026 |
| `ebook_cap_sistema_socioassistencial_v01.docx` | v01 (novo) | e-book / Capítulos | Síntese analítica das duas atas SMIDS para capítulo do e-book |

**Commitados pelo Ailton:** `palestra_marco_2026_v10.md`, `dim_programa_v06.md`

---

## Decisão Importante Registrada

**CadÚnico não vai para o GitHub — nunca.**

O arquivo `/tmp/cecad/tudo.csv` (~72.400 indivíduos) contém dados
pessoais protegidos pela LGPD (Lei 13.709/2018). Subir em repositório
público seria violação direta da lei.

O que vai para o repositório:
- Scripts SQL de transformação e cálculo (versionados e auditáveis)
- Resultados agregados por loteamento/núcleo/RP (sem identificação individual)
- Documentação metodológica

O que fica apenas na Debian institucional:
- `/tmp/cecad/tudo.csv` — dado bruto pessoal
- `hortolandia.db` e `atlas_social_hortolandia.db` — já no `.gitignore`

---

## Estado do SIGAS

Contrato da empresa venceu. Nova licitação em andamento. Acesso aos
dados depende de outros canais institucionais — em tratativa. Não há
previsão definida.

---

## Análise Estratégica — Palestra

Exercício realizado: classificação dos 5 itens de maior impacto para
a Secretária de Inclusão na plateia, do ponto de vista dela:

1. Frase "Hoje atende → passa a priorizar" — pode gerar defensividade
   ou aliança dependendo da entrega oral
2. Amanda e Primavera com evidência empírica — respeito, não crítica
3. Gap vulneráveis x atendidos — torna mensurável o que ela já sabe
4. Ponto focal — demanda adicional ou protagonismo (depende do prefeito)
5. Ausência de integração intersetorial — item mais sensível, exige
   tom cuidadoso

A ordem de apresentação importa: construir aliança antes de chegar
nos itens 3 e 5.

---
| Fase | Leitura | Objetivo | Variáveis utilizadas | Dimensões cobertas | Fonte principal | Observação metodológica |
|------|--------|----------|---------------------|--------------------|------------------|--------------------------|

| Fase 1 — MVP | Referência (IPEA parcial) | Iniciar o cálculo com base real | CH_05, CH_06, CH_07, RT_01, RT_04 | Capital Humano + Renda/Trabalho | CadÚnico (dez/2025) | Mantém estrutura do IPEA com cobertura parcial |
| Fase 1 — MVP | Gestão Local | Leitura operacional da vulnerabilidade | CH_05, CH_06, CH_07, RT_01, RT_04 | Capital Humano + Renda/Trabalho | CadÚnico | Ênfase prática em renda e estrutura familiar |

| Fase 2 — Intermediária | Referência (IPEA expandido) | Aumentar cobertura do índice | CH_01, CH_02, CH_04, RT_02, RT_06, RT_07 + Fase 1 | Todas dimensões parcialmente cobertas | IBGE (SIDRA), CAGED, Saúde, Educação | Infraestrutura ainda incompleta ou agregada |
| Fase 2 — Intermediária | Gestão Local | Melhorar capacidade de decisão territorial | CH_01, CH_02, CH_04, RT_01, RT_02, RT_06, RT_07 + Fase 1 | Capital Humano + Renda/Trabalho dominantes | CadÚnico + IBGE + CAGED | Peso implícito maior nas variáveis mais discriminantes |

| Fase 3 — Completa | Referência (IPEA completo) | Índice totalmente comparável ao IPEA | IU_01, IU_02, IU_03, IU_04 + CH_01–CH_08 + RT_01–RT_07 | 3 dimensões completas | IBGE + SNIS + CadÚnico + CAGED + Saúde + Educação | Cobertura integral das 16 variáveis |
| Fase 3 — Completa | Gestão Local | Índice calibrado à realidade municipal | Todas as 16 variáveis (mesma base) | 3 dimensões completas | Todas as fontes integradas | Possível ajuste de pesos com base empírica |
