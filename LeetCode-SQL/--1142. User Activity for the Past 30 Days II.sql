--1142. User Activity for the Past 30 Days II

select IIF(count(distinct user_id) = 0, 0.00,
           round(count(distinct session_id) * 1.00 / count(distinct user_id) * 1.00, 2)) as verage_sessions_per_user
from Activity
where activity_date > dateadd(dd, -30, '2019-07-27')