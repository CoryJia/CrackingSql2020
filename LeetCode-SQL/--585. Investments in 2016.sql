--585. Investments in 2016

with t as (
    select PID,
           TIV_2015,
           count(*) over ( partition by TIV_2015) ctiv,
           count(*) over ( partition by LAT, LON) clat
    from insurance
)
select sum(TIV_2016) as TIV_2016
from insurance i
join t
on t.PID = i.PID and t.ctiv > 1 and t.clat = 1