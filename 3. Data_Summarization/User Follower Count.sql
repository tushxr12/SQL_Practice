SELECT user_id, COUNT(*) as followers_count
FROM Followers
GROUP BY user_id;
