-- União simples de duas tabelas
-- Una a tabela sales.products com a temp_tables.products_2

SELECT * FROM sales.products
UNION ALL
SELECT * FROM temp_tables.products_2