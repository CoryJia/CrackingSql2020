--1112. Highest Grade For Each Student

SELECT student_id,
       course_id,
       grade
FROM (
         SELECT student_id,
                course_id,
                grade,
                RANK() over (PARTITION BY student_id ORDER BY grade DESC, course_id ASC ) AS rank
    FROM Enrollments
     ) AS t
WHERE t.rank = 1
ORDER BY student_id, course_id