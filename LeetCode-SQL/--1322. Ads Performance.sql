--1322. Ads Performance.sql

select ad_id,
       case
           when total_clicks_views = 0 then 0
           else
               round(100 * total_clicks / total_clicks_views, 2) end as ctr
from (
         select ad_id,
                sum(case when action in ('Viewed', 'Clicked') then 1 else 0 end) as total_clicks_views,
                sum(case when action = 'Clicked' then 1.00 else 0 end)           as total_clicks
         from Ads
         group by ad_id
     ) temp
order by ctr desc, ad_id;
