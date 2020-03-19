--601. Human Traffic of Stadium

with cte as
         (
             SELECT id,visit_date,people,
                    row_number() over (order by id) as rn
             FROM stadium
             where people >= 100
         ),
     cte2 as
         (
             SELECT id, visit_date, people, id - rn as diff
             from cte
         )
select id, visit_date, people
from cte2
WHERE diff in (select diff
               from cte2
               group by diff
               having count(diff) >= 3)