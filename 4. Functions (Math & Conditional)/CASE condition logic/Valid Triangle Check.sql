SELECT x,y,z,
CASE 
    WHEN x+y > z THEN 'Yes'
    ELSE 'No'
END as triangle
FROM Triangle;
