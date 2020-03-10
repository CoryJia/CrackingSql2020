--597. Friend Requests I: Overall Acceptance Rate.sql

with temp1 as (
    select count(1) accepts
    from (
             select distinct requester_id, accepter_id
             from request_accepted
         ) tb1
),

     temp2 as (
         select count(1) requests
         from (
                  select distinct sender_id, send_to_id
                  from friend_request
              ) tb2
     )
select round(coalesce(temp1.accepts * 1.0 / (IIF(temp2.requests = 0, 1, temp2.requests)) * 1.0, 0),
             2) accept_rate
from temp2,
     temp1;

/*In SQL Server (Transact-SQL), the COALESCE function returns the first non-null expression in the list.
  If all expressions evaluate to null, then the COALESCE function will return null.

SELECT COALESCE(NULL, NULL, 'TechOnTheNet.com', NULL, 'CheckYourMath.com');
Result: 'TechOnTheNet.com'

SELECT COALESCE(NULL, 'TechOnTheNet.com', 'CheckYourMath.com');
Result: 'TechOnTheNet.com'

SELECT COALESCE(NULL, NULL, 1, 2, 3, NULL, 4);
Result: 1*/


with temp1 as (
    select count(1) accepts
    from (
             select distinct requester_id, accepter_id
             from request_accepted
         ) tb1
),
     temp2 as (
         select count(1) requests
         from (
                  select distinct sender_id, send_to_id
                  from friend_request
              ) tb2
     )
select case
           when temp2.requests = 0 then 0.00
           else round(temp1.accepts * 1.0 / temp2.requests, 2) end as accept_rate
from temp1,
     temp2;