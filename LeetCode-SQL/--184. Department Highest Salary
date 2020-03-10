--184. Department Highest Salary

select d.Name   as Department,
       t.Name   as Employee,
       t.Salary as Salary
from (
         select Name,
                Salary,
                DepartmentId,
                dense_rank() over (partition by DepartmentId order by Salary desc) as rank
         from Employee
     ) as t
         inner join Department d
                    on d.Id = t.DepartmentId
where t.rank = 1