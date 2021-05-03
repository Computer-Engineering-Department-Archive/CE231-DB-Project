SELECT tweet.USER_ID, tweet.CONTENT, tweet.POSTAGE 
FROM twitter.tweet, twitter.follower, twitter.blocked
WHERE (follower.SRC_ID = blocked.SRC_ID and follower.DEST_ID != blocked.DEST_ID) and (follower.DEST_ID = tweet.USER_ID) and (follower.SRC_ID = 'bardiArdakanian');