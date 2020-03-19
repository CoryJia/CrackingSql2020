--579. Find Cumulative Salary of an Employee

select id,
       month,
       Salary
from (
     select id,
            month,
            --Every 3 months. rows 2 preceding indicates the number of rows or values to precede the current row(1 + 2)
            sum(Salary) over ( partition by id order by Month rows 2 preceding ) as Salary,
            dense_rank() over (partition by id order by Month desc ) month_no
     from Employee
         ) as temp
--exclude teh most recent month
where month_no > 1
order by id, Month desc