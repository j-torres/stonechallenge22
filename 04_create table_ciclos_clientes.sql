CREATE TABLE ciclos_clientes AS

WITH t2 AS
(SELECT 
	ciclos_comunicados.*,
	contrato_id_nr_documento.nr_documento 
FROM ciclos_comunicados

JOIN contrato_id_nr_documento
 ON	ciclos_comunicados.contrato_id = contrato_id_nr_documento.contrato_id)


SELECT t2.contrato_id, portfolio_clientes.*,t2.campanha, t2.nr_ciclos FROM t2
JOIN portfolio_clientes
ON portfolio_clientes.nr_documento = t2.nr_documento 
