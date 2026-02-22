SELECT P.project_id,
    ROUND(AVG(E.experience_years), 2) as average_years
FROM Project P
JOIN Employee E
ON P.employee_id = E.employee_id
GROUP BY P.project_id;
