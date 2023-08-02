-- CASE WHEN
-- Calcule o nº de clientes que ganham abaixo de 5k, entre 5k e 10k, entre 10k e 15k, e os 
-- que ganham acima de 15k

WITH faixa_de_renda AS (
	SELECT 
		income,
	CASE 
		WHEN income <5000 THEN '0-5000'
		WHEN income >= 5000 AND income <10000 THEN '5000-10000'
		WHEN income >= 10000 AND income <15000 THEN '10000-15000'
		ELSE 'Maior que 15000'
	END AS faixa_de_renda
 	FROM sales.customers)
	
SELECT faixa_de_renda, COUNT(*)
FROM faixa_de_renda
GROUP BY faixa_de_renda
ORDER BY faixa_de_renda


--Crie uma colunda chamada população_ajustada na tabela temp_tables.regions e 
--preencha com os dados da coluna population, mas caso o campo estiver nulo,
--preencha com a população média geral

SELECT 
	*, 
	CASE 
		WHEN population IS NOT null THEN population
		ELSE (SELECT AVG(population) FROM temp_tables.regions)
		END AS populacao_ajustada
		
FROM temp_tables.regions
WHERE population IS null

-- VERSÃO COM COALESCE
SELECT 
	*, 
	COALESCE(population, (SELECT AVG(population) FROM temp_tables.regions)) AS populacao_ajustada
		
FROM temp_tables.regions
WHERE population IS null
