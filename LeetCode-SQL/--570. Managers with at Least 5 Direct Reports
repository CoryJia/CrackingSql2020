--570. Managers with at Least 5 Direct Reports

select Name
from Employee
where Id in (
    select a.ManagerId
    from Employee a
    left join Employee b
    on a.ManagerId = b.Id
    group by a.ManagerId
    having count(a.ManagerId) >= 5
    )