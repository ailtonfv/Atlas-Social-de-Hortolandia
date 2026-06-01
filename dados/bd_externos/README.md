# Banco de Dados Externos — Atlas Social de Hortolândia

Esta pasta organiza todas as fontes externas utilizadas pelo Atlas Social
segundo sua **natureza epistêmica** — ou seja, o tipo de evidência que cada
fonte produz.

---

## Arquitetura das Fontes

```
dados/bd_externos/
├── imprensa/          # Pressão social observada
│   └── tribuna_liberal/
├── governo/           # Resposta institucional registrada
│   └── prefeitura_hortolandia/
├── normativa/         # Decisão formal do Estado
│   └── diario_oficial/
└── estatisticas/      # Evidência estrutural validada
    ├── ibge/
    ├── ipea/
    ├── datasus/
    ├── fbsp/
    └── sidra/
```

---

## Lógica Conceitual

| Camada | Fonte | O que revela |
|--------|-------|--------------|
| **Imprensa** | Tribuna Liberal | Pressão social — o que a população sente e denuncia |
| **Governo** | Prefeitura de Hortolândia | Resposta institucional — o que o Estado entrega |
| **Normativa** | Diário Oficial | Decisão formal — o que o Estado decide e regulamenta |
| **Estatística** | IBGE, IPEA, DATASUS, FBSP, SIDRA | Evidência estrutural — o que os dados confirmam |

Esta arquitetura acompanha a lógica do **IPST-H**:

```
Pressão → Resposta → Desfecho
    ↑           ↑
Imprensa    Governo
            Normativa
            Estatística (validando tudo)
```

---

## Convenção de nomes de arquivos

**Imprensa:**
`AAAA_MM_DD_[fonte].csv`
Exemplo: `2026_05_30_tribuna_liberal.csv`

**Normativa:**
`AAAA_MM_[tipo].csv`
Exemplo: `2026_06_decretos.csv` · `2026_06_portarias.csv`

**Estatística:**
Convenção específica por fonte (IBGE, IPEA etc.)

---

*Atlas Social de Hortolândia · DIAE/SMIDS · Hortolândia-SP*
*IBGE: 3519071*
