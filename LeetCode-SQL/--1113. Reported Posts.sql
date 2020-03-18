--1113. Reported Posts

DECLARE @yesterday DATETIME
SET @yesterday = DATEADD(day, -1, '2019-07-05');

SELECT extra                   AS report_reason,
       COUNT(DISTINCT post_id) AS report_count
FROM Actions
WHERE action_date = @yesterday
  and action = 'report'
GROUP BY extra;