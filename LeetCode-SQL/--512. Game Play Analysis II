--512. Game Play Analysis II

select player_id,
       device_id
from
(
    select player_id,
           device_id,
           rank() over (partition by player_id order by event_date) as rank
    from Activity
    ) t
where t.rank = 1;