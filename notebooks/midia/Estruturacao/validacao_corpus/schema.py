"""Contrato canônico e vocabulários da v10.5."""

SCHEMA = [
    "id_evento", "data_publicacao", "fonte", "titulo", "pagina", "municipio",
    "localidade", "tipo_camada", "dimensao_analitica", "tipo_relacao_variavel",
    "codigo_variavel", "nivel_criticidade", "observacao", "aproximacao_variavel",
    "nota_analista", "cod_loteamento", "nivel_confianca_loteamento",
    "papel_no_ciclo", "id_caso_pressao", "entra_ipst",
]

OBRIGATORIOS = {
    "id_evento", "data_publicacao", "fonte", "titulo", "pagina", "municipio",
    "localidade", "tipo_camada", "tipo_relacao_variavel", "nivel_criticidade",
    "observacao", "cod_loteamento", "nivel_confianca_loteamento",
    "papel_no_ciclo", "entra_ipst",
}

VOCABULARIOS = {
    "tipo_camada": {"IVS", "GOVERNANCA", "PRESSAO_SOCIAL", "CONTEXTO"},
    "dimensao_analitica": {"capital_humano", "infraestrutura_urbana", "renda_trabalho", "multidimensional"},
    "tipo_relacao_variavel": {"direta", "indireta", "contextual", "latente"},
    "nivel_criticidade": {"baixa", "media", "alta", "alerta"},
    "observacao": {
        "sinal_smids_ext", "multiplos_loteamentos", "impacto_latente",
        "impacto_regional_hortolandia", "aproximacao_variavel", "caso_ilustrativo",
        "interface_ch", "interface_rt", "interface_iu", "dado_auditavel",
        "fora_escopo_smids", "acao_institucional_smids", "duvida_metodologica",
        "tarefa_pendente", "contexto_sociopolitico",
    },
    "nivel_confianca_loteamento": {"alto", "medio", "baixo"},
    "papel_no_ciclo": {"emergencia", "resposta", "agravamento", "sinal_desfecho", "nao_aplicavel"},
    "entra_ipst": {"sim", "avaliar", "nao"},
}

# Somente aliases cujo destino é inequívoco. Demais valores seguem para revisão.
ALIASES = {
    "dimensao_analitica": {"CH": "capital_humano", "IU": "infraestrutura_urbana", "RT": "renda_trabalho"},
    "tipo_relacao_variavel": {"contexto": "contextual"},
    # "informativo" exige decisão: não implica necessariamente criticidade baixa.
    "nivel_criticidade": {"critico": "alerta"},
    "nivel_confianca_loteamento": {"alta": "alto", "media": "medio", "baixa": "baixo"},
    "papel_no_ciclo": {"standalone": "nao_aplicavel"},
    "entra_ipst": {
        "sim - Condicao A": "sim", "sim - Condicao B": "sim",
        "nao - R24": "nao", "nao - R14/R24": "nao", "nao - IVS": "nao",
    },
}

CAMPOS_RESULTADO = [
    "categoria", "arquivo", "linha", "id_evento", "campo", "valor_encontrado",
    "valor_proposto", "regra", "causa_raiz", "mensagem", "registros_afetados",
]
