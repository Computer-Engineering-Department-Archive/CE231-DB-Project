DELIMITER //

CREATE PROCEDURE Unfollow (
    IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);
    
	DELETE 
    FROM twitter.follower 
	WHERE SRC_ID=@ID and DEST_ID=username;
END //

DELIMITER ;