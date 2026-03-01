# DIM_GESTOR — Gestores Municipais de Hortolândia
**Versão:** 02  
**Data de criação:** 28/02/2026  
**Data de atualização:** 01/03/2026  
**Fonte primária:** Documentos internos, relatórios quadrimestrais, ciclo jornalístico (Tribuna Liberal), site oficial da Prefeitura de Hortolândia  
**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Esta tabela registra os gestores municipais de Hortolândia com relevância para o projeto de inteligência territorial da assistência social. Inclui prefeito, vice-prefeito, secretários titulares, secretários adjuntos e diretores de departamentos estratégicos.

**Por que modelar gestores:**
- Secretários aparecem como `secretaria_responsavel` no DIM_PROGRAMA — o vínculo nominal permite rastreabilidade histórica
- Adjuntos conduzem o dia a dia operacional e participam de grupos de trabalho técnicos
- Mudanças de titularidade impactam encaminhamentos e acordos de acesso a dados
- O campo `data_fim` permite substituições sem perda do histórico

**Fontes utilizadas (v02):**
- Relatório Quadrimestral de Saúde — 3º Quadrimestre 2025
- Tribuna Liberal — edições de fevereiro, março de 2026 e 06/01/2026
- Documentos internos do projeto (reunião de 30/01/2026, nota técnica 02/02/2026)
- Site oficial da Prefeitura de Hortolândia — varredura sistemática de secretarias em 01/03/2026

---

## Estrutura da DIM_GESTOR

```
id_gestor           (chave surrogate)
nome
cargo               (Prefeito | Vice-Prefeito | Secretário | Secretário Adjunto | Diretor | A confirmar)
secretaria          (nome da secretaria ou órgão)
data_inicio         (data de posse ou início confirmado)
data_fim            (null = ainda no cargo)
ativo               (S/N)
fonte_confirmacao   (Diário Oficial | Relatório Oficial | Jornal | Site Oficial | Documento Interno | A confirmar)
observacoes
```

---

## Registros confirmados

### Poder Executivo — Chefia

| id | Nome | Cargo | Secretaria / Órgão | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|-------------------|-------------|----------|-------|-------|
| 001 | Zezé Gomes | Prefeito | Gabinete do Prefeito | A confirmar | — | S | Jornal (Tribuna Liberal) |
| 002 | Cafú Cesar | Vice-Prefeito | Gabinete do Vice-Prefeito | A confirmar | A confirmar (buscar DO) | **N** | Informação direta |

> ⚠️ **Registro 002 — Cafú Cesar:** Exonerado do cargo. Afastamento por determinação judicial. Situação: prisão domiciliar e suspensão de direitos políticos. Cargo atualmente **vago** — sem substituto identificado até esta versão. Buscar decreto de exoneração no Diário Oficial para confirmar data_fim.

---

### Secretarias — Titulares confirmados

| id | Nome | Cargo | Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|-----------|-------------|----------|-------|-------|
| 003 | Maria dos Anjos Assis Barros | Secretária | Inclusão e Desenvolvimento Social | A confirmar | — | S | Jornal + Documento Interno |
| 004 | Maria dos Anjos Assis Barros | Presidente | Fundo Social de Solidariedade | A confirmar | — | S | Jornal (acúmulo de função) |
| 005 | Dênis André José Crupe | Secretário | Saúde | 15/05/2020 | — | S | Relatório Quadrimestral 3º Trim./2025 |
| 006 | Dimas Corrêa Pádua | Secretário | Desenvolvimento Econômico, Trabalho, Turismo e Inovação | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) + Site Oficial |
| 007 | Eliane Nascimento | Secretária | Meio Ambiente, Desenvolvimento Sustentável e Assuntos Climáticos | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |
| 008 | Gleguer Zorzin | Secretário | Esporte e Lazer | A confirmar | — | S | Jornal (Tribuna Liberal, 24/02/2026) + Site Oficial |
| 013 | Régis Athanázio Bueno | Secretário | Cultura | A confirmar | — | S | Site Oficial (01/03/2026) |
| 014 | Renato Franceschini Bueno | Secretário | Habitação | A confirmar | — | S | Site Oficial (01/03/2026) |
| 015 | Simone Cristina Locatelli | Secretária | Educação, Ciência e Tecnologia | A confirmar | — | S | Site Oficial (01/03/2026) |
| 016 | Gerson Ferreira | Secretário | Governo | A confirmar | — | S | Site Oficial (01/03/2026) |
| 017 | Antonio Agnelo Bonadio | Secretário | Finanças | A confirmar | — | S | Jornal (Tribuna Liberal, 06/01/2026) |

---

### Secretarias — Adjuntos confirmados

| id | Nome | Cargo | Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|-----------|-------------|----------|-------|-------|
| 009 | Jennifer Bazilio | Secretária Adjunta | Saúde | 02/01/2025 | — | S | Relatório Quadrimestral 3º Trim./2025 |
| 018 | Lenivaldo Pauliuki | Secretário Adjunto | Inclusão e Desenvolvimento Social | A confirmar | — | S | Site Oficial (01/03/2026) |
| 019 | Tim Mendes | Secretário Adjunto | Cultura | A confirmar | — | S | Site Oficial (01/03/2026) |
| 020 | Renato Muccillo | Secretário Adjunto | Educação, Ciência e Tecnologia | A confirmar | — | S | Site Oficial (01/03/2026) |
| 021 | Rodrigo Roberto Teixeira de Oliveira | Secretário Adjunto | Desenvolvimento Econômico, Trabalho, Turismo e Inovação | A confirmar | — | S | Site Oficial (01/03/2026) |
| 022 | Edson Nascimento dos Santos | Secretário Adjunto | Esporte e Lazer | A confirmar | — | S | Site Oficial (01/03/2026) |
| 023 | Jéssica Guimarães Alves Bastos | Secretária Adjunta | Governo | A confirmar | — | S | Site Oficial (01/03/2026) |

> 📌 **Nota — Lenivaldo Pauliuki (id 018):** Identificado como "Leni" nos documentos internos do projeto (reunião de 30/01/2026, nota técnica de 02/02/2026). Pendência resolvida na v02.

---

### Diretores de departamento — confirmados

| id | Nome | Cargo | Departamento / Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|--------------------------|-------------|----------|-------|-------|
| 010 | Jesus José Ribeiro da Costa | Diretor | Assistência Social (Sec. Inclusão) | A confirmar | — | S | Jornal (Tribuna Liberal, 03/01/2026) |

---

### Conselhos e instâncias de controle social

| id | Nome | Cargo | Conselho / Instância | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|---------------------|-------------|----------|-------|-------|
| 011 | Mauro Selço Salvino de Mendonça | Presidente | Conselho Municipal de Saúde (CMS) | A confirmar | — | S | Relatório Quadrimestral 3º Trim./2025 |
| 012 | Sunne Teixeira dos Santos | Presidente | Conselho Municipal de Meio Ambiente (CMMA) | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |

---

## Secretarias sem titular confirmado

| Secretaria | Status |
|-----------|--------|
| Segurança Pública | Pendente |
| Obras | Pendente |
| Mobilidade Urbana | Pendente |
| Planejamento Urbano e Gestão Estratégica | Pendente |
| Administração e Gestão de Pessoal | Pendente |
| Assuntos Jurídicos | Pendente |

> ✅ **Resolvidas na v02:** Habitação (Renato Franceschini Bueno), Educação (Simone Cristina Locatelli), Governo (Gerson Ferreira), Finanças (Antonio Agnelo Bonadio).

---

## Pendências e pontos a confirmar

1. **Vice-Prefeito (Cafú Cesar)** — Buscar decreto de exoneração no Diário Oficial para registrar data_fim oficial. Verificar se cargo foi preenchido por substituto.
2. **Datas de início dos secretários** — Apenas Saúde tem data de posse documentada. Para os demais, confirmar via Diário Oficial.
3. **Secretários adjuntos das secretarias faltantes** — Segurança Pública, Obras, Mobilidade Urbana, Planejamento ainda sem adjuntos identificados.
4. **Diretores de departamentos estratégicos** — Confirmar titulares dos departamentos de Direitos Humanos e Políticas Públicas, PCD, Segurança Alimentar e Inclusão Produtiva (DIPGR).
5. **Fernanda Fadiga** — Psicóloga identificada como coordenadora do CCMI. Verificar cargo formal para inclusão como diretora ou coordenadora.
6. **Estrutura interna da Secretaria de Governo** — 9 departamentos confirmados pelo site: Administrativo, Chefia de Gabinete, Controle e Monitoramento da Cidade, Comunicação, Convênios, **Direitos Humanos e Políticas Públicas**, **Mulheres**, Publicidades Institucionais, **Relações Institucionais**. Confirmar diretores de cada departamento.

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01 | 28/02/2026 | Criação da tabela — 12 registros confirmados, 5 secretarias pendentes |
| v02 | 01/03/2026 | Atualização via varredura do site oficial (01/03/2026) e Tribuna Liberal 06/01/2026: registro 002 (Cafú Cesar) atualizado como exonerado/ativo=N; 11 novos registros (ids 013–023); 4 pendências de titulares de secretaria resolvidas (Habitação, Educação, Governo, Finanças); identificação de Lenivaldo Pauliuki como "Leni" dos documentos internos |

---

*Documento gerado a partir de levantamento documental e ciclo jornalístico. Sujeito a revisão e atualização.*
