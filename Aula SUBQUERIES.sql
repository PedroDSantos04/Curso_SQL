-- selecione o veículo mais barato da tabela products

SELECT * FROM sales.products
WHERE price = (SELECT MIN(price) FROM sales.products)

-- WITH
-- Calcule a idade média dos cliente por status profissional

WITH alguma_tabela AS(
SELECT
	professional_status,
	(current_date - birth_date)/ 365 AS idade 
FROM sales.customers)

SELECT 
	professional_status,
	AVG(idade) AS idade_media
FROM alguma_tabela
GROUP BY professional_status





-- FROM
-- Calcule a idade média dos cliente por status profissional

SELECT 
	professional_status,
	AVG(idade) AS idade_media
FROM (
	SELECT
	professional_status,
	(current_date - birth_date)/ 365 AS idade 
	FROM sales.customers) 
	AS alguma_tabela
GROUP BY professional_status




-- SELECT
-- Na tabela sales.funnel crie uma coluna e informe  o nº de visitas acumuladas
-- que a loja visitada recebeu até o momento

SELECT 
	fun.visit_id,
	fun.visit_page_date,
	sto.store_name,
	(
	SELECT COUNT(*)
	FROM sales.funnel as fun2
	WHERE fun2.visit_page_date <= fun.visit_page_date
		AND fun2.store_id = fun.store_id) AS visitas_acumuladas
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
	ON fun.store_id = sto.store_id
ORDER BY sto.store_name, fun.visit_page_date
		