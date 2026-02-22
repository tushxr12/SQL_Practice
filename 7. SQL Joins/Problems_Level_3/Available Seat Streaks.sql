SELECT 
    DISTINCT C1.seat_id
FROM Cinema C1 
JOIN Cinema C2 
ON ABS(C1.seat_id - C2.seat_id) = 1 
AND C1.free = true 
AND C2.free = true 
ORDER BY C1.seat_id;
