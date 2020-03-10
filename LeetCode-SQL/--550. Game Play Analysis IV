--550. Game Play Analysis IV

select (cast(sum(iif(abs(datediff(day, event_date, first_login)) = 1, 1.0, 0)) /
             count(distinct player_id) * 1.0 as numeric(6, 2))) as fraction
from (
         select *,
                min(event_date) over ( partition by player_id) as first_login
         from Activity
     ) t