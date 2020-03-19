--571. Find Median Given Frequency of Numbers

select sum(Number) / (count(Number) + 0.0) as median
from (
         select Number,
                Frequency,
                sum(Frequency) over (order by Number) as cumulative_num,
                sum(Frequency) over ()               as total_num
         from Numbers
     ) as temp
where total_num / 2.0 between cumulative_num - Frequency and cumulative_num;