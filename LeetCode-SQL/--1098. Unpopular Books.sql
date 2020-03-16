--1098. Unpopular Books

with cte as (
    Select b.book_id                                                       as book_id,
           name,
           (case when sum(quantity) is null then 0 else sum(quantity) end) as sum,
           datediff(d, available_from, '2019-06-23')                       as diff
    from books b
             left join orders o on b.book_id = o.book_id and dispatch_date > '2018-06-23'
    group by b.book_id, available_from, name)

select book_id, name
from cte
where diff > 30
  and sum < 10


------------------------------------------------------------------------------------------
DECLARE @GetDate DATE= '2019-06-23';

SELECT
       book_id,
       name
FROM   Books
WHERE  available_from < DATEADD(month, -1, @GetDate)
       AND book_id NOT IN(SELECT
                                 book_id
                          FROM   Orders
                          WHERE  dispatch_date > DATEADD(year, -1, @GetDate)
                          GROUP BY
                                   book_id
                          HAVING SUM(quantity) >= 10);