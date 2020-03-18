--1132. Reported Posts II

WITH cte AS (
    SELECT COUNT(DISTINCT a.post_id) * 1.00 AS total_posts,
           COUNT(DISTINCT r.post_id) * 1.00 AS total_removes,
           a.action_date
    FROM Actions a
    LEFT JOIN Removals r
            ON r.post_id = a.post_id
    WHERE a.extra = 'spam'
    GROUP BY a.action_date
)
SELECT ROUND(AVG(total_removes / total_posts) * 100.00, 2) AS average_daily_percent
FROM cte;