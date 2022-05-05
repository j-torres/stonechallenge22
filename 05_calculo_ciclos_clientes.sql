WITH calculo_ciclos AS
(SELECT *, 
		CASE 
		WHEN campanha = 'DSPP_CONTATO_03_45DD' 
			THEN LEAD(nr_ciclos) OVER (PARTITION BY contrato_id ORDER BY campanha) 
		ELSE 
			nr_ciclos - LEAD(nr_ciclos,1) OVER (PARTITION BY contrato_id ORDER BY campanha) 
		END AS nr_ciclos_limpo		
FROM ciclos_clientes
WHERE campanha NOT LIKE 'DSPP%'


UNION ALL

SELECT *, 
		CASE 
		WHEN campanha = 'DSPP_CONTATO_03_45DD' 
			THEN LEAD(nr_ciclos) OVER (PARTITION BY contrato_id ORDER BY campanha) 
		ELSE 
			nr_ciclos - LEAD(nr_ciclos,1) OVER (PARTITION BY contrato_id ORDER BY campanha) 
		END AS nr_ciclos_limpo		
FROM ciclos_clientes
WHERE campanha LIKE 'DSPP%'
ORDER BY contrato_id


)

SELECT contrato_id, nr_documento, tipo_empresa, cidade, estado, subsegmento, segmento, campanha, IFNULL(nr_ciclos_limpo,nr_ciclos) AS nr_ciclos_calculado
FROM calculo_ciclos
