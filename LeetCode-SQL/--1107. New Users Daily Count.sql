--1107. New Users Daily Count
DECLARE @GetDate DATE = '2019-06-30';

SELECT login_date,
       COUNT(DISTINCT user_id) AS user_count
FROM (
    SELECT user_id,
           MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity = 'login'
    GROUP BY user_id
) AS t
WHERE DATEDIFF(DAY, login_date, @GetDate) <= 90
GROUP BY login_date;