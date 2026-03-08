SELECT
    s.student_id, s.student_name
FROM Student s
WHERE s.student_id IN (
    SELECT e.student_id
    FROM Exam e
    WHERE 
        e.score NOT IN (
            SELECT MAX(score) 
            FROM Exam
            WHERE exam_id = e.exam_id
            GROUP BY exam_id
        )
        AND
        e.score NOT IN (
            SELECT MIN(score)
            FROM Exam
            WHERE exam_id = e.exam_id
            GROUP BY exam_id
        )
        GROUP BY e.student_id
)
ORDER BY s.student_id;
