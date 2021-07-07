DELIMITER //

CREATE PROCEDURE Unblock (
    IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);
    
	DELETE
    FROM twitter.blocked 
    WHERE SRC_ID=@ID and DEST_ID=username;
END //

DELIMITER ;