--1285. Find the Start and End Number of Continuous Ranges

select min(log_id) as start_id,
       max(log_id) as start_id
from (select log_id,
             abs(log_id - row_number() over (order by log_id)) as seq
      from Logs
     ) temp
group by seq;