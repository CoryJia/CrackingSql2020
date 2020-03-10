--176. Second Highest Salary

select max(Salary) as SecondHighestSalary
from (
         select Id,
                Salary,
                rank() over (order by Salary desc ) as rank
         from Employee
     ) t
where rank = 2;