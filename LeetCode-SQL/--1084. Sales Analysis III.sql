--1084. Sales Analysis III.sql

select product_id, product_name
from product
where product_id not in
      (
          select p.product_id
          from product p
                   join sales s
                        on p.product_id = s.product_id
          where s.sale_date < '2019-01-01'
             or s.sale_date > '2019-03-31'
      ) ;

select p.product_id, p.product_name
from sales s,
     product p
where p.product_id = s.product_id
  and sale_date between '2019-01-01' and '2019-03-31'
    except
select p.product_id, p.product_name
from sales s,
     product p
where p.product_id = s.product_id
  and sale_date not between '2019-01-01' and '2019-03-31;