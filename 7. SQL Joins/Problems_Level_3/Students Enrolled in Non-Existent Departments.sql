-- Using Right join
SELECT S.id, S.name
FROM Departments D 
RIGHT JOIN Students S 
ON D.id = S.department_id
WHERE D.id IS NULL;

-- Using Left join
SELECT s.id, s.name
FROM Students s
LEFT JOIN Departments d ON s.department_id = d.id
WHERE d.id IS NULL;
