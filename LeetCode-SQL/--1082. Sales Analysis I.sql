--1082. Sales Analysis I

select seller_id
from (
         select seller_id,
                dense_rank() over (order by sum(price) desc) as rank
         from Sales
         group by seller_id
     ) as t
where t.rank = 1;