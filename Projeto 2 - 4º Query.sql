SELECT 
	CASE 
		WHEN income < 5000 THEN '0-5000'
		WHEN income < 10000 THEN '5000-10000'
		WHEN income < 15000 THEN '10000-15000'
		WHEN income < 20000 THEN '15000-20000'
		ELSE '+20000' END AS "faixa_salarial",
		COUNT(*)::float/(SELECT COUNT(*) FROM sales.customers) AS "leads(%)",
	CASE 
		WHEN income < 5000 THEN 1
		WHEN income < 10000 THEN 2
		WHEN income < 15000 THEN 3
		WHEN income < 20000 THEN 4
		ELSE 5 END AS "ordem"

FROM sales.customers
GROUP BY faixa_salarial, ordem
ORDER BY ordem