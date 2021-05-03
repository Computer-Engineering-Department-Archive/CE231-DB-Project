SELECT * FROM twitter.liked AS L
WHERE L.TWEET_ID = 6 
AND L.USER_ID NOT IN ( -- remove blocked account
SELECT B.SRC_ID FROM twitter.blocked AS B
JOIN twitter.tweet AS T ON B.DEST_ID = T.USER_ID
WHERE L.TWEET_ID = T.ID)
AND NOT EXISTS( -- display nothing if the account has been blocked
SELECT * FROM twitter.blocked AS B, twitter.tweet AS T
WHERE T.ID = 6 AND T.USER_ID = B.SRC_ID AND B.DEST_ID = 'bardiArdakanian') 