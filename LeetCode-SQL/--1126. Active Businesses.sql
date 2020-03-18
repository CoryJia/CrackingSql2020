--1126. Active Businesses

SELECT business_id
FROM (
         SELECT business_id,
                event_type,
                occurences,
                AVG(occurences) over ( partition by event_type) AS avg_occurences_per_event_type
         FROM Events
     ) AS temp
WHERE occurences > avg_occurences_per_event_type
GROUP BY business_id
HAVING COUNT(event_type) > 1;