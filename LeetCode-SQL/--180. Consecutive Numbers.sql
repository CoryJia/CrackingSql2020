--180. Consecutive Numbers

/*
SQL Server LAG() is a window function that provides access to a row at a specified
physical offset which comes before the current row.

In other words, by using the LAG() function, from the current row, you can access
data of the previous row, or the row before the previous row, and so on.
*/

select distinct (Num) as ConsecutiveNums
from (
         select id,
                Num,
                lag(Num, 1) over (order by id) as first,
                lag(Num, 2) over (order by id) as second
         from Logs
     ) as lag
where Num = lag.first and Num = lag.second;