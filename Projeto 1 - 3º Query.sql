SELECT 
	pro.brand,
	COUNT(fun.paid_date) AS vendas


FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
ON fun.product_id = pro.product_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY brand
ORDER BY vendas DESC
LIMIT 5