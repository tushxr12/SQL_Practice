SELECT
    DISTINCT c.title
FROM 
    Content AS c
JOIN
    TVProgram AS t 
ON t.content_id = c.content_id
WHERE 
    c.Kids_content = 'Y'
    AND c.content_type = 'Movies'
    AND t.program_date BETWEEN '2020-06-01' AND '2020-06-30';
