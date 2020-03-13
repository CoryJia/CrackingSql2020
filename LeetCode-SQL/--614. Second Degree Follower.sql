--614. Second Degree Follower

select followee as follower,
       count(*) as num
from (
         select distinct *
         from follow
         where followee in (
             select distinct follower
             from follow
         )
     ) t
group by followee
order by followee