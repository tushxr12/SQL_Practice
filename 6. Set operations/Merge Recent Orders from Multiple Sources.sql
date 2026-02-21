SELECT * FROM OnlineOrders
WHERE order_date >= '2023-01-01'
UNION
SELECT * FROM StoreOrders
WHERE order_date >= '2023-01-01'
ORDER BY amount DESC;
