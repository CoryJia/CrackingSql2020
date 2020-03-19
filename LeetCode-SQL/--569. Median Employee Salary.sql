--569. Median Employee Salary

with t1 as (
    select Id,
           Company,
           Salary,
           row_number() over (partition by Company order by Salary) as rank,
           count(*) over ( partition by Company) as total_employees_per_company
    from Employee
),
     t2 as (
         select *,
                case when total_employees_per_company % 2 = 0 then total_employees_per_company / 2 else (total_employees_per_company + 1) / 2 end as starting,
                case when total_employees_per_company % 2 = 0 then (total_employees_per_company + 2) / 2 else (total_employees_per_company + 1) / 2 end as ending
         from t1
     )
select Id, Company, Salary
from t2
where rank = starting or rank = ending