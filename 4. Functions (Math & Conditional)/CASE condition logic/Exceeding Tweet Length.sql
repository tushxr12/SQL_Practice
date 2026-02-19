SELECT tweet_id
FROM Tweet
WHERE char_length(content) > 15;
