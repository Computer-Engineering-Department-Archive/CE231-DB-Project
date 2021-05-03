INSERT INTO twitter.reply(TWEET_ID, REPLY_ID) SELECT 6,11
WHERE NOT EXISTS (
	SELECT * FROM twitter.blocked AS B, twitter.tweet AS T1, twitter.tweet AS T2
    WHERE (T1.ID = 10 AND T1.USER_ID = B.SRC_ID) AND (T2.ID = 11 AND T2.USER_ID = B.DEST_ID)
)