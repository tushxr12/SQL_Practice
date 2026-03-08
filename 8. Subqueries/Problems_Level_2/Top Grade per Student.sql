SELECT
    e.student_id, MIN(e.course_id) AS course_id, grade
FROM Enrollments AS e
WHERE (e.student_id, e.grade) IN 
(
    SELECT student_id,MAX(grade)
    FROM Enrollments
    GROUP BY student_id
)
GROUP BY 
    student_id,
    grade
ORDER BY student_id;
