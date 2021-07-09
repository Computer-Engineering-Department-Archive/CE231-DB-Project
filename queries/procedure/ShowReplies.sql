DELIMITER //

CREATE PROCEDURE ShowReplies (
	IN tid int
)
BEGIN
	CALL ActiveSession(@ID);
    SET @RID=(SELECT login.ID
				FROM twitter.login 
				ORDER BY id 
				DESC LIMIT 1); -- reciver id
    SET @SID=(SELECT USER_ID
				FROM tweet
                WHERE ID = tid); -- sender id
    
	SELECT ID, USER_ID, CONTENT, OSTAGE
    FROM tweet
    WHERE ID IN (SELECT REPLY_ID
					FROM reply
                    WHERE TWEET_ID = tid)
	AND NOT EXISTS (SELECT * 
						FROM twitter.blocked 
                        WHERE SRC_ID=@SID and DEST_ID=@RID)
    AND NOT EXISTS (SELECT * 
						FROM twitter.blocked AS B, twitter.reply AS R JOIN twitter.tweet AS T ON T.ID = R.REPLY_ID 
                        WHERE (B.SRC_ID = T.ID and B.DEST_ID = @RID) or (B.SRC_ID = @RID and B.DEST_ID = T.ID));
END //

DELIMITER ;