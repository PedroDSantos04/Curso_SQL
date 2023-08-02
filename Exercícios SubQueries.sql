-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers
WITH visita AS (
SELECT 
	customer_id,
	COUNT(visit_page_date) AS contagem
	FROM sales.funnel
	GROUP BY customer_id
)
SELECT 
	cus.*,
	visita.contagem AS visitas
FROM sales.customers AS cus
LEFT JOIN visita
ON cus.customer_id = visita.customer_id
GROUP BY cus.customer_id, visitas