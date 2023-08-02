SELECT 
	CASE 
		WHEN datediff('years', birth_date, current_date) < 20 THEN '0-20'
		WHEN datediff('years', birth_date, current_date) < 40 THEN '20-40'
		WHEN datediff('years', birth_date, current_date) < 60 THEN '40-60'
		WHEN datediff('years', birth_date, current_date) < 80 THEN '60-80'
		ELSE '+80' END AS "idade_leads",
		COUNT(*)::float/(SELECT COUNT(*) FROM sales.customers) AS "leads(%)"

FROM sales.customers
GROUP BY idade_leads
ORDER BY idade_leads