SELECT t.transaction_id
FROM Transactions t
JOIN (
    SELECT day, MAX(amount) AS max_amount
    FROM Transactions
    GROUP BY day
) max_t
ON t.day = max_t.day AND t.amount = max_t.max_amount
ORDER BY t.transaction_id ASC;
