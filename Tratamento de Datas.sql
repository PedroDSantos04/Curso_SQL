--calcule quantas visitas ocorreram por mês no site da empresa
SELECT 
	date_trunc('month', visit_page_date)::date AS visit_page_month,
	COUNT(*)
FROM sales.funnel
GROUP BY visit_page_month
ORDER BY visit_page_month DESC

--calcule o dia da semana que o site mais recebe visitas

SELECT
	EXTRACT('dow' FROM visit_page_date) AS dia_semana,
	COUNT(*)
FROM sales.funnel
GROUP BY dia_semana
ORDER BY dia_semana

-- calcule a diferença entre hoje e a data na tabela, em dias, semanas, meses e anos

SELECT 
		visit_page_date,
		(current_date - visit_page_date) AS dias_diferença,
		(current_date - visit_page_date)/7 AS semanas_diferença,
		(current_date - visit_page_date)/30 AS meses_diferença,
		(current_date - visit_page_date)/365 AS anos_diferença
FROM sales.funnel