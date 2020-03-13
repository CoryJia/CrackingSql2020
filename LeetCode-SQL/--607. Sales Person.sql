--607. Sales Person

select name
from salesperson

    except

select p.name
from salesperson p
         left join orders o
              on p.sales_id = o.sales_id
         join company c
              on o.com_id = c.com_id
where c.name = 'RED';