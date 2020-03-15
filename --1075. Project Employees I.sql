--1075. Project Employees I.sql

SELECT project_id, ROUND(SUM(experience_years) * 1.0 / COUNT(project_id) * 1.0, 2) AS average_years
FROM Employee e
JOIN Project p
ON e.employee_id = p.employee_id
GROUP BY project_id
ORDER BY project_id;