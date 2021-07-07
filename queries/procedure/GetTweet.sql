DELIMITER //

CREATE PROCEDURE GetTweet (
	IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);

	SELECT *
	FROM twitter.message AS M
	WHERE M.TYPE=1 AND M.SENDER_ID = username AND M.RECEIVER_ID = @ID
    AND NOT EXISTS (SELECT *
						FROM twitter.blocked AS B
                        WHERE B.SRC_ID = @ID AND B.DEST_ID = username)
	AND NOT EXISTS (SELECT *
						FROM twitter.blocked AS B, twitter.tweet AS T
						WHERE T.ID = M.TWEET_ID AND B.SRC_ID = T.USER_ID AND B.DEST_ID = M.RECEIVER_ID) -- reveiver of the tweet is not blocked
	ORDER BY POSTAGE DESC;
END //

DELIMITER ;