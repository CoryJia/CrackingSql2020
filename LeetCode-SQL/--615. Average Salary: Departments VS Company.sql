--615. Average Salary: Departments VS Company

with cte as (
    select department_id,
           amount,
           left(pay_date, 7)                                        as pay_month,
           avg(amount) over ( partition by pay_date)                as total_average,
           avg(amount) over ( partition by pay_date, department_id) as each_average
    from salary a
             left join employee b
                       on a.employee_id = b.employee_id
)
select distinct pay_month,
       department_id,
       case
           when each_average < total_average then 'lower'
           when each_average > total_average then 'higher'
           else 'same'
           end as 'comparison'
from cte
order by pay_month;