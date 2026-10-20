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

SELECT e.employee_id, j.job_id, j.JOB_ID, j.MIN_SALARY, j.MAX_SALARY
FROM HR.employees AS e
CROSS JOIN HR.jobs AS j
WHERE e.employee_id IN (103, 104) AND 
    e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id, j.job_id;

SELECT e.employee_id, j.job_id, j.JOB_ID, j.MIN_SALARY, j.MAX_SALARY
FROM HR.employees AS e
INNER JOIN HR.jobs AS j ON e.job_id = j.JOB_ID
---WHERE e.employee_id IN (103, 104) AND 
    ---e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id, j.job_id;


SELECT e.employee_id, e.last_name, h.job_id AS former_job
FROM HR.employees AS e
LEFT OUTER JOIN HR.job_history AS h ON h.employee_id = e.employee_id
--WHERE e.employee_id = 104;