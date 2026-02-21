SELECT
    c.customer_id, c.name, o.order_id, o.amount
FROM Customers c LEFT JOIN Orders o
ON c.customer_id = o.customer_id;
