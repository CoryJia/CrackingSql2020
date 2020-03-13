--578. Get Highest Answer Rate Question

select top 1 question_id as survey_log
from (
         select question_id,
                (sum(iif(answer_id is Null, 0, 1)) * 100 / count(*)) as answer_rate
         from survey_log
         group by question_id
     ) t
order by answer_rate desc