--185. Department Top Three Salaries


select Department,
       Employee,
       Salary
from (
         select e.Name                                                                 as Employee,
                e.Salary                                                               as Salary,
                d.Name                                                                 as Department,
                dense_rank() over (partition by e.DepartmentId order by e.Salary desc) as rank
         from Employee e
                  inner join Department d
                             on e.DepartmentId = d.Id
     ) t
where t.rank <= 3

