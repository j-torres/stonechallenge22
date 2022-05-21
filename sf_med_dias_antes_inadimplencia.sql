WITH t1 AS 
(SELECT 
	contrato_id, 
	dt_ref_portfolio, 
	dt_contrato, 
	dsp, 
	CASE 
		WHEN contrato_id = lag(contrato_id) OVER (ORDER BY contrato_id,dt_ref_portfolio) THEN lag(dt_ref_portfolio) OVER (ORDER BY contrato_id,dt_ref_portfolio)
		ELSE dt_contrato 
		END AS ultima_data
FROM portfolio_geral
WHERE dsp = 1
ORDER BY contrato_id),

t2 AS (SELECT *,
	JULIANDAY(dt_ref_portfolio) - JULIANDAY(ultima_data) AS date_diff
FROM t1)

SELECT date_diff 
FROM t2
ORDER BY date_diff
LIMIT 1
OFFSET (SELECT COUNT(*) FROM t2) /2

