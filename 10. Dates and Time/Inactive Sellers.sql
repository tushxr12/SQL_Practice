SELECT 
    s.seller_name
FROM Seller AS s
LEFT JOIN Orders AS o 
ON o.seller_id = s.seller_id 
   AND YEAR(o.sale_date) = 2020
GROUP BY s.seller_id, s.seller_name
HAVING COUNT(o.order_id) = 0
ORDER BY s.seller_name;
