--Identifique qual o status profissional mais frequente nos clientes que compram automóveis 
--no site

SELECT
	cus.professional_status,
	COUNT(fun.paid_date) AS pagamentos

FROM sales.funnel as fun LEFT JOIN sales.customers as cus
ON fun.customer_id = cus.customer_id
GROUP BY professional_status
ORDER BY pagamentos DESC


--Identifique qual o gênero mais frequente nos clientes que compraram
--automóveis no site. Obs: Utilizar a tabela temp_table:ibge_genders

SELECT 
	gen.gender,
	COUNT(fun.paid_date) AS pagamentos

FROM sales.funnel as fun
LEFT JOIN sales.customers as cus
ON fun.customer_id = cus.customer_id
LEFT JOIN temp_tables.ibge_genders as gen
ON lower(cus.first_name) = gen.first_name 
GROUP BY gen.gender
ORDER BY pagamentos DESC


--Identifique de quais regiões são os clientes que mais visitam o site 
-- Obs: Utilizar a tabela temp_tables.regions

SELECT
	reg.region,
	COUNT(fun.visit_page_date) AS visitas
	
FROM sales.funnel AS fun
LEFT JOIN sales.customers as cus
	ON fun.customer_id = cus.customer_id
LEFT JOIN temp_tables.regions as reg
ON LOWER(cus.city) = LOWER(reg.city)
AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY reg.region
ORDER BY visitas DESC












