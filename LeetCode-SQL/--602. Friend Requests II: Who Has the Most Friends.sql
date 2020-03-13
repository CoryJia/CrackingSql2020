--602. Friend Requests II: Who Has the Most Friends

select top 1 id, count(*) as num
from (
         select requester_id as id
         from request_accepted

         union all

         select accepter_id as id
         from request_accepted
     ) t
group by id
order by count(*) desc


/*
Concatenates the results of two queries into a single result set. You control whether the result set includes duplicate rows:

UNION ALL - Includes duplicates.
UNION - Excludes duplicates.
A UNION operation is different from a JOIN:

A UNION concatenates result sets from two queries. But a UNION does not create individual rows from columns gathered from two tables.
A JOIN compares columns from two tables, to create result rows composed of columns from two tables.
The following are basic rules for combining the result sets of two queries by using UNION:

The number and the order of the columns must be the same in all queries.

The data types must be compatible.
*/