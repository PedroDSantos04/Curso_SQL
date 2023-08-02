SELECT 
	EXTRACT('dow' FROM visit_page_date) AS dia_semana,
	CASE 
		WHEN EXTRACT('dow' FROM visit_page_date) = 0 THEN 'Domingo'
		WHEN EXTRACT('dow' FROM visit_page_date) = 1 THEN 'Segunda'
		WHEN EXTRACT('dow' FROM visit_page_date) = 2 THEN 'Terça'
		WHEN EXTRACT('dow' FROM visit_page_date) = 3 THEN 'Quarta'
		WHEN EXTRACT('dow' FROM visit_page_date) = 4 THEN 'Quinta'
		WHEN EXTRACT('dow' FROM visit_page_date) = 5 THEN 'Sexta'
		WHEN EXTRACT('dow' FROM visit_page_date) = 6 THEN 'Sábado'
		ELSE null END AS "Dia da semana",
	COUNT(*) AS "visitas"
FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY dia_semana
ORDER BY dia_semana