SELECT
	CASE 
		WHEN professional_status = 'freelancer' THEN 'freelancer'
		WHEN professional_status = 'retired' THEN 'aposentado'
		WHEN professional_status = 'clt' THEN 'clt'
		WHEN professional_status = 'self_employed' THEN 'autônomo(a)'
		WHEN professional_status = 'other' THEN 'outro'
		WHEN professional_status = 'businessman' THEN 'empresário(a)'
		WHEN professional_status = 'civil_servant' THEN 'funcionário(a)_público(a)'
		WHEN professional_status = 'student' THEN 'estudante'
		END AS "status_profissional",
		(COUNT(*)::float)/(SELECT COUNT(*) FROM sales.customers) AS "leads(%)"

FROM sales.customers
GROUP BY professional_status
ORDER BY "leads(%)"