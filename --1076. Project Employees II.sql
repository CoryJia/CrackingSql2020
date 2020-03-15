--1076. Project Employees II

SELECT project_id
FROM (
        SELECT project_id,
               RANK() OVER (ORDER BY COUNT(employee_id) DESC) as rank
        FROM Project
        GROUP BY project_id
         ) as temp
where temp.rank = 1;