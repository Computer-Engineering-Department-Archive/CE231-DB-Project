SELECT *
FROM twitter.message AS M, twitter.tweet AS T
WHERE M.RECEIVER_ID = 'M_salehi_V' AND T.ID = M.TWEET_ID
AND 'M_salehi_V' NOT IN (
	SELECT B.DEST_ID 
	FROM twitter.blocked AS B
	WHERE T.USER_ID = B.SRC_ID)
ORDER BY M.POSTAGE DESC