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

/*A3*/