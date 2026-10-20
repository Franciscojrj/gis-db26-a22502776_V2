CREATE TABLE HR.employee_training (
    employee_id INT NOT NULL,
    course_code VARCHAR(12) NOT NULL,
    completed_on DATE NULL,
    score DECIMAL(5, 2) NULL
);

-- Verify TABLE 'employee_training' was created.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'employee_training_2';
-- Verify all columns were created on TABLE 'employee_training'.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'HR' AND TABLE_NAME = 'employee_training_2';

IF OBJECT_ID('HR.employee_training', 'U') IS NULL
CREATE TABLE employee_training_2 (
    employee_id INT NOT NULL,
    course_code VARCHAR(12) NOT NULL,
    completed_on DATE NULL,
    score DECIMAL(5, 2) NULL
)
ELSE
    PRINT 'já existe';

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'HR' AND TABLE_NAME = 'training_topic';

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