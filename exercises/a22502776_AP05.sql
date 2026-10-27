USE BikeStores
GO

SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'production' AND TABLE_NAME = 'review_queue';
  
/*A1*/
CREATE TABLE production.review_queue
(
    product_id INT NOT NULL,
    review_note NVARCHAR(200),
    score DECIMAL(10,2),
    review_date DATE NOT NULL
);

SELECT * FROM  production.review_queue

/*A2*/
ALTER TABLE production.review_queue
ADD reviewer_code NVARCHAR(10) NULL;

ALTER TABLE production.review_queue
ALTER COLUMN reviewer_code NVARCHAR(16) NULL;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'production'
  AND TABLE_NAME = 'review_queue'
  AND COLUMN_NAME = 'reviewer_code';

/*A3 Product-price view
Create production.vw_category_price_summary with category ID, product count, minimum list price, and average list price. Use only production.products; no joins are needed.

Querying INFORMATION_SCHEMA.COLUMNS, filtered for the view, should return these rows in order:*/

CREATE VIEW production.vw_category_price_summary AS
SELECT
    category_id,
    COUNT(*) AS product_count,
    MIN(list_price) AS min_list_price,
    AVG(list_price) AS avg_list_price
FROM production.products
GROUP BY category_id;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'production'
  AND TABLE_NAME = 'vw_category_price_summary'
ORDER BY ORDINAL_POSITION;

