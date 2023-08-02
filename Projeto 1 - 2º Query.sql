SELECT 
	'Brazil' AS pais,
	cus.state AS estado,
	COUNT(fun.paid_date) AS pagamentos
	

FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus
ON fun.customer_id = cus.customer_id 
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY pais, estado
ORDER BY pagamentos DESC
LIMIT 5