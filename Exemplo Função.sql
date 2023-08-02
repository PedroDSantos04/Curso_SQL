CREATE FUNCTION datediff(unidade VARCHAR, data_inicial DATE, data_final DATE)
RETURNS integer
LANGUAGE SQL
	
	AS
	
$$

SELECT 
	CASE
		WHEN unidade IN ('d', 'day', 'days') THEN (data_final - data_inicial)
		WHEN unidade IN ('w', 'week', 'weeks') THEN (data_final - data_inicial)/7
		WHEN unidade IN ('m', 'month', 'months') THEN (data_final - data_inicial)/30
		WHEN unidade IN ('y', 'year', 'years') THEN (data_final - data_inicial)/365
		END AS diferenca
		
$$

SELECT
		datediff('day', '2002-05-13', visit_page_date),
		visit_page_date,
		current_date
FROM sales.funnel
