DELIMITER //

CREATE PROCEDURE SendTweet (
	IN username nvarchar(20),
    IN tid int
)
BEGIN
	CALL ActiveSession(@ID);

	INSERT
    INTO twitter.message
    SELECT @ID, username, tid, null, current_date(), 1
    WHERE EXISTS (SELECT *
					FROM twitter.user 
                    WHERE ID = username) -- check user exists
	AND EXISTS (SELECT *
					FROM twitter.tweet
                    WHERE ID = tid)
    AND NOT EXISTS (SELECT *
						FROM twitter.blocked as B
						WHERE B.SRC_ID = username AND B.DEST_ID = @ID); -- check sender is not blocked
END //

DELIMITER ;