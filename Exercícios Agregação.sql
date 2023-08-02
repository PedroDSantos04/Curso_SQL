-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Conte quantos clientes da tabela sales.customers tem menos de 30 anos
SELECT COUNT(*)
FROM sales.customers
WHERE ((current_date - birth_date) / 365) < 30


-- (Exercício 2) Informe a idade do cliente mais velho e mais novo da tabela sales.customers
SELECT 
MIN((current_date - birth_date)/ 365) as cliente_mais_velho,
MAX((current_date - birth_date)/ 365) as cliente_mais_novo
FROM sales.customers


-- (Exercício 3) Selecione todas as informações do cliente mais rico da tabela sales.customers
-- (possívelmente a resposta contém mais de um cliente)
SELECT *
FROM sales.customers
WHERE income = (SELECT MAX(income) FROM sales.customers)



-- (Exercício 4) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- Ordene o resultado pelo nome da marca
SELECT COUNT (model), brand
FROM sales.products
GROUP BY brand
ORDER BY brand


-- (Exercício 5) Conte quantos veículos existem registrados na tabela sales.products
-- por marca e ano do modelo. Ordene pela nome da marca e pelo ano do veículo
SELECT brand,COUNT(brand), model_year
FROM sales.products
GROUP BY brand, model_year
ORDER BY model_year

-- (Exercício 6) Conte quantos veículos de cada marca tem registrado na tabela sales.products
-- e mostre apenas as marcas que contém mais de 10 veículos registrados
SELECT brand, COUNT(model) AS Número_de_modelos
FROM sales.products
GROUP BY brand
HAVING (COUNT(MODEL)) > 10