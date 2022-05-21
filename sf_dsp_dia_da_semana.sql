WITH t1 AS (

SELECT contrato_id, dt_ref_portfolio, dsp, strftime('%w',dt_ref_portfolio) AS dia_semana from portfolio_geral

ORDER BY contrato_id, dt_ref_portfolio)

SELECT dsp,
CASE 
	WHEN dia_semana = '0' THEN 'DOM'
	WHEN dia_semana = '1' THEN 'SEG'
	WHEN dia_semana = '2' THEN 'TER'
	WHEN dia_semana = '3' THEN 'QUA'
	WHEN dia_semana = '4' THEN 'QUI'
	WHEN dia_semana = '5' THEN 'SEX'
	WHEN dia_semana = '6' THEN 'SAB'
END AS dia_semana_port,
count(dia_semana)
FROM t1
GROUP BY dsp,dia_semana
ORDER BY dsp