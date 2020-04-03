--1158. Market Analysis I

with temp as (
    select buyer_id,
           count(buyer_id)  as orders_in_2019
    from Orders
    where year(order_date) = '2019'
    group by buyer_id
)
select user_id                          as buyer_id,
       join_date,
       coalesce(t.orders_in_2019, 0) as orders_in_2019
from Users u
         left join temp t
                   on u.user_id = t.buyer_id;