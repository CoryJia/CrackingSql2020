--1083. Sales Analysis II

select buyer_id
from Sales s
join Product p
on s.product_id = p.product_id
where p.product_name = 'S8'

except

select buyer_id
from Sales s
join Product p
on s.product_id = p.product_id
where p.product_name = 'iPhone';