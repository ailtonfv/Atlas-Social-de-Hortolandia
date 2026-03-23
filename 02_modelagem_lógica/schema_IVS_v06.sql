-- =============================================================================
-- schema_IVS.sql
-- Esquema completo do banco de dados — Atlas Social de Hortolândia
-- Versão: v06 — "23/03/2026"
-- Responsável: Ailton Vendramini
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
-- =============================================================================
-- v01 — "10/03/2026" — Criação
-- v02 — "10/03/2026" — Renomeação: fato_ivs_territorial → fato_ivs_loteamento
-- v03 — "11/03/2026" — FKs declaradas; campo unidade_medida; nota DIM_TEMPO
-- v04 — "20/03/2026" — FATO_ABRANGENCIA_CRAS; DIM_TIPO_EVENTO; FATO_EVENTO_SOCIAL
-- v05 — "20/03/2026" — Consolidação final do dia
-- v06 — "23/03/2026" — CORREÇÃO ESTRUTURAL:
--                      (1) fato_ivs_loteamento separada em duas tabelas
--                          conforme nota_tecnica_fato_ivs_loteamento_v04.sql:
--                          fato_variavel_ivs_loteamento (variáveis brutas)
--                          fato_ivs_loteamento (índice consolidado)
--                      (2) campo texto livre fonte_dado substituído por FK
--                          id_fonte referenciando dim_fonte_dado
--                      (3) nota SIDRA_CENSO2022 atualizada: RT_06 e RT_07
--                          pertencem ao IPST-H — não ao IVS-H
--                      (4) referência de arquivo de governança corrigida:
--                          arquitetura_dados_IVS_IBGE_Horto_v10.md
-- =============================================================================

-- =============================================================================
-- MOTIVAÇÃO
-- =============================================================================
--
-- As variáveis do IVS não são estáticas.
--
-- Exemplo concreto — Hortolândia, dimensão Infraestrutura Urbana:
--
--   Ano  | Cobertura água | Coleta esgoto | Esgoto tratado
--   -----+----------------+---------------+---------------
--   2014 | 99,9%          | 99,8%         | 82,0%
--   2015 | 100,0%         | 100,0%        | 82,5%
--   2016 | 100,0%         | 99,4%         | 96,9%
--   2017 | 100,0%         | 99,2%         | 96,3%
--   2018 | 100,0%         | 99,5%         | 96,3%
--   2019 | 100,0%         | 99,7%         | 96,4%
--   2020 | 100,0%         | 96,4%         | 89,7%
--
--   Fonte: SNIS / SABESP — Instituto Trata Brasil, 2022
--
-- Implicação arquitetural:
--   - IU_01 e IU_02 variam conforme novas obras são implantadas
--   - O mesmo vale para variáveis do CadÚnico (atualização contínua)
--     e do CAGED (mensal)
--   - A DIM_VARIAVEL_IVS define O QUE medir — não QUANDO nem QUANTO
--   - Os valores reais, por loteamento e por período, pertencem a
--     FATO_VARIAVEL_IVS_LOTEAMENTO
--   - O índice consolidado por loteamento pertence a FATO_IVS_LOTEAMENTO
--
-- =============================================================================
-- HIERARQUIA ANALÍTICA DO PROJETO
-- =============================================================================
--
--   Município → Região de Planejamento → Núcleo → Loteamento
--
--   id_loteamento  = unidade mínima de análise (141 loteamentos oficiais)
--   id_nucleo      = agregação operacional por setor (Inclusão, Saúde, Educação...)
--   id_rp          = agregação por Região de Planejamento (6 RPs — Plano Diretor)
--
--   PRINCÍPIO: o loteamento é o átomo espacial — estável e imutável.
--   O núcleo é camada de agregação flexível — cada secretaria define os seus.
--   A cobertura do CRAS é operacional (limite de atendimento), não geográfica.
--
-- =============================================================================
-- DECISÃO METODOLÓGICA CENTRAL — IVS-H vs IPST-H
-- =============================================================================
--
--   IVS-H: preserva exatamente as 16 variáveis do IVS/IPEA.
--   Dimensões: Infraestrutura Urbana (3), Capital Humano (8), Renda e Trabalho (5).
--   Variáveis locais de deslocamento (RT_06, RT_07) pertencem ao IPST-H,
--   não ao IVS-H. Referência: dim_variavel_IVS_v01r7.md
--
--   IPST-H: índice próprio municipal — mede pressão sobre o Estado.
--   Eixos: Pressão Territorial (PT), Pressão Operacional (PO), Lacunas (LC).
--   Referência: ipst_h_v02.md
--
-- =============================================================================
-- SEPARAÇÃO SEMÂNTICA DE TABELAS FATO — IVS-H
-- =============================================================================
--
--   fato_variavel_ivs_loteamento
--     → Armazena o valor bruto/percentual de cada variável IVS-H
--        por loteamento e período de referência.
--     → É a tabela de ingestão e cálculo intermediário.
--     → Equivale a "o que foi medido, onde e quando".
--
--   fato_ivs_loteamento
--     → Armazena o índice IVS-H já calculado, por dimensão e geral,
--        por loteamento e período.
--     → É a tabela de resultado analítico.
--     → Equivale a "qual é o índice consolidado do loteamento".
--
--   A separação evita ambiguidade semântica e facilita auditoria:
--   é sempre possível rastrear do índice final até a variável bruta.
--   Referência: nota_tecnica_fato_ivs_loteamento_v04.sql
--
-- =============================================================================
-- ROADMAP — DIM_TEMPO
-- =============================================================================
--
-- No MVP, o período é registrado como texto (periodo_referencia TEXT).
-- Em evolução futura, recomenda-se substituir por uma dimensão de tempo:
--
--   CREATE TABLE dim_tempo (
--       id_tempo        INTEGER PRIMARY KEY,
--       ano             INTEGER NOT NULL,
--       semestre        INTEGER,
--       mes             INTEGER,
--       tipo_periodo    TEXT
--   );
--
-- =============================================================================
-- TABELA DE FONTES — DIM_FONTE_DADO
-- =============================================================================

CREATE TABLE IF NOT EXISTS dim_fonte_dado (

    id_fonte            TEXT    PRIMARY KEY,
    -- Convenção: SIGLA_ANO ou SIGLA_PERIODICIDADE
    -- Exemplos: 'SNIS_2022', 'CADUNICO_DEZ2025', 'CENSO2022_SETOR'
    -- Proibido: espaços, acentos, barras, letras minúsculas.

    nome_fonte          TEXT    NOT NULL,
    orgao_responsavel   TEXT,
    periodicidade       TEXT,
    -- Valores: Anual | Semestral | Mensal | Decenal | Eventual

    url_acesso          TEXT,
    data_ultima_carga   TEXT,   -- ISO 8601: YYYY-MM-DD
    observacoes         TEXT
);

INSERT OR IGNORE INTO dim_fonte_dado VALUES
    ('SNIS_2022',
     'Sistema Nacional de Informações sobre Saneamento',
     'Ministério das Cidades', 'Anual',
     'https://app4.mdr.gov.br/serieHistorica/', '2026-03-10',
     'Indicadores de água e esgoto por município. IU_01 e IU_02.'),

    ('CADUNICO_DEZ2025',
     'Cadastro Único para Programas Sociais — extração dezembro/2025',
     'Ministério do Desenvolvimento e Assistência Social', 'Mensal',
     NULL, '2026-03-10',
     'Fonte principal de CH e RT. 72.424 pessoas em Hortolândia (dez/2025). '
     'Renda autodeclarada — triangulação futura via CAGED/CNIS.'),

    ('CENSO2022_SETOR',
     'Censo Demográfico 2022 — Agregados por Setores Censitários',
     'IBGE', 'Decenal',
     'https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/', '2026-03-10',
     'IU_01, IU_02, IU_03 e variáveis CH/RT do Censo. '
     'Renda domiciliar per capita por setor não publicada — CadÚnico é '
     'fonte primária de RT_01. '
     'NOTA v06: RT_06 e RT_07 (deslocamento para trabalho/estudo) pertencem '
     'ao IPST-H — não ao IVS-H. Fonte SIDRA permanece válida para IU_03.'),

    ('CAGED_MENSAL',
     'Cadastro Geral de Empregados e Desempregados',
     'Ministério do Trabalho', 'Mensal',
     'https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/estatisticas-trabalho/caged',
     '2026-03-10',
     'Vínculo formal. RT_02 e RT_03. MEI não aparece no CAGED.'),

    ('SABESP_SNIS',
     'SABESP — indicadores SNIS Hortolândia',
     'SABESP / Instituto Trata Brasil', 'Anual',
     'https://tratabrasil.org.br', '2026-03-10',
     'Água 100% (2015-2020), esgoto 96,4% (2020), tratamento 89,7% (2020). '
     'Fonte empírica para calibração do peso IU no IVS-H.');


-- =============================================================================
-- MÓDULO 1A — FATO_VARIAVEL_IVS_LOTEAMENTO
-- Variáveis brutas/intermediárias por loteamento e período.
-- "O que foi medido, onde e quando."
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_variavel_ivs_loteamento (

    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,

    id_variavel         TEXT    NOT NULL,
    -- FK → dim_variavel_ivs
    -- Valores IVS-H: IVS001–IVS016 (16 variáveis IPEA)
    -- IVS_L01 e IVS_L02 pertencem ao IPST-H — não inserir aqui.

    id_loteamento       TEXT    NOT NULL,   -- FK → dim_loteamento
    id_nucleo           TEXT,               -- FK → dim_nucleo (conveniência analítica)
    id_rp               TEXT,               -- FK → dim_regiao_planejamento (idem)

    periodo_referencia  TEXT    NOT NULL,
    -- Convenção obrigatória: YYYY | YYYY-MM | YYYY-S1 | YYYY-S2

    data_extracao       TEXT    NOT NULL,   -- ISO 8601: YYYY-MM-DD

    id_fonte            TEXT    NOT NULL,
    -- FK → dim_fonte_dado
    -- Substitui campo texto livre fonte_dado das versões anteriores.

    versao_fonte        TEXT,

    valor_absoluto      REAL,   -- Numerador
    valor_denominador   REAL,   -- Denominador
    valor_percentual    REAL,
    -- Unidade: percentual legível — armazenar 3.6 para 3,6%.
    -- Nunca armazenar como proporção (0.036).

    cobertura_cadastral REAL,   -- % da população coberta pela fonte

    flag_estimado       INTEGER DEFAULT 0,  -- 1 = estimado/interpolado
    flag_revisado       INTEGER DEFAULT 0,  -- 1 = revisado após publicação
    flag_oficial        INTEGER DEFAULT 1,  -- 0 = derivado internamente

    observacoes         TEXT,

    FOREIGN KEY (id_variavel) REFERENCES dim_variavel_ivs(id_variavel),
    FOREIGN KEY (id_fonte)    REFERENCES dim_fonte_dado(id_fonte),

    UNIQUE (id_variavel, id_loteamento, periodo_referencia, id_fonte)
);

CREATE INDEX IF NOT EXISTS idx_fvil_variavel
    ON fato_variavel_ivs_loteamento (id_variavel);
CREATE INDEX IF NOT EXISTS idx_fvil_loteamento
    ON fato_variavel_ivs_loteamento (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_fvil_periodo
    ON fato_variavel_ivs_loteamento (periodo_referencia);
CREATE INDEX IF NOT EXISTS idx_fvil_fonte
    ON fato_variavel_ivs_loteamento (id_fonte);
CREATE INDEX IF NOT EXISTS idx_fvil_nucleo
    ON fato_variavel_ivs_loteamento (id_nucleo);


-- =============================================================================
-- MÓDULO 1B — FATO_IVS_LOTEAMENTO
-- Índice IVS-H consolidado por loteamento e período.
-- "Qual é o índice do loteamento."
-- Calculado a partir de fato_variavel_ivs_loteamento após
-- normalização min-max e aplicação de pesos.
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_ivs_loteamento (

    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,

    id_loteamento       TEXT    NOT NULL,   -- FK → dim_loteamento
    id_nucleo           TEXT,               -- FK → dim_nucleo
    id_rp               TEXT,               -- FK → dim_regiao_planejamento

    periodo_referencia  TEXT    NOT NULL,
    data_calculo        TEXT    NOT NULL,   -- ISO 8601: YYYY-MM-DD

    versao_calculo      TEXT,
    -- Ex: 'IVS-H_FASE1_v1' | 'IVS-H_EXPANDIDO_v2'

    -- Índice por dimensão (normalizados, 0 a 1)
    ivsh_infraestrutura_urbana  REAL,
    ivsh_capital_humano         REAL,
    ivsh_renda_trabalho         REAL,

    -- Índice geral (0 a 1)
    ivsh_geral          REAL,

    -- Rastreabilidade do cálculo
    n_variaveis_iu      INTEGER,
    n_variaveis_ch      INTEGER,
    n_variaveis_rt      INTEGER,
    n_variaveis_total   INTEGER,

    flag_parcial        INTEGER DEFAULT 0,
    -- 1 = calculado com subconjunto de variáveis (MVP/Fase 1)
    -- 0 = calculado com conjunto completo (16 variáveis)

    observacoes         TEXT,

    FOREIGN KEY (id_loteamento) REFERENCES dim_loteamento(id_loteamento),

    UNIQUE (id_loteamento, periodo_referencia, versao_calculo)
);

CREATE INDEX IF NOT EXISTS idx_fil_loteamento
    ON fato_ivs_loteamento (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_fil_periodo
    ON fato_ivs_loteamento (periodo_referencia);
CREATE INDEX IF NOT EXISTS idx_fil_nucleo
    ON fato_ivs_loteamento (id_nucleo);


-- =============================================================================
-- MÓDULO 2 — COBERTURA CRAS
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_abrangencia_cras (

    id_abrangencia      INTEGER PRIMARY KEY AUTOINCREMENT,
    id_loteamento       TEXT    NOT NULL,
    id_cras             TEXT    NOT NULL,
    data_inicio         TEXT    NOT NULL,
    data_fim            TEXT,
    ativo               INTEGER DEFAULT 1,
    fonte_delimitacao   TEXT,
    observacoes         TEXT,

    FOREIGN KEY (id_loteamento) REFERENCES dim_loteamento(id_loteamento),
    UNIQUE (id_loteamento, id_cras, data_inicio)
);

CREATE INDEX IF NOT EXISTS idx_abrangencia_loteamento
    ON fato_abrangencia_cras (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_abrangencia_cras
    ON fato_abrangencia_cras (id_cras);
CREATE INDEX IF NOT EXISTS idx_abrangencia_ativo
    ON fato_abrangencia_cras (ativo);


-- =============================================================================
-- MÓDULO 3 — EVENTOS SOCIAIS
-- =============================================================================

CREATE TABLE IF NOT EXISTS dim_tipo_evento (

    id_tipo_evento      TEXT    PRIMARY KEY,
    categoria           TEXT    NOT NULL,
    subcategoria        TEXT    NOT NULL,
    nome_tipo           TEXT    NOT NULL,
    polaridade          TEXT    NOT NULL
                                CHECK (polaridade IN ('Positiva','Negativa','Neutra')),
    dimensao_ivsh       TEXT,
    escala_registro     TEXT    NOT NULL
                                CHECK (escala_registro IN
                                    ('Loteamento','Nucleo','RP','Municipio')),
    fonte_esperada      TEXT,
    gravidade_padrao    TEXT    CHECK (gravidade_padrao IN ('Baixa','Media','Alta')),
    ativo               INTEGER DEFAULT 1,
    observacoes         TEXT
);

INSERT OR IGNORE INTO dim_tipo_evento VALUES
    ('EVT_SEG_PATRIMONIAL_FURTO_VEICULO','Segurança Pública','Crime Patrimonial',
     'Furto de Veículo','Negativa','RT','Loteamento','Boletim Oficial','Alta',1,NULL),
    ('EVT_SEG_TRAFICO_APREENSAO','Segurança Pública','Tráfico',
     'Apreensão de Entorpecentes','Negativa','RT','Loteamento','Boletim Oficial','Alta',1,NULL),
    ('EVT_SEG_PATRIMONIAL_ROUBO','Segurança Pública','Crime Patrimonial',
     'Roubo a Pessoa','Negativa','RT','Loteamento','Boletim Oficial','Alta',1,NULL),
    ('EVT_EDU_DESEMPENHO_PREMIACAO','Educação','Desempenho Escolar',
     'Premiação Estadual de Alfabetização','Positiva','CH','Loteamento','Secretaria Municipal','Alta',1,NULL),
    ('EVT_EDU_DESEMPENHO_EVASAO','Educação','Desempenho Escolar',
     'Evasão Escolar','Negativa','CH','Loteamento','Sistema Municipal','Alta',1,NULL),
    ('EVT_ALI_TRANSFERENCIA_PAA','Segurança Alimentar','Transferência de Alimentos',
     'Distribuição PAA','Positiva','RT','Municipio','Imprensa','Media',1,
     'Município elegível via CADInsans — derivado do CadÚnico'),
    ('EVT_ALI_INSEGURANCA_GRAVE','Segurança Alimentar','Insegurança Alimentar',
     'Insegurança Alimentar Grave (CADInsans)','Negativa','RT','Municipio','MDS','Alta',1,NULL),
    ('EVT_SAU_MATERNO_INFANTIL','Saúde','Materno-Infantil',
     'Gravidez na Adolescência','Negativa','CH','Loteamento','Saúde','Alta',1,NULL),
    ('EVT_HAB_IRREGULAR','Habitação','Irregularidade',
     'Ocupação Irregular','Negativa','IU','Loteamento','Secretaria Municipal','Media',1,NULL),
    ('EVT_TRA_EMPREGO_FORMAL','Trabalho','Empregabilidade',
     'Inserção em Emprego Formal','Positiva','RT','Loteamento','CAGED','Media',1,NULL);

CREATE TABLE IF NOT EXISTS fato_evento_social (

    id_evento           INTEGER PRIMARY KEY AUTOINCREMENT,
    id_tipo_evento      TEXT    NOT NULL,
    id_loteamento       TEXT,
    id_nucleo           TEXT,
    id_rp               TEXT,
    id_municipio        TEXT    DEFAULT '3519071',
    data_evento         TEXT    NOT NULL,
    data_referencia     TEXT,
    valor_referencia    REAL,
    unidade_medida      TEXT,
    gravidade           TEXT    CHECK (gravidade IN ('Baixa','Media','Alta')),
    confianca_fonte     TEXT    CHECK (confianca_fonte IN ('Alta','Media','Baixa')),
    fonte_registro      TEXT,
    referencia_fonte    TEXT,
    data_registro       TEXT    DEFAULT (date('now')),
    usuario_registro    TEXT,
    ativo               INTEGER DEFAULT 1,
    observacoes         TEXT,

    FOREIGN KEY (id_tipo_evento)  REFERENCES dim_tipo_evento(id_tipo_evento),
    FOREIGN KEY (id_loteamento)   REFERENCES dim_loteamento(id_loteamento),
    FOREIGN KEY (id_nucleo)       REFERENCES dim_nucleo(id_nucleo),
    FOREIGN KEY (id_rp)           REFERENCES dim_regiao_planejamento(id_rp)
);

CREATE INDEX IF NOT EXISTS idx_evento_tipo
    ON fato_evento_social (id_tipo_evento);
CREATE INDEX IF NOT EXISTS idx_evento_loteamento
    ON fato_evento_social (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_evento_data
    ON fato_evento_social (data_evento);

INSERT OR IGNORE INTO fato_evento_social (
    id_tipo_evento, id_loteamento,
    data_evento, data_referencia,
    valor_referencia, unidade_medida,
    gravidade, confianca_fonte, fonte_registro, referencia_fonte
) VALUES
    ('EVT_SEG_PATRIMONIAL_FURTO_VEICULO', 'LOT_071',
     '2026-03-20', '2026-01/2026-03', 28, 'Ocorrências',
     'Alta', 'Media', 'Imprensa',
     'Tribuna Liberal 20/03/2026 p.09 — dados do 1o Distrito Policial'),
    ('EVT_SEG_TRAFICO_APREENSAO', 'LOT_068',
     '2026-03-19', '2026-03-19', 121, 'Ocorrências',
     'Alta', 'Alta', 'Boletim Oficial',
     'Tribuna Liberal 20/03/2026 p.09 — operação DISE Americana'),
    ('EVT_EDU_DESEMPENHO_PREMIACAO', NULL,
     '2026-03-20', '2025', 5, 'Escolas',
     'Alta', 'Alta', 'Secretaria Municipal',
     'Tribuna Liberal 20/03/2026 p.07 — id_loteamento a mapear por endereço das EMEFs'),
    ('EVT_ALI_TRANSFERENCIA_PAA', NULL,
     '2026-03-20', '2026-S1', 70, 'Famílias',
     'Media', 'Alta', 'Imprensa',
     'Tribuna Liberal 20/03/2026 p.04 — Hortolândia elegível via CADInsans');


-- =============================================================================
-- NOTA SOBRE DINAMISMO DO IVS-H
-- =============================================================================
--
--   Os pesos do IVS-H (campo peso_h em dim_variavel_ivs) devem ser
--   revisados periodicamente. Referência metodológica: NARDO et al. (OECD, 2008)
--   Documento de governança: arquitetura_dados_IVS_IBGE_Horto_v10.md
--
-- =============================================================================
-- ESQUEMA ESTRELA — VISÃO GERAL
-- =============================================================================
--
--   DIMENSÕES
--   DIM_VARIAVEL_IVS          — 16 variáveis IVS-H (IU/CH/RT)
--   DIM_LOTEAMENTO            — 141 loteamentos (átomo espacial)
--   DIM_NUCLEO                — Agregação por setor
--   DIM_REGIAO_PLANEJAMENTO   — 6 RPs (Plano Diretor)
--   DIM_FONTE_DADO            — Rastreabilidade de origem
--   DIM_TIPO_EVENTO           — Catálogo de eventos sociais
--
--   TABELAS FATO
--   FATO_VARIAVEL_IVS_LOTEAMENTO  — Variáveis brutas por loteamento/período
--   FATO_IVS_LOTEAMENTO           — Índice consolidado por loteamento/período
--   FATO_ABRANGENCIA_CRAS         — Cobertura temporal loteamento × CRAS
--   FATO_EVENTO_SOCIAL            — Ocorrências sociais por loteamento/data
--
--   Roadmap:
--   DIM_TEMPO                 — Dimensão temporal para séries históricas
--   FATO_ATENDIMENTO          — Atendimentos por família e CRAS
--   FATO_IVS_MUNICIPIO        — IVS-H municipal para comparação IPEA
--
-- =============================================================================
-- FIM DO SCHEMA v06
-- =============================================================================
