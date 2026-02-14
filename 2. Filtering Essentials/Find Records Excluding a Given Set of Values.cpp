SELECT * FROM Orders
WHERE status NOT IN ('Cancelled', 'Returned');
