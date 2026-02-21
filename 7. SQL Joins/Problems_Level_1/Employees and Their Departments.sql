SELECT 
    e.employee_id, e.name, d.dept_name
FROM Employee e RIGHT JOIN Department d
ON e.dept_id = d.dept_id;
