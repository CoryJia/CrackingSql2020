--1070. Product Sales Analysis III

with temp as (
    select product_id, year as first_year, quantity, price,
           rank() over (partition by product_id order by year) as rank
    from Sales
)
select product_id, year as first_year, quantity, price
from temp
where temp.rank = 1;
