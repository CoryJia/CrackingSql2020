--1141. User Activity for the Past 30 Days I

declare @end_date date = '2019-07-27';
declare @begin_date date = dateadd(day, -29, @end_date);

select activity_date as day,
       count(distinct user_id) as active_users
from Activity
where activity_date between @begin_date and @end_date
group by activity_date
order by activity_date;