# 📊 Atlas Social — IVS-H (Hortolândia)

## 🎯 Objetivo

Construir o **Índice de Vulnerabilidade Social de Hortolândia (IVS-H)**, com base na metodologia do IPEA, adaptada à realidade local, utilizando dados do Cadastro Único (CadÚnico) e, futuramente, outras bases públicas e administrativas.

---

## 🧠 Aplicação

O IVS-H tem como objetivo apoiar a tomada de decisão das secretarias municipais, permitindo:

- Identificação de áreas com maior vulnerabilidade
- Priorização de políticas públicas
- Integração entre secretarias (rompimento de silos)
- Monitoramento de resultados ao longo do tempo

---

## 🏗️ Arquitetura de Dados

O projeto segue uma estrutura inspirada em **Data Lakehouse**, com separação por camadas e controle temporal explícito.

### Estrutura geral


### Camadas

| Camada | Descrição |
|------|--------|
| `01_bruto` | Dados originais, imutáveis |
| `02_limpo` | Dados tratados (qualidade técnica) |
| `03_curado` | Dados preparados para análise |
| `04_exportacao` | Arquivos finais para consumo |
| `externos` | Bases auxiliares (IBGE, etc.) |

---

## 🔁 Pipeline de Dados

O processamento segue um fluxo padronizado e rastreável:

1. **Ingestão (RTB_001)**  
   Inserção dos dados brutos  
   → `dados/cadunico/01_bruto/AAAA_MM/`

2. **Tratamento (RTB_002)**  
   Limpeza, padronização e validação  
   → `dados/cadunico/02_limpo/AAAA_MM/`

3. **Curadoria (RTB_003)**  
   Seleção e organização das variáveis analíticas  
   → `dados/cadunico/03_curado/AAAA_MM/`

4. **Análise (RTB_004)**  
   Execução de cálculos e diagnósticos  
   → notebooks em `notebooks/`

5. **Exportação (RTB_005)**  
   Geração de outputs para uso operacional e institucional  
   → `dados/cadunico/04_exportacao/AAAA_MM/`  
   → `outputs/`

---

## 🧾 Rastreabilidade

Cada etapa do pipeline possui um identificador único (`id_rastreabilidade`), permitindo:

- auditoria do processo
- identificação da origem dos dados
- rastreamento de erros
- reprodutibilidade das análises

### Exemplo

| ID | Etapa | Descrição |
|----|------|----------|
| RTB_001 | Ingestão | Leitura da base bruta |
| RTB_002 | Tratamento | Limpeza técnica |
| RTB_003 | Curadoria | Preparação analítica |
| RTB_004 | Análise | Cálculo de indicadores |
| RTB_005 | Exportação | Geração de outputs |

---

## 📆 Controle Temporal

Todas as bases são organizadas por período no formato:

```text
AAAA_MM

2025_12
2026_03