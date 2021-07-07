DELIMITER //

CREATE PROCEDURE UpvoteCount (
    IN tid int
)
BEGIN
	CALL ActiveSession(@ID);
	
	SELECT COUNT(TWEET_ID)
    FROM twitter.liked
    WHERE TWEET_ID = tid
    AND NOT EXISTS (SELECT * 
						FROM twitter.blocked as B, twitter.tweet AS T
						WHERE T.ID = tweet_id AND T.USER_ID = B.SRC_ID AND @ID = B.DEST_ID);
END //

DELIMITER ;