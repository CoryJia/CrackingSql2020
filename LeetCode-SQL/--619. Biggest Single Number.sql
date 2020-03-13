--619. Biggest Single Number


select max(t.number) as num
from (
         select num as number
         from my_numbers
         group by num
         having count(num) = 1
     ) t