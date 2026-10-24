/*
  Lesson 01 - Read, add, change, and remove rows
  Student: Francisco Jesus
  Class: Base de Dados 2º ano
  Date: 29/09/2026
*/

USE ULHT_DB26;
GO

SELECT * 
FROM INFORMATION_SCHEMA.TABLES;

SELECT FIRST_NAME
FROM HR.EMPLOYEES
WHERE FIRST_NAME = 'John'
ORDER BY FIRST_NAME;


/*a1*/
SELECT DB_NAME() AS current_database;


/*a2*/
SELECT *
FROM ULHT_DB26.INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'HR'
  AND TABLE_TYPE = 'BASE TABLE';


/*a3*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
FROM HR.EMPLOYEES
WHERE last_name = 'Smith';


/*a4*/
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SAlARY, DEPARTMENT_ID
FROM hr.EMPLOYEES
WHERE SAlARY > 10000 AND DEPARTMENT_ID <> 80
ORDER BY DEPARTMENT_ID DESC;


/*a5*/
SELECT FIRST_NAME, LAST_NAME
FROM HR.EMPLOYEES
WHERE MANAGER_ID IS null;


/*a6*/
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID 
FROM hr.DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

SELECT *
FROM hr.EMPLOYEES
WHERE DEPARTMENT_ID = 60;


/*a7*/
SELECT EMPLOYEE_ID, last_name, SALARY
FROM hr.EMPLOYEES
WHERE DEPARTMENT_ID = 60
ORDER BY salary DESC;

/*b1*/
SELECT *
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID LIKE '%776';

/*b2*/
SELECT COLUMN_NAME as "Mandatory Columns"
FROM ULHT_DB26.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'HR' 
  AND IS_NULLABLE = 'NO'
  AND TABLE_NAME = 'Employees';

/*B3*/
SELECT *
FROM HR.EMPLOYEES

INSERT INTO HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY, DEPARTMENT_ID, PHONE_NUMBER, job_id)
VALUES (776, 'Francisco', 'Jesus', GETDATE(), '20000', 60, '515.123.1234', 'IT_PROG');

/*b4*/
SELECT *
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 776;

/*C2*/
UPDATE HR.EMPLOYEES
SET DEPARTMENT_ID = 100,
    JOB_ID = 'FI_ACCOUNT'
WHERE EMPLOYEE_ID = 776;

SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM HR.EMPLOYEES
ORDER BY DEPARTMENT_ID;

/*C3*Update and verify the salary
Record the current salary, then increase only your employee's salary by 10%. 
Calculate the new value from the column rather than typing the final amount. Verify the new salary with a separate query.
Expected state change: one row is affected and the new salary is 110% of its value before this exercise.*/
UPDATE HR.EMPLOYEES
SET SALARY = SALARY * 1.10
WHERE EMPLOYEE_ID = 776;  

/*Part D - Remove and verify
Apply the five-step safety check before deleting the row.

D1. Preview
Write a SELECT whose predicate identifies only the row inserted in Part B.

Expected result: exactly one row with your employee identifier.

D2. Delete
Turn the verified predicate into a targeted DELETE.

Expected state change: the status message reports one affected row.

D3. Verify
Run the preview query again. It must return zero rows.

Expected result: an empty result set.*/

SELECT *
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 776;

DELETE FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID = 776;