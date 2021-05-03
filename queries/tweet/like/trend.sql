SELECT COUNT(TWEET_ID), T.ID, T.USER_ID, T.CONTENT, T.POSTAGE
FROM twitter.liked AS L
JOIN twitter.tweet AS T ON T.ID = L.TWEET_ID
GROUP BY L.TWEET_ID
ORDER BY COUNT(TWEET_ID) DESC