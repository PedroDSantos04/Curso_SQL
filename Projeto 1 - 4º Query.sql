SELECT 
	sto.store_name AS loja,
	COUNT(fun.paid_date) AS vendas


FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
ON fun.store_id = sto.store_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY loja
ORDER BY vendas DESC
LIMIT 5