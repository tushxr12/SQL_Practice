SELECT
    e.employee_id, e.name, s.salary
FROM Employees e JOIN Salaries s
ON e.employee_id = s.employee_id;
