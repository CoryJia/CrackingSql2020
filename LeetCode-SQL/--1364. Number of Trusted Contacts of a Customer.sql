--1364. Number of Trusted Contacts of a Customer

select invoice_id,
       cu.customer_name,
       i.price,
       count(co.user_id)        as contacts_cnt,
       count(cu2.customer_name) as trusted_contacts_cnt
from Invoices i
         join Customers cu
              on cu.customer_id = i.user_id
         left join Contacts co
                   on cu.customer_id = co.user_id
         left join Customers cu2
                   on co.contact_name = cu2.customer_name and co.contact_email = cu2.email
group by invoice_id, cu.customer_name, i.price
order by invoice_id;


