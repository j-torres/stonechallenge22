SELECT 
	dsp, 
	count(contrato_id) AS nr_de_contratos,
	count(contrato_id) - lead(count(contrato_id)) OVER (ORDER BY dsp) AS pagamentos_neste_dia
		
FROM portfolio_geral
WHERE dsp != 0
GROUP BY dsp