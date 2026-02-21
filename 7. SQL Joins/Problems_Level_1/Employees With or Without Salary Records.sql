SELECT e.employee_id,e.name,s.salary
FROM Employees e LEFT JOIN Salaries s
ON e.employee_id = s.employee_id
UNION 
SELECT s.employee_id,e.name,s.salary
FROM Employees e RIGHT JOIN Salaries s
ON e.employee_id = s.employee_id
