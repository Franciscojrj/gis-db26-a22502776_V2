/*
  Lesson 01 - Read, add, change, and remove rows
  Student: Francisco Jesus
  Class: Base de Dados 2º ano
  Date: 29/09/2026
*/

USE ULHT_DB26;
GO

-- list databases in the current SQL Server instance
SELECT
    name,
    database_id,
    state_desc,
    recovery_model_desc
FROM sys.databases
ORDER BY name;

-- list schemata in the current database
SELECT
    CATALOG_NAME,
    SCHEMA_NAME,
    SCHEMA_OWNER
FROM INFORMATION_SCHEMA.SCHEMATA
ORDER BY SCHEMA_NAME;

SELECT *
FROM Scott.EMP;

SELECT *
FROM CompanyDB.Scott.EMP;

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Scott'
    AND TABLE_NAME = 'EMP'
ORDER BY ORDINAL_POSITION;