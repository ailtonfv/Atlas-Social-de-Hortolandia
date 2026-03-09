-- =============================================================================
-- schema_IVS.sql
-- Modelagem lógica da DIM_VARIAVEL_IVS
-- Gerado a partir de: dim_variavel_IVS.md (v01r2 — 2026-03-09)
-- Responsável: Ailton Vendramini / Claude (Anthropic)
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
-- SGBD alvo: SQLite (fase MVP)
-- =============================================================================

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- TABELA: dim_variavel_ivs
-- Registra as 16 variáveis do IVS (IPEA/2015) com disponibilidade municipal
-- e pesos calibrados para o IVS-H (Hortolândia).
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS dim_variavel_ivs (

    -- Identificação
    id_variavel         TEXT    NOT NULL,   -- PK semântica: IVS001 … IVS016
    cod_variavel        TEXT    NOT NULL,   -- Código da dimensão: IU_01, CH_01, RT_01…

    -- Conteúdo
    nome_variavel       TEXT    NOT NULL,
    descricao           TEXT,

    -- Classificação metodológica
    dimensao_ivs        TEXT    NOT NULL,   -- infraestrutura_urbana | capital_humano | renda_trabalho
    nivel_analise       TEXT    NOT NULL,   -- Pessoa | Família/Domicílio | Loteamento / RP

    -- Pesos
    peso_ipea           REAL    NOT NULL DEFAULT 0.0625,  -- 1/16 — peso uniforme IPEA
    peso_h              REAL,                             -- peso IVS-H — a calibrar com dados reais

    -- Disponibilidade municipal
    fonte_municipal     TEXT,
    disponivel          TEXT    NOT NULL,   -- S | N | Parcial
    prazo_obtencao      TEXT    NOT NULL,   -- Imediato | Curto prazo | Médio prazo | Roadmap

    -- Metadados
    observacoes         TEXT,

    -- Constraints
    PRIMARY KEY (id_variavel),

    CHECK (dimensao_ivs IN (
        'infraestrutura_urbana',
        'capital_humano',
        'renda_trabalho'
    )),

    CHECK (nivel_analise IN (
        'Pessoa',
        'Família/Domicílio',
        'Loteamento / RP'
    )),

    CHECK (disponivel IN ('S', 'N', 'Parcial')),

    CHECK (prazo_obtencao IN (
        'Imediato',
        'Curto prazo',
        'Médio prazo',
        'Roadmap'
    )),

    CHECK (peso_ipea BETWEEN 0.0 AND 1.0),
    CHECK (peso_h IS NULL OR peso_h BETWEEN 0.0 AND 1.0)
);

-- =============================================================================
-- CARGA INICIAL — 16 variáveis IVS (IPEA/2015)
-- Pesos IVS-H deixados NULL — a calibrar após análise empírica dos dados reais
-- =============================================================================

-- -----------------------------------------------------------------------
-- DIMENSÃO 1 — Infraestrutura Urbana (3 variáveis)
-- -----------------------------------------------------------------------

INSERT INTO dim_variavel_ivs VALUES (
    'IVS001', 'IU_01',
    'Percentual de pessoas em domicílios com abastecimento de água e esgotamento sanitário inadequados',
    'Variável de infraestrutura básica — acesso a saneamento no domicílio.',
    'infraestrutura_urbana', 'Família/Domicílio',
    0.0625, NULL,
    'IBGE Censo 2022 / SAAE Hortolândia',
    'Parcial', 'Curto prazo',
    'Cobertura de água em Hortolândia é razoável — variável pode ter baixo poder discriminatório local. Confirmar com SAAE.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS002', 'IU_02',
    'Percentual da população que vive em domicílios urbanos sem serviço de coleta de lixo',
    'Variável de infraestrutura básica — acesso ao serviço de coleta domiciliar.',
    'infraestrutura_urbana', 'Família/Domicílio',
    0.0625, NULL,
    'IBGE Censo 2022 / Secretaria de Serviços Urbanos',
    'Parcial', 'Curto prazo',
    'Cobertura de coleta também elevada — mesmo raciocínio da IU_01. Peso local pode ser reduzido no IVS-H.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS003', 'IU_03',
    'Percentual de pessoas em domicílios com renda per capita inferior a 1/2 SM e que gastam mais de 1 hora até o trabalho',
    'Variável que combina restrição de renda com dificuldade de mobilidade urbana.',
    'infraestrutura_urbana', 'Pessoa',
    0.0625, NULL,
    'CadÚnico (renda) + IBGE Censo 2022 (tempo de deslocamento)',
    'Parcial', 'Médio prazo',
    'Renda disponível no CadÚnico. Tempo de deslocamento requer Censo 2022 ou pesquisa local. Hortolândia tem polo de emprego próprio — variável estratégica.'
);

-- -----------------------------------------------------------------------
-- DIMENSÃO 2 — Capital Humano (8 variáveis)
-- -----------------------------------------------------------------------

INSERT INTO dim_variavel_ivs VALUES (
    'IVS004', 'CH_01',
    'Mortalidade até 1 ano de idade',
    'Taxa de mortalidade infantil — proxy de acesso e qualidade dos serviços de saúde.',
    'capital_humano', 'Pessoa',
    0.0625, NULL,
    'Secretaria Municipal de Saúde / DATASUS',
    'Parcial', 'Curto prazo',
    'Dado disponível no DATASUS. Secretaria de Saúde pode fornecer série histórica local. Solicitar via interlocução intersetorial.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS005', 'CH_02',
    'Percentual de crianças de 0 a 5 anos que não frequentam a escola',
    'Acesso à educação infantil — exclusão precoce do sistema educacional.',
    'capital_humano', 'Pessoa',
    0.0625, NULL,
    'Secretaria de Educação / CadÚnico',
    'Parcial', 'Curto prazo',
    'CadÚnico registra frequência escolar das crianças do cadastro. Secretaria de Educação tem dados de matrícula. Cruzamento possível.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS006', 'CH_03',
    'Percentual de crianças de 6 a 14 anos que não frequentam a escola',
    'Evasão escolar na faixa do ensino fundamental — risco de reprodução intergeracional da pobreza.',
    'capital_humano', 'Pessoa',
    0.0625, NULL,
    'Secretaria de Educação / CadÚnico',
    'Parcial', 'Curto prazo',
    'Idem CH_02. Evasão escolar é dado estratégico — interface direta com CRAS e Conselho Tutelar.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS007', 'CH_04',
    'Percentual de mulheres de 10 a 17 anos que tiveram filhos',
    'Gravidez na adolescência — marcador de vulnerabilidade e ruptura do ciclo educacional.',
    'capital_humano', 'Pessoa',
    0.0625, NULL,
    'Secretaria de Saúde (registros de parto) / CadÚnico',
    'Parcial', 'Médio prazo',
    'CadÚnico registra composição familiar e idade dos membros. Dado de parto adolescente disponível na Saúde.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS008', 'CH_05',
    'Percentual de mães chefes de família, sem fundamental completo e com pelo menos um filho menor de 15 anos',
    'Indicador composto de chefia feminina vulnerável — combina escolaridade, renda e dependência infantil.',
    'capital_humano', 'Família/Domicílio',
    0.0625, NULL,
    'CadÚnico',
    'S', 'Imediato',
    'Totalmente disponível no CadÚnico — escolaridade, composição familiar, chefe de família e idade dos filhos são campos padrão. Indicador de alta relevância para Hortolândia.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS009', 'CH_06',
    'Taxa de analfabetismo da população de 15 anos ou mais',
    'Analfabetismo adulto — barreira estrutural à inserção produtiva e ao exercício da cidadania.',
    'capital_humano', 'Pessoa',
    0.0625, NULL,
    'CadÚnico / IBGE Censo 2022',
    'S', 'Imediato',
    'Disponível no CadÚnico — escolaridade é campo obrigatório. Censo 2022 permite validação e expansão para população fora do cadastro.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS010', 'CH_07',
    'Percentual de crianças que vivem em domicílios em que nenhum morador tem ensino fundamental completo',
    'Ambiente educacional domiciliar — captura reprodução intergeracional da baixa escolaridade.',
    'capital_humano', 'Família/Domicílio',
    0.0625, NULL,
    'CadÚnico',
    'S', 'Imediato',
    'Totalmente disponível no CadÚnico — escolaridade de todos os membros + composição por faixa etária. Um dos indicadores mais poderosos para detectar reprodução intergeracional da pobreza.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS011', 'CH_08',
    'Percentual de pessoas de 15 a 24 anos que não estudam, não trabalham e possuem renda per capita igual ou inferior a 1/2 SM',
    'Indicador de geração nem-nem em situação de vulnerabilidade econômica — exclusão simultânea do sistema educacional e produtivo.',
    'capital_humano', 'Pessoa',
    0.0625, NULL,
    'CadÚnico + CAGED',
    'Parcial', 'Curto prazo',
    'CadÚnico fornece renda e situação de estudo. Vínculo formal via CAGED. Jovens fora do CadÚnico são ponto cego. Indicador estratégico — captura geração nem-nem por loteamento e RP.'
);

-- -----------------------------------------------------------------------
-- DIMENSÃO 3 — Renda e Trabalho (5 variáveis)
-- -----------------------------------------------------------------------

INSERT INTO dim_variavel_ivs VALUES (
    'IVS012', 'RT_01',
    'Proporção de pessoas com renda domiciliar per capita igual ou inferior a 1/2 SM',
    'Pobreza de renda — indicador central de privação econômica no domicílio.',
    'renda_trabalho', 'Família/Domicílio',
    0.0625, NULL,
    'CadÚnico',
    'S', 'Imediato',
    'Totalmente disponível no CadÚnico — renda per capita é campo central do cadastro. Ponto de entrada natural para o IVS-H.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS013', 'RT_02',
    'Taxa de desocupação da população de 18 anos ou mais',
    'Desemprego adulto — ausência de vínculo ocupacional como indicador de vulnerabilidade estrutural.',
    'renda_trabalho', 'Pessoa',
    0.0625, NULL,
    'CadÚnico + CAGED',
    'Parcial', 'Curto prazo',
    'CadÚnico registra situação ocupacional declarada. CAGED fornece vínculo formal. Informalidade é ponto cego estrutural — MEI não aparece no CAGED.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS014', 'RT_03',
    'Percentual de pessoas de 18 anos ou mais sem fundamental completo e em ocupação informal',
    'Intersecção entre baixa escolaridade e precariedade do vínculo de trabalho.',
    'renda_trabalho', 'Pessoa',
    0.0625, NULL,
    'CadÚnico',
    'Parcial', 'Curto prazo',
    'Escolaridade disponível no CadÚnico. Informalidade depende de declaração — subestimação provável. Cruzamento com CAGED identifica quem tem vínculo formal.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS015', 'RT_04',
    'Percentual de pessoas em domicílios com renda per capita igual ou inferior a 1/2 SM e dependentes de idosos',
    'Fragilidade da renda do idoso como sustentáculo familiar — captura famílias em situação de dependência invertida.',
    'renda_trabalho', 'Família/Domicílio',
    0.0625, NULL,
    'CadÚnico',
    'S', 'Imediato',
    'Totalmente disponível no CadÚnico — renda per capita + composição familiar por faixa etária. Captura fragilidade da renda do idoso como sustentáculo familiar.'
);

INSERT INTO dim_variavel_ivs VALUES (
    'IVS016', 'RT_05',
    'Taxa de atividade das pessoas de 10 a 14 anos de idade',
    'Trabalho infantil — inserção precoce no mercado de trabalho como marcador de violação de direitos.',
    'renda_trabalho', 'Pessoa',
    0.0625, NULL,
    'CadÚnico / IBGE Censo 2022',
    'Parcial', 'Curto prazo',
    'Trabalho infantil — CadÚnico pode capturar via declaração de ocupação de crianças. Censo 2022 é fonte mais robusta. Interface direta com CREAS e Conselho Tutelar.'
);

-- =============================================================================
-- VERIFICAÇÃO DE INTEGRIDADE
-- Execute após a carga para confirmar 16 registros e distribuição correta
-- =============================================================================

-- SELECT COUNT(*) AS total_variaveis FROM dim_variavel_ivs;
-- -- Esperado: 16

-- SELECT dimensao_ivs, COUNT(*) AS qtd
-- FROM dim_variavel_ivs
-- GROUP BY dimensao_ivs
-- ORDER BY dimensao_ivs;
-- -- Esperado: capital_humano=8 | infraestrutura_urbana=3 | renda_trabalho=5

-- SELECT disponivel, COUNT(*) AS qtd
-- FROM dim_variavel_ivs
-- GROUP BY disponivel;
-- -- Esperado: S=5 | Parcial=11

-- SELECT prazo_obtencao, COUNT(*) AS qtd
-- FROM dim_variavel_ivs
-- GROUP BY prazo_obtencao
-- ORDER BY prazo_obtencao;
-- -- Esperado: Imediato=5 | Curto prazo=8 | Médio prazo=2 (IVS003 + IVS007)

-- =============================================================================
-- FIM DO ARQUIVO
-- Próximo passo: vincular esta tabela a FATO_IVS_TERRITORIAL
-- quando o cálculo por loteamento estiver modelado.
-- =============================================================================

