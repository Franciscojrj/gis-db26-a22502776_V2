/*
  Lesson 04 - Group functions and set operators
  Student:
  Class:
  Date:
*/

USE ULHT_DB26;
GO

SELECT COUNT(*) AS employee_count,
       MIN(e.salary) AS minimum_salary,
       MAX(e.salary) AS maximum_salary,
       AVG(e.salary) AS average_salary
FROM HR.employees AS e
WHERE e.salary >= 5000;


SELECT COUNT(*) AS all_employees,
       COUNT(e.department_id) AS assigned_employees,
       COUNT(*) - COUNT(e.department_id) AS unassigned_employees
FROM HR.employees AS e;

