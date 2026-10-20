/*
  Lesson 08 - Read, add, change, and remove rows
  Student: Francisco Jesus
  Class: Base de Dados 2º ano
  Date: 20/10/2026
*/

SELECT e.employee_id, e.last_name, d.department_name
FROM HR.employees AS e
JOIN HR.departments AS d ON d.department_id = e.department_id
WHERE e.employee_id IN (103, 104, 178, 203)
ORDER BY e.employee_id;