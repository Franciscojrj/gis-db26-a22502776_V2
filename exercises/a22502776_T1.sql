/*
  Student: Francisco Jesus
  Class: Base de Dados 2º ano
  Date: 29/09/2026
  20:00
*/

USE BikeStores;
GO

/*A BikeStores é uma base de dados relacional de exemplo que representa uma empresa de retalho de bicicletas, incluindo informação sobre produtos, clientes, lojas e vendas.
A HR é uma base de dados relacional de exemplo que representa parte de um sistema de gestão de Recursos Humanos, que inclui informação de identificação de funcionários, hierarquia e strutura de uma empresa hipotética. A base de dados também inclui dados de vencimentos, mas não de processamento de salários
Responde às perguntas com base na base de dados disponibilizada. Escolhe tabelas e campos adequados a cada operação e indica os seus nomes na resposta. Define valores e condições coerentes com os dados existentes e respeita os tipos, tamanhos e restrições dos campos.*/

/*1 Identifica todas as tabelas da base de dados/schema*/
SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

SELECT * 
    FROM INFORMATION_SCHEMA.TABLES t
    WHERE t.TABLE_CATALOG = 'bikestores';

/*2 Escolhe duas tabelas que consideres fundamentais para base de dados:
    • Para cada uma das tabelas, lista os campos, tipos de dados, incluindo tamanhos, e nulidade.
    • Consegues identificar se estas tabelas têm dependências entre si? justifica*/
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'production' AND TABLE_NAME = 'products';

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales' AND TABLE_NAME = 'customers';

SELECT   c.COLUMN_NAME
        ,c.TABLE_NAME
        ,c.TABLE_SCHEMA
        ,CONCAT(c.DATA_TYPE,'(',COALESCE(CAST(c.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)),CONCAT(CAST(c.NUMERIC_PRECISION AS VARCHAR(10)),',',c.NUMERIC_SCALE),''),')')
        ,IIF(c.IS_NULLABLE= 'YES','NULL','NOT NULL')
    FROM INFORMATION_SCHEMA.COLUMNS c
    WHERE c.TABLE_NAME IN ('products','brands')


/*3 Consultas e operações básicas
    • Escolhe uma tabela com um campo que permita valores nulos. Apresenta alguns campos dos registos em que esse campo tenha um valor atribuído. Ordena o resultado por dois campos, utilizando ordens diferentes em cada um deles.*/
SELECT customer_id, first_name, last_name, email
FROM sales.customers
WHERE email IS NOT NULL
ORDER BY last_name ASC, first_name DESC;

SELECT * 
FROM production.products p 
WHERE p.model_year NOT BETWEEN 2017 AND 2018

/*4 Operações de linha
    • Escolhe um campo de data e apresenta, juntamente com o valor original, uma segunda data obtida através da adição de um período de tempo definido por ti. O resultado calculado deve continuar a ser um valor de data.
Acrescenta uma coluna com a diferença de dias entre a data original e a data de sistema e ordena o resultado pelo valor absoluto desta diferença, começando pela maior distância\*/
SELECT order_id, order_date, 
      DATEADD(DAY, 30, order_date) AS new_order_date,
      DATEDIFF(DAY, order_date, GETDATE()) AS days_difference
FROM sales.orders
ORDER BY ABS(DATEDIFF(DAY, order_date, GETDATE())) DESC;

SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS c 
    WHERE c.IS_NULLABLE = 'YES' AND c.DATA_TYPE LIKE '%char%';


SELECT s.store_name,ISNULL(street,'no street adreess'),LOWER(CONCAT(ISNULL(LEFT(s.street,4),'0000'),s.store_name))
    FROM sales.stores s
    ORDER BY 3
/*5 Consultas formatadas
Escolhe uma tabela com um campo númerido utilizado como identificador e um campo de texto utilizado como classificador.
    • Constrói uma consulta de apresentação final com pelo menos quatro colunas. Deve incluir uma concatenação de texto, uma conversão explícita de tipo, a substituição de um possível valor nulo e a formatação de um campo numérico ou de data. Mantém pelo menos um dos valores originais junto do respetivo valor transformado.*/
SELECT product_id, 
       product_name,
       CONCAT('Product: ', product_name) AS formatted_name,
       ISNULL(CAST(list_price AS VARCHAR(10)), 'N/A') AS price_text,
       FORMAT(list_price, 'C', 'en-US') AS formatted_price
FROM production.products
ORDER BY product_id;

/*6 Inserções e validação
    • Insere um novo registo sem indicar as colunas de inserção, garantindo que a coluna não obrigatória não é preenchida e utilizando a data de ONTEM*/
SELECT *
FROM sales.orders;

INSERT INTO sales.orders
VALUES (1, 4, DATEADD(DAY, -1, CAST(GETDATE() AS date)), DATEADD(DAY,  1, CAST(GETDATE() AS date)), NULL, 1, 1);

/*7 Uniformização de texto
    • Escolhe uma tabela que contenha campos de texto e escreve instrução SQL para converte o conteúdo de um campo de texto para minúsculas.
Atualiza apenas os registos em que um campo numérico ou de data esteja dentro de um intervalo definido por ti, incluindo os limites.*/

UPDATE sales.customers
SET last_name = LOWER(last_name)
WHERE customer_id BETWEEN 1 AND 10;

SELECT *
FROM sales.customers;

/*8 Tratamento de valores em falta
    • Escolhe uma tabela com campos que permitam valores vazios e 
    escreve instrução SQL para colocar um campo vazio apenas nos registos que satisfaçam duas condições em simultâneo: 
    um campo deve ter um dos valores de uma lista e um campo numérico ou de data deve estar dentro de um intervalo. 
    Escolhe os campos e os valores usados nas condições.*/


UPDATE sales.customers
SET phone = NULL
WHERE state IN ('CA', 'NY')
  AND customer_id BETWEEN 1 AND 10;

SELECT customer_id, first_name, last_name, state, phone
FROM sales.customers
WHERE customer_id BETWEEN 1 AND 10
ORDER BY customer_id;

/*9 Construção de valores de texto
Escolhe uma tabela com campos de texto adequados e escreve instruções SQL para atualiza um campo de texto com a concatenação das três primeiras letras de um campo de texto, convertidas para maiúsculas, de um hífen e do valor desse mesmo campo do mesmo registo. Limita a atualização através de uma condição com IN.
Escolhe campos de origem com comprimento suficiente e exclui os registos em que algum dos valores a concatenar esteja vazio.*/

-- Exemplo em SQL Server: atualiza o campo city com as 3 primeiras letras em maiúsculas, seguido de '-' e do valor original.
UPDATE sales.customers
SET city = CONCAT(UPPER(LEFT(city, 3)), '-', city)
WHERE state IN ('CA', 'NY')
  AND city IS NOT NULL
  AND LEN(TRIM(city)) >= 3;

SELECT customer_id, city, state
FROM sales.customers
WHERE state IN ('CA', 'NY')
ORDER BY customer_id;

/*Eliminação de registos
Elimina o registo inserido na pergunta 6, utilizando o identificador que foi testado antes da inserção.
Certifica-te que é feito primeiro uma consulta que identifique os registos a eliminar e, depois, é então executada a instrução para apagar registos.
Demonstra que o registo e apenas aquele que foi inserido na pergunta 5 foi eliminado.*/

SELECT order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id
FROM sales.orders
WHERE order_id = 2001;

DELETE FROM sales.orders
WHERE order_id = 2001;

SELECT order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id
FROM sales.orders
WHERE order_id = 2001;

