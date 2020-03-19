--262. Trips and Users

select request_at                                                               as Day,
       round((1.00 * sum(iif(status != 'completed', 1, 0))) / count(status), 2) AS [Cancellation Rate]
from trips a
         inner join users b
                    on a.client_id = b.users_id and b.banned = 'No'
         inner join users c
                    on a.driver_id = c.users_id and c.banned = 'No'
where request_at between convert(datetime, '2013-10-01') and convert(datetime, '2013-10-03')
group by request_at