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
