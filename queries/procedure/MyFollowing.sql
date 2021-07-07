DELIMITER //

CREATE PROCEDURE MyFollowing (
)
BEGIN
	CALL ActiveSession(@ID);
    
	SELECT DEST_ID
    FROM twitter.follower
    WHERE SRC_ID=@ID;
END //

DELIMITER ;