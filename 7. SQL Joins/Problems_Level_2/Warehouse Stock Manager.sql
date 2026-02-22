SELECT W.name as warehouse_name, 
    SUM(P.Width * P.Length * P.Height * W.units) AS volume
FROM Warehouse W 
JOIN Products P 
ON W.product_id = P.product_id
GROUP BY W.name;
