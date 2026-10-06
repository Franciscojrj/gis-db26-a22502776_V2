/*
  Lesson 01 - Read, add, change, and remove rows
  Student: Francisco Jesus
  Class: Base de Dados 2º ano
  Date: 29/09/2026
*/

/*a1*/
SELECT TOP 5
       EMPLOYEE_ID,
       UPPER(LAST_NAME) + ', ' + FIRST_NAME AS formal_name
FROM HR.EMPLOYEES
ORDER BY EMPLOYEE_ID;

/*a2*/
SELECT TOP 5
    employee_id,
    LOWER(EMAIL) + 'example.org' as email_address
FROM HR.EMPLOYEES
ORDER BY EMPLOYEE_ID;

/*a3*/
SELECT top 5
  last_name,
  LEN(LAST_NAME) AS last_name_lenght
from hr.EMPLOYEES
ORDER BY last_name_lenght DESC;