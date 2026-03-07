-- Query 1 (Using NOT IN)
SELECT s.name
FROM SalesPerson s
WHERE s.sales_id NOT IN (
    SELECT sales_id
    FROM Orders AS o
    LEFT JOIN Company AS c
    ON c.com_id = o.com_id
    WHERE c.com_id = 1
)


-- Query 2 (USING NOT EXISTS)
SELECT s.name
FROM SalesPerson s
WHERE NOT EXISTS (
    SELECT 1 
    FROM Orders AS o
    LEFT JOIN Company AS c
    ON c.com_id = o.com_id
    WHERE c.com_id = 1
    AND s.sales_id = o.sales_id
)
