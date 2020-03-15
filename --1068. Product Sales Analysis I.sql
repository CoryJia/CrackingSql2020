--1068. Product Sales Analysis I


select product_name, year, price
from Product p
join Sales s
on p.product_id = s.product_id;