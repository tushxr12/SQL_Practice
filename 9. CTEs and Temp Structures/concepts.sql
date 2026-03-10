-- Compute each restaurant’s average rating and select those above 4.0
WITH average_ratings (restaurant, avg_rating) AS (
  SELECT
    restaurant,
    AVG(stars) as avg_rating
  FROM ratings
  GROUP BY restaurant
)
SELECT 
  restaurant,
  avg_rating
FROM average_ratings 
WHERE avg_rating > 4.00;

-- Select restaurants whose average rating is greater than 4.0 and also show their minimum rating.
WITH average_ratings (restaurant, avg_rating, min_rating) AS (
  SELECT
    restaurant,
    AVG(stars) as avg_rating,
    MIN(stars) as min_rating
  FROM ratings
  GROUP BY restaurant
)
SELECT 
  restaurant,
  avg_rating,
  min_rating
FROM average_ratings 
WHERE avg_rating > 4.00;


-- Refactoring nested subquery with CTEs ---

-- Find restaurants whose average rating is above the overall average rating.

-- Subquery version 
SELECT 
  restaurant,
  AVG(stars) AS avg_stars
FROM ratings
GROUP BY restaurant
HAVING AVG(stars) > (SELECT AVG(stars) FROM ratings)
ORDER BY avg_stars DESC, restaurant ASC;

# CTE version
WITH overall_average_rating AS 
(
  SELECT 
    AVG(stars) as overall_average
  FROM ratings
),
avg_by_restaurant AS 
(
  SELECT 
    restaurant,
    AVG(stars) AS avg_stars 
  FROM ratings 
  GROUP BY restaurant
)
SELECT
  a.restaurant,
  a.avg_stars
FROM avg_by_restaurant a
CROSS JOIN overall_average_rating b
WHERE a.avg_stars > b.overall_average
ORDER BY a.avg_stars DESC, a.restaurant ASC;

# changing table name
ALTER TABLE sales_date RENAME TO sales_data 
  
-- Multi-Step CTE Pipeline  ---

-- Identify the top-performing salesperson by total sales.

-- Subquery version
SELECT
  salesperson, SUM(amount) as total_sales
FROM sales_data
GROUP BY
  salesperson
HAVING total_sales = (
  SELECT MAX(total_sales)
  FROM (
    SELECT SUM(amount) AS total_sales
    FROM sales_data
    GROUP BY salesperson
  ) AS t
)

-- CTE Version
WITH salesperson_amount AS
(
  SELECT 
    salesperson,
    SUM(amount) as total_sales
  FROM sales_data
  GROUP BY salesperson
),
max_sales AS 
(
  SELECT MAX(total_sales) AS max_sales_overall FROM salesperson_amount
)
SELECT 
  salesperson, total_sales
FROM salesperson_amount AS t1 
JOIN max_sales AS t2 
ON t1.total_sales = t2.max_sales_overall;

SELECT connection_id();
