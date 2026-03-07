SELECT name 
FROM Employee
WHERE id IN (
    SELECT
    e.managerId
    FROM Employee AS e
    GROUP BY e.managerId
    HAVING COUNT(*) >= 5
)
