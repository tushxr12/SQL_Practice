SELECT Round(Sum(CASE
                   WHEN order_date = customer_pref_delivery_date THEN 1
                   ELSE 0
                 END) / ( Count(*) ) * 100.0, 2) AS immediate_percentage
FROM   delivery; 
