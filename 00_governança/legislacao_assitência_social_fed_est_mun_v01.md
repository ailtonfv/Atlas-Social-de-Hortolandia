# MARCO_LEGAL_ASSISTENCIA_SOCIAL — Hortolândia

Versão: 02  
Data de atualização: 03/03/2026  
Responsável: Ailton Vendramini  
Projeto: PMH Arquitetura de Dados Sociais  

---

## 🎯 Objetivo

Estabelecer metodologia padronizada para:

- Identificação
- Captura
- Classificação
- Versionamento
- Hierarquização
- Vinculação com modelagem de dados

de leis, decretos, resoluções e normativas relacionadas à Assistência Social no município de Hortolândia.

Este documento é metodológico.  
Não é catálogo de normas.  
É o protocolo oficial de governança normativa do projeto.

---

# 1️⃣ Metodologia de Captura Normativa

## 1.1 Fontes Oficiais

### 🔹 Federal
- Constituição Federal (Art. 203 e 204)
- LOAS — Lei nº 8.742/1993
- Normas Operacionais do SUAS
- Portarias do MDS
- Lei do Bolsa Família
- LGPD (Lei nº 13.709/2018)

### 🔹 Estadual (SP)
- Normativas SUAS-SP
- Deliberações CONSEAS

### 🔹 Municipal (Hortolândia)
- Leis Municipais
- Decretos
- Criação de Programas
- Criação de CRAS/CREAS
- Plano Municipal de Assistência Social (PMAS)
- Lei Orçamentária (LOA)
- PPA
- LDO

---

## 1.2 Hierarquia Normativa

As normas devem ser analisadas segundo sua posição na hierarquia jurídica:

1. Constituição Federal  
2. Lei Federal  
3. Lei Municipal  
4. Decreto Municipal  
5. Resolução / Portaria  

Observações importantes:

- Decreto regulamenta Lei.
- Projeto de Lei não possui força normativa até promulgação.
- Revogação altera a vigência, mas não elimina relevância histórica.

---

# 2️⃣ Estrutura de Registro Normativo

Cada norma deverá ser registrada no seguinte padrão:

## Modelo de Registro

- Tipo: (Lei / Decreto / Portaria / Resolução)
- Número:
- Ano:
- Esfera: (Federal / Estadual / Municipal)
- Tema principal:
- Classificação estratégica:
- Secretaria responsável:
- Status de vigência: (Em vigor / Revogada / Alterada / Suspensa)
- Norma originária:
- Norma regulamentadora:
- Impacto em dados:
- Impacto em modelagem:
- Necessita nova DIM? (Sim/Não)
- Necessita nova FATO? (Sim/Não)
- Observações técnicas:

---

# 3️⃣ Classificação Estratégica

Cada norma será classificada segundo:

- 🧩 Estrutural (Criação de órgão / unidade)
- 💰 Financeira (Orçamento / repasse)
- 👥 Público-alvo
- 📊 Indicadores
- 📌 Territorial
- ⚖️ Regulamentação Operacional

---

## 3.1 Distinção Técnica: Norma x Matéria Legislativa

É obrigatório distinguir:

### Norma Jurídica
Lei ou Decreto promulgado.
Possui força obrigatória.
Impacta diretamente modelagem e execução.

### Matéria Legislativa
Projeto de Lei, Indicação, Moção, Requerimento.
Não possui força normativa até promulgação.
Impacta monitoramento político e agenda institucional.

Somente normas promulgadas alteram o modelo de dados.

---

# 4️⃣ Vinculação com Arquitetura de Dados

A cada nova norma capturada, deve-se avaliar:

- Afeta DIM_PROGRAMA?
- Afeta DIM_UNIDADE?
- Afeta DIM_LOCALIDADES?
- Afeta DIM_BENEFICIO?
- Afeta FATO_ATENDIMENTO?
- Afeta FATO_CONCESSAO_BENEFICIO?
- Afeta KPIs estratégicos?

A norma deve sempre gerar rastreabilidade no modelo.

---

# 5️⃣ Registro Histórico (Versionamento)

| Versão | Data | Alteração | Responsável |
|--------|------|----------|-------------|
| 01 | 02/03/2026 | Criação do documento | Ailton Vendramini |
| 02 | 03/03/2026 | Inclusão de hierarquia normativa, distinção norma/matéria, controle de vigência e vínculo regulatório | Ailton Vendramini |

---

# 6️⃣ Diretriz Estratégica

A arquitetura de dados deve ser:

- Imune a mudanças políticas
- Sensível a mudanças normativas
- Capaz de rastrear a origem legal de cada programa
- Capaz de registrar vigência e revogação
- Capaz de preservar histórico normativo

---

# 7️⃣ Próximo Passo Estrutural

Implementar:

- DIM_NORMA_JURIDICA
- REL_NORMA_PROGRAMA
- REL_NORMA_UNIDADE
- REL_NORMA_BENEFICIO

Com controle de vigência e hierarquia.

---

Documento metodológico interno.
Uso estratégico no Projeto PMH Arquitetura de Dados Sociais.
