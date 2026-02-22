SELECT 
    E1.employee_id, COUNT(*) as team_size
FROM Employee E1
JOIN Employee E2
ON E1.team_id = E2.team_id
GROUP BY E1.employee_id
ORDER BY E1.employee_id;
