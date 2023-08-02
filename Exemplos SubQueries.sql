WITH primeira_visita AS (
	SELECT 
	customer_id,
	MIN(visit_page_date) AS visita_1
	FROM sales.funnel
	GROUP BY customer_id
)

SELECT
	fun.visit_page_date,
	(fun.visit_page_date <> primeira_visita.visita_1) AS lead_recorrente,
	COUNT(*)
FROM sales.funnel AS fun
LEFT JOIN primeira_visita
ON fun.customer_id = primeira_visita.customer_id
GROUP BY fun.visit_page_date, lead_recorrente
ORDER BY fun.visit_page_date DESC, lead_recorrente




--