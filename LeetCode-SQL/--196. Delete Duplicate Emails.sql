--196. Delete Duplicate Emails


--MySql solution
delete p1
from Person p1, Person p2
where p1.Email = p2.Email
      and p1.Id > p2.ID;

--MS SEVER SQL solution
select * from
(
    select Id, Email,
           rank() over (partition by Email order by Id) as rank
    from Person
) temp
where rank = 1;