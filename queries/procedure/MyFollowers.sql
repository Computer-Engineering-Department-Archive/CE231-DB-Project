DELIMITER //

CREATE PROCEDURE MyFollowers (
)
BEGIN
	CALL ActiveSession(@ID);
    
	SELECT SRC_ID
    FROM twitter.follower
    WHERE DEST_ID=@ID;
END //

DELIMITER ;