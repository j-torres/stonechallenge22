SELECT 	
	tipo_acao,
	acao,
	CASE 
		WHEN (dsp = 5 AND acao = 'campanhaobservacao') THEN 'DSP_CONTATO_01_05DD'
		WHEN (dsp = 10 AND acao = 'campanhaparcelamento') THEN 'DSP_CONTATO_02_10DD'
		WHEN (dsp = 15 AND acao = 'campanhaboletoquitado') THEN 'DSP_CONTATO_03_15DD'
		WHEN (dsp = 30 AND acao = 'campanhaprenegativacao') THEN 'DSP_CONTATO_04_30DD'
		WHEN (dsp = 60 AND acao = 'campanhanegativacao') THEN 'DSP_CONTATO_05_60DD'
		WHEN (dsp = 90 AND acao = 'campanhaboletoquitado') THEN 'DSP_CONTATO_06_90DD'
		WHEN (dspp = 15 AND acao = 'campanhaobservacao') THEN 'DSPP_CONTATO_01_15DD'
		WHEN (dspp = 30 AND acao = 'campanhaparcelamento') THEN 'DSPP_CONTATO_02_30DD'
		WHEN (dspp = 45 AND acao = 'campanhaboletoquitado') THEN 'DSPP_CONTATO_03_45DD'
	END AS campanha,
	status,
	count(status)
	
FROM portfolio_geral

JOIN portfolio_comunicados 
	ON portfolio_geral.contrato_id = portfolio_comunicados.contrato_id
	AND portfolio_geral.dt_ref_portfolio = portfolio_comunicados.dt_ref_portfolio
	
GROUP BY campanha, acao, tipo_acao, status	
order by acao, campanha,count(status) 