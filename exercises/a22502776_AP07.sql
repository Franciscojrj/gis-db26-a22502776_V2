/*
  Lesson 07
  Student: Francisco Jesus
  Class: Base de Dados 2º ano
  Date: 13/10/2026
*/

USE BikeStores
GO

/*A1*/
CREATE TABLE sales.warranty_claim
(
    claim_id     INT         NOT NULL,
    customer_id  INT         NOT NULL,
    staff_id     INT         NULL,
    product_code VARCHAR(20) NOT NULL,
    opened_on    DATE        NOT NULL,
    CONSTRAINT PK_warranty_claim PRIMARY KEY (claim_id));

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales'
  AND COLUMN_NAME = 'customer_id'
  AND TABLE_NAME IN ('warranty_claim', 'customers');

SELECT customer_id
FROM sales.warranty_claim
WHERE customer_id NOT IN (SELECT customer_id FROM sales.customers);

ALTER TABLE sales.warranty_claim
ADD CONSTRAINT FK_warranty_claim_customer
FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id);

SELECT name, is_disabled, is_not_trusted
FROM sys.foreign_keys
WHERE name = 'FK_warranty_claim_customer';

/*A2*/
