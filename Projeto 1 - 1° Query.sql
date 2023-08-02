WITH leads AS (
SELECT 
	date_trunc('month', visit_page_date)::date AS visit_month,
	count(*) AS visit_page_count
FROM sales.funnel
GROUP BY visit_month
ORDER BY visit_month
),

payments AS(
SELECT 
	date_trunc('month', fun.paid_date)::date AS paid_month,
	COUNT(fun.paid_date) AS paid_count,
	SUM(pro.price * (1+fun.discount)) AS receita
	
FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
ON fun.product_id = pro.product_id
WHERE fun.paid_date IS NOT null
GROUP BY paid_month
ORDER BY paid_month)

--------------------------------------------------------

SELECT
	leads.visit_month AS mes, 
	leads.visit_page_count AS leads,
	payments.paid_count AS vendas,
	(payments.receita/1000) AS receita,
	(payments.paid_count::float/leads.visit_page_count::float) AS conversão,
	((payments.receita/payments.paid_count)/1000) AS ticket_medio
	
FROM leads
LEFT JOIN payments
ON leads.visit_month = payments.paid_month