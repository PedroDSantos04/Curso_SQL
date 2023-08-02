-- criar uma tabela onde mostra o id e a idade do cliente
-- chame-a de temp_tables.customers_age

SELECT
	customer_id,
	datediff('y', birth_date, current_date)
	INTO temp_tables.customers_age
FROM sales.customers


-- criar uma tabela traduzindo o professional_status
--chame-a de temp_tables.profissoes

CREATE TABLE temp_tables.profissoes(
	professional_status VARCHAR,
	status_profissional VARCHAR 	)

INSERT INTO temp_tables.profissoes(professional_status, status_profissional)
VALUES
('freelancer', 'freelancer'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessmen', 'empresário(a)'),
('civil-servant', 'funcionário(a) público'),
('student', 'estudante')

-- delete a tabela que acabou de criar

DROP TABLE temp_tables.profissoes
