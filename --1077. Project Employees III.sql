--1077. Project Employees III

select project_id, employee_id
from (
         select project_id,
                e.employee_id,
                rank() over (partition by p.project_id order by experience_years desc ) as rank
         from Employee e
                  join Project p
                       on e.employee_id = p.employee_id
     ) as temp
where temp.rank = 1;