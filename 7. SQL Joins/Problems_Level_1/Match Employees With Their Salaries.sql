SELECT
    e.employee_id,e.name,s.salary
FROM Employees e, Salaries s 
WHERE e.employee_id = s.employee_id;
