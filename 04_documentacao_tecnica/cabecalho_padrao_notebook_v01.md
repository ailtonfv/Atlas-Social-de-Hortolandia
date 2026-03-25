# Notebook: <nome descritivo>
**id_rastreabilidade:** RTB_00X  
**Versão:** v01  
**Data de criação:** DD/MM/AAAA  
**Última atualização:** DD/MM/AAAA  
**Responsável:** Ailton Vendramini  

---

## 🎯 Finalidade
<descreva em 1–2 linhas o objetivo do notebook>

---

## 📥 Fonte de Dados
**Caminho:** `../dados/01_bruto/AAAA_MM/cadunico.csv`  
**Base:** CadÚnico  
**Período:** AAAA_MM  
**Dicionário:** <arquivo ou versão, se aplicável>  

---

## ⚙️ Etapa do Pipeline
- [ ] Ingestão (bruto)
- [ ] Limpeza (limpo)
- [ ] Curadoria (curado)
- [ ] Análise
- [ ] Exportação

---

## 📊 Outputs Esperados
| tipo_output | descrição | destino |
|------------|----------|--------|
| exploratorio | inspeção inicial | não salvar |
| analitico | tabelas intermediárias | dados/02_limpo ou 03_curado |
| institucional | gráficos finais | outputs/graficos |

---

## 🧠 Observações
- Este notebook faz parte do pipeline IVS-H  
- Não alterar dados diretamente da camada `01_bruto`  
- Sempre salvar resultados nas camadas apropriadas  
