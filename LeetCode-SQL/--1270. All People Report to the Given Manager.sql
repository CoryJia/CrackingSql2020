--1270. All People Report to the Given Manager

/* Write your T-SQL query statement below */

--solution 1
 with cte as (
     select employee_id
     from Employees
     where manager_id = 1 and employee_id != 1
     union all
     select e.employee_id
     from cte c inner join Employees e on c.employee_id = e.manager_id
 )
select employee_id
from cte
order by employee_id
option (maxrecursion 3)

--solution 2
with t1 as (
    select distinct employee_id from employees where manager_id = 1 and employee_id != 1),

t2 as (
    select distinct employee_id from employees where manager_id in (select employee_id from t1)),

t3 as (
    select distinct employee_id from employees where manager_id in (select employee_id from t2))

select employee_id from t1
union
select employee_id from t2
union
select employee_id from t3
