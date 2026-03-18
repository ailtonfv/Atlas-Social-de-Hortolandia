-- =============================================================================
-- nota_tecnica_fato_ivs_loteamento_v04.sql
-- Nota técnica: modelagem da tabela de fatos do IVS-H por loteamento
-- Versão: v04 — "18/03/2026"
-- Responsável: Ailton Vendramini
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
-- =============================================================================
-- v01 — "10/03/2026" — Criação
-- v02 — "10/03/2026" — Renomeação: fato_ivs_territorial → fato_ivs_loteamento
--                      Alinhamento com hierarquia Loteamento → Núcleo → RP
-- v03 — "10/03/2026" — dim_fonte_dado criada; carga inicial de fontes conhecidas
-- v04 — "18/03/2026" — FK fonte_dado referenciando dim_fonte_dado
--                      Convenção fechada para periodo_referencia
--                      Documentação de unidade de valor_percentual (0-100)
--                      flag_oficial adicionado
--                      id_nucleo e id_rp: decisão registrada (armazenados por
--                        conveniência, com nota de consistência obrigatória)
--                      Tabela fato_ivs_loteamento renomeada para
--                        fato_variavel_ivs_loteamento (separação semântica:
--                        variáveis brutas vs. índice consolidado)
--                      Tabela fato_ivs_loteamento reservada para índice final
--                      RT_06 e RT_07 incluídos na carga de dim_fonte_dado
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
--   IU_01 e IU_02 variam conforme obras são implantadas.
--   O mesmo vale para variáveis CadÚnico (contínua) e CAGED (mensal).
--   A DIM_VARIAVEL_IVS define O QUE medir — não QUANDO nem QUANTO.
--   Os valores reais, por loteamento e período, pertencem a
--   FATO_VARIAVEL_IVS_LOTEAMENTO.
--
-- =============================================================================
-- HIERARQUIA ANALÍTICA DO PROJETO
-- =============================================================================
--
--   Loteamento → Núcleo (área de abrangência CRAS) → Região de Planejamento
--
--   id_loteamento  = unidade mínima de análise (141 loteamentos oficiais)
--   id_nucleo      = agregação por CRAS (7 núcleos)
--   id_rp          = agregação por Região de Planejamento (6 RPs)
--
-- =============================================================================
-- SEPARAÇÃO SEMÂNTICA DE TABELAS FATO
-- =============================================================================
--
-- Este arquivo define DUAS tabelas fato semanticamente distintas:
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
-- A separação evita ambiguidade semântica e facilita auditoria:
-- é sempre possível rastrear do índice final até a variável bruta
-- que o originou.
--
-- =============================================================================


-- =============================================================================
-- CONVENÇÃO OBRIGATÓRIA: periodo_referencia
-- =============================================================================
--
-- O campo periodo_referencia deve seguir exclusivamente os formatos abaixo.
-- Qualquer valor fora desses formatos é inválido e deve ser rejeitado
-- na validação de carga.
--
--   Formato   | Exemplo       | Uso
--   ----------+---------------+-------------------------------------------
--   YYYY      | '2022'        | Dados anuais (Censo, SNIS, CAGED anual)
--   YYYY-MM   | '2025-12'     | Dados mensais (CadÚnico, CAGED mensal)
--   YYYY-S1   | '2025-S1'     | Primeiro semestre
--   YYYY-S2   | '2025-S2'     | Segundo semestre
--
-- Formatos PROIBIDOS (geram inconsistência na série histórica):
--   2025/12   dez-2025   2025_sem1   DEZ2025   dezembro2025
--
-- =============================================================================
-- CONVENÇÃO OBRIGATÓRIA: valor_percentual
-- =============================================================================
--
-- Armazenar sempre como percentual legível:
--   3.6  para  3,6%   (CORRETO)
--   0.036        (ERRADO — escala fracionária)
--
-- Exemplo: IU_02 com 3,6% de domicílios sem coleta → valor_percentual = 3.6
-- Isso facilita leitura direta, relatórios e dashboards sem conversão.
--
-- =============================================================================
-- DECISÃO ARQUITETURAL: id_nucleo e id_rp em fato_variavel_ivs_loteamento
-- =============================================================================
--
-- id_nucleo e id_rp são armazenados diretamente na tabela fato por
-- conveniência analítica — evita joins recorrentes em consultas de
-- agregação por área de CRAS ou Região de Planejamento.
--
-- CONDIÇÃO OBRIGATÓRIA: id_nucleo e id_rp devem ser sempre consistentes
-- com a hierarquia oficial registrada em dim_loteamento.
-- Qualquer divergência entre o valor armazenado e a hierarquia da dimensão
-- é um erro de integridade e deve ser corrigido na carga.
--
-- Alternativa normalizada (não adotada no MVP):
--   Armazenar apenas id_loteamento e derivar id_nucleo e id_rp por JOIN.
--   Essa opção é metodologicamente mais limpa mas penaliza consultas
--   analíticas frequentes. Pode ser adotada em versão futura com
--   PostgreSQL e views materializadas.
--
-- =============================================================================


-- =============================================================================
-- TABELA DE FONTES — DIM_FONTE_DADO
-- =============================================================================

CREATE TABLE IF NOT EXISTS dim_fonte_dado (

    id_fonte            TEXT    PRIMARY KEY,
    -- Identificador canônico da fonte.
    -- Convenção: SIGLA_ANO ou SIGLA_PERIODICIDADE
    -- Exemplos válidos: 'SNIS_2022', 'CADUNICO_DEZ2025', 'SIDRA_CENSO2022'
    -- Proibido: espaços, acentos, barras, letras minúsculas.

    nome_fonte          TEXT    NOT NULL,
    orgao_responsavel   TEXT,
    periodicidade       TEXT,
    -- Valores esperados: Anual | Semestral | Mensal | Decenal | Eventual

    url_acesso          TEXT,
    data_ultima_carga   TEXT,   -- ISO 8601: YYYY-MM-DD
    observacoes         TEXT
);

-- Carga inicial de fontes conhecidas
INSERT OR IGNORE INTO dim_fonte_dado VALUES
    ('SNIS_2022',
     'Sistema Nacional de Informações sobre Saneamento',
     'Ministério das Cidades', 'Anual',
     'https://app4.mdr.gov.br/serieHistorica/', '2026-03-10',
     'Indicadores de água e esgoto por município. IU_01 e IU_02.'),

    ('CADUNICO_DEZ2025',
     'Cadastro Único para Programas Sociais — extração dezembro/2025',
     'Ministério do Desenvolvimento e Assistência Social', 'Contínua',
     NULL, '2026-03-10',
     'Fonte principal de CH e RT. 72.424 pessoas cadastradas em Hortolândia '
     '(dez/2025). Arquivo: /tmp/cecad/tudo.csv na máquina Debian.'),

    ('CENSO2022_SETOR',
     'Censo Demográfico 2022 — Agregados por Setores Censitários',
     'IBGE', 'Decenal',
     'https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/', '2026-03-10',
     'IU_01, IU_02 e variáveis CH/RT do Censo. Nota: renda domiciliar per '
     'capita por setor não publicada — apenas V06004 (rendimento médio do '
     'responsável). CadÚnico é fonte primária de RT_01.'),

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
     'Fonte empírica para calibração do peso IU no IVS-H.'),

    ('SIDRA_CENSO2022',
     'SIDRA — Sistema IBGE de Recuperação Automática — Censo 2022',
     'IBGE', 'Decenal',
     'https://sidra.ibge.gov.br', '2026-03-18',
     'Tabelas de deslocamento intermunicipal: pessoas que trabalham fora do '
     'município (RT_06) e pessoas que estudam fora do município (RT_07). '
     'Dados disponíveis em tabela agregada — não requer microdados.');


-- =============================================================================
-- TABELA FATO 1 — FATO_VARIAVEL_IVS_LOTEAMENTO
-- Armazena o valor bruto/percentual de cada variável IVS-H
-- por loteamento e período de referência.
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_variavel_ivs_loteamento (

    -- Chave primária
    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,

    -- Chaves de dimensão
    id_variavel         TEXT    NOT NULL,
    -- FK → dim_variavel_ivs
    -- Valores esperados: IVS001–IVS016, IVS_L01, IVS_L02

    id_loteamento       TEXT    NOT NULL,
    -- FK → dim_loteamento (unidade mínima de análise)

    id_nucleo           TEXT,
    -- FK → dim_nucleo
    -- Armazenado por conveniência analítica.
    -- DEVE ser consistente com a hierarquia de dim_loteamento.

    id_rp               TEXT,
    -- FK → dim_regiao_planejamento
    -- Mesmo critério de id_nucleo.

    -- Dimensão temporal
    periodo_referencia  TEXT    NOT NULL,
    -- Convenção fechada (ver seção acima):
    -- YYYY | YYYY-MM | YYYY-S1 | YYYY-S2

    data_extracao       TEXT    NOT NULL,
    -- Data em que o dado foi coletado. Formato: ISO 8601 (YYYY-MM-DD)

    -- Fonte do dado
    id_fonte            TEXT    NOT NULL,
    -- FK → dim_fonte_dado (id_fonte)
    -- Substitui o campo texto livre fonte_dado das versões anteriores.
    -- Garante padronização e rastreabilidade: a mesma fonte nunca
    -- aparece com duas grafias diferentes.

    versao_fonte        TEXT,
    -- Versão específica da extração quando relevante.
    -- Exemplo: 'SNIS_2022', 'CadUnico_dez2025'
    -- Pode replicar id_fonte ou detalhar uma extração específica.

    -- Valores
    valor_absoluto      REAL,
    -- Numerador da variável.
    -- Exemplo: número de domicílios sem coleta de lixo no loteamento.

    valor_denominador   REAL,
    -- Denominador da variável.
    -- Exemplo: total de domicílios no loteamento.

    valor_percentual    REAL,
    -- Resultado: valor_absoluto / valor_denominador * 100
    -- UNIDADE: percentual legível — armazenar 3.6 para 3,6%.
    -- Nunca armazenar como proporção (0.036).
    -- Quando a fonte já fornece o percentual diretamente,
    -- preencher apenas este campo.

    -- Cobertura da fonte
    cobertura_cadastral REAL,
    -- Percentual da população do loteamento coberta pela fonte.
    -- Exemplo: CadÚnico cobre aprox. 30% da população total.
    -- Importante para ponderar confiança do dado.

    -- Flags de qualidade
    flag_estimado       INTEGER DEFAULT 0,
    -- 1 = valor estimado ou interpolado (não medido diretamente)
    -- 0 = valor medido

    flag_revisado       INTEGER DEFAULT 0,
    -- 1 = dado revisado após publicação inicial
    -- 0 = dado original sem revisão

    flag_oficial        INTEGER DEFAULT 1,
    -- 1 = dado publicado oficialmente por órgão responsável
    -- 0 = dado derivado internamente (cálculo, estimativa, proxy)
    -- Diferença: um dado pode ser medido (flag_estimado=0) mas
    -- ainda assim não ser publicação oficial (flag_oficial=0)
    -- quando produzido internamente a partir de cruzamentos.

    observacoes         TEXT,

    -- Integridade referencial
    FOREIGN KEY (id_variavel) REFERENCES dim_variavel_ivs(id_variavel),
    FOREIGN KEY (id_fonte)    REFERENCES dim_fonte_dado(id_fonte),

    -- Unicidade: uma variável, um loteamento, um período, uma fonte
    UNIQUE (id_variavel, id_loteamento, periodo_referencia, id_fonte)
);


-- =============================================================================
-- TABELA FATO 2 — FATO_IVS_LOTEAMENTO
-- Armazena o índice IVS-H consolidado por loteamento e período.
-- Calculado a partir de fato_variavel_ivs_loteamento após
-- normalização e aplicação de pesos.
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_ivs_loteamento (

    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,

    id_loteamento       TEXT    NOT NULL,
    id_nucleo           TEXT,
    id_rp               TEXT,

    periodo_referencia  TEXT    NOT NULL,
    -- Mesma convenção de fato_variavel_ivs_loteamento

    data_calculo        TEXT    NOT NULL,
    -- Data em que o índice foi calculado. ISO 8601 (YYYY-MM-DD)

    versao_calculo      TEXT,
    -- Identificador da versão do cálculo.
    -- Exemplo: 'IVS-H_PARCIAL_v1', 'IVS-H_EXPANDIDO_v2'

    -- Índice por dimensão (normalizados, 0 a 1)
    ivsh_infraestrutura_urbana  REAL,
    ivsh_capital_humano         REAL,
    ivsh_renda_trabalho         REAL,

    -- Índice geral (0 a 1)
    ivsh_geral          REAL,

    -- Número de variáveis usadas no cálculo
    n_variaveis_iu      INTEGER,
    n_variaveis_ch      INTEGER,
    n_variaveis_rt      INTEGER,
    n_variaveis_total   INTEGER,

    -- Flags
    flag_parcial        INTEGER DEFAULT 0,
    -- 1 = índice calculado com subconjunto de variáveis (MVP parcial)
    -- 0 = índice calculado com conjunto completo de variáveis

    observacoes         TEXT,

    FOREIGN KEY (id_loteamento) REFERENCES dim_loteamento(id_loteamento),

    UNIQUE (id_loteamento, periodo_referencia, versao_calculo)
);


-- =============================================================================
-- ÍNDICES — fato_variavel_ivs_loteamento
-- =============================================================================

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
-- ÍNDICES — fato_ivs_loteamento
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_fil_loteamento
    ON fato_ivs_loteamento (id_loteamento);

CREATE INDEX IF NOT EXISTS idx_fil_periodo
    ON fato_ivs_loteamento (periodo_referencia);

CREATE INDEX IF NOT EXISTS idx_fil_nucleo
    ON fato_ivs_loteamento (id_nucleo);


-- =============================================================================
-- NOTA SOBRE DINAMISMO DO IVS-H
-- =============================================================================
--
-- Os pesos do IVS-H (campo peso_h em dim_variavel_ivs) devem ser
-- revisados periodicamente conforme:
--
-- 1. Novas obras de infraestrutura (IU_01, IU_02):
--    Se cobertura de esgoto cair abaixo de 90% em algum loteamento,
--    IU_01 readquire poder discriminatório.
--    Monitorar via SNIS (publicação anual).
--
-- 2. Atualização do CadÚnico (variáveis CH e RT):
--    Recomendado: recalcular IVS-H a cada extração semestral.
--
-- 3. Novos dados do Censo IBGE:
--    Próximo Censo: aprox. 2032.
--    Até lá, Censo 2022 é referência estática para IU.
--
-- FLUXO DE REVISÃO DE PESOS:
--   fato_variavel_ivs_loteamento (novos valores)
--       → análise de variância por loteamento
--       → revisão de peso_h em dim_variavel_ivs
--       → versionamento no log de dim_variavel_IVS.md
--
-- =============================================================================
-- EXEMPLO DE CARGA — RT_01 com CadÚnico dez/2025
-- =============================================================================

-- INSERT INTO fato_variavel_ivs_loteamento (
--     id_variavel, id_loteamento, id_nucleo, id_rp,
--     periodo_referencia, data_extracao,
--     id_fonte, versao_fonte,
--     valor_absoluto, valor_denominador, valor_percentual,
--     cobertura_cadastral, flag_estimado, flag_oficial, observacoes
-- ) VALUES
--     ('IVS012', 'LOT_001', 'NUC_AMANDA', 'RP_01',
--      '2025-12', '2026-03-18',
--      'CADUNICO_DEZ2025', 'CadUnico_dez2025',
--      412,    -- pessoas com renda per capita <= meio SM no loteamento
--      980,    -- total de pessoas cadastradas no loteamento
--      42.04,  -- 412/980*100 = 42,04% — armazenar como 42.04
--      31.2,   -- CadÚnico cobre 31,2% da pop. total do loteamento
--      0, 0,   -- não estimado; não é publicação oficial — dado interno
--      'IVS-H parcial v1 — CadÚnico dez/2025');

-- =============================================================================
-- EXEMPLO DE CARGA — IU_02 com dado histórico SNIS (municipal agregado)
-- =============================================================================

-- INSERT INTO fato_variavel_ivs_loteamento (
--     id_variavel, id_loteamento, periodo_referencia,
--     data_extracao, id_fonte, versao_fonte,
--     valor_percentual, cobertura_cadastral,
--     flag_estimado, flag_oficial, observacoes
-- ) VALUES
--     ('IVS002', 'MUNICIPIO_HORTOLANDIA', '2020',
--      '2026-03-10', 'SABESP_SNIS', 'SNIS_2020',
--      3.6,    -- 100% - 96,4% = 3,6% sem coleta de esgoto
--      100.0,  -- SNIS cobre 100% da população servida pela SABESP
--      0, 1,   -- não estimado; publicação oficial
--      'Dado municipal agregado. Desagregação por loteamento requer Censo 2022.');

-- =============================================================================
-- FIM DA NOTA TÉCNICA v04
--
-- Próximos passos:
-- 1. Criar dim_loteamento e dim_nucleo para habilitar cálculo por loteamento.
-- 2. Implementar script de carga RT_01 a partir de /tmp/cecad/tudo.csv.
-- 3. Extrair RT_06 e RT_07 do SIDRA para loteamentos de Hortolândia.
-- 4. Calcular e inserir IVS-H parcial v1 em fato_ivs_loteamento.
-- =============================================================================
