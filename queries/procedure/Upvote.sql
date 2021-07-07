DELIMITER //

CREATE PROCEDURE Upvote (
    IN tweet_id int
)
BEGIN
	CALL ActiveSession(@ID);
    
	INSERT
    INTO twitter.liked 
    SELECT tweet_id, @ID
    WHERE NOT EXISTS (SELECT * 
						FROM twitter.blocked as B, twitter.tweet AS T
						WHERE T.ID = tweet_id AND T.USER_ID = B.SRC_ID AND @ID = B.DEST_ID);
END //

DELIMITER ;