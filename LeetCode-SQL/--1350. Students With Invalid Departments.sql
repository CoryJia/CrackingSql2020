--1350. Students With Invalid Departments

select s.id,
       s.name
from Students s
left join Departments d
on s.department_id = d.id
where d.name is null;