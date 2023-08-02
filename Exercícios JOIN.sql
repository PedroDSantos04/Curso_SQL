-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT
	prod.brand,
	COUNT(fun.visit_page_date) AS visitas

FROM sales.funnel AS fun
LEFT JOIN sales.products as prod
ON fun.product_id = prod.product_id
GROUP BY prod.brand
ORDER BY visitas DESC

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

SELECT
	sto.store_name,
	COUNT(fun.visit_page_date) AS visitas

FROM sales.funnel AS fun
LEFT JOIN sales.stores as sto
ON fun.store_id = sto.store_id
GROUP BY sto.store_name
ORDER BY visitas DESC

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

SELECT 
	reg.size,
	COUNT(*) AS clientes
	
FROM sales.customers AS cus
LEFT JOIN temp_tables.regions AS reg
ON LOWER(cus.city) = LOWER(reg.city)
AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY reg.size
ORDER BY clientes DESC