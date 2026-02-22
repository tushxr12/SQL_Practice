SELECT C.customer_id, C.customer_name
FROM customers as C
LEFT JOIN orders as O 
ON C.customer_id = O.customer_id
GROUP BY C.customer_id
HAVING
    SUM(O.product_name = 'A') > 0 AND
    SUM(O.product_name = 'B') > 0 AND
    SUM(O.product_name = 'C') = 0
ORDER BY C.customer_id;
