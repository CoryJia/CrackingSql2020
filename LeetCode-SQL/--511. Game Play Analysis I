--511. Game Play Analysis I

select player_id,
       first_login
from
(
    select player_id,
           event_date as first_login,
           rank() over (partition by player_id order by event_date) as rank
    from Activity
    ) t
where t.rank = 1;