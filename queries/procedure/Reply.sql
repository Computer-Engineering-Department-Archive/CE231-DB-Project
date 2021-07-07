DELIMITER //

CREATE PROCEDURE Reply (
	IN tweet_id int,
    IN content nvarchar(256)
)
BEGIN
	CALL ActiveSession(@ID);
	CALL Tweet(content);
    SET @LID=(SELECT tweet.ID 
					FROM twitter.tweet
					ORDER BY id DESC  
					LIMIT 1); -- last inserted id
	SET @SID=(SELECT login.ID
				FROM twitter.login 
				ORDER BY id 
				DESC LIMIT 1); -- sender id
	
    INSERT
    INTO twitter.reply (TWEET_ID, REPLY_ID) 
    SELECT tweet_id, @LID
    WHERE NOT EXISTS (
		SELECT *
        FROM twitter.tweet as T, twitter.blocked as B
        WHERE T.ID = tweet_id AND ((T.USER_ID = B.SRC_ID AND @SID = B.DEST_ID) or (T.USER_ID = B.DEST_ID AND @SID = B.SRC_ID)));
END //

DELIMITER ;