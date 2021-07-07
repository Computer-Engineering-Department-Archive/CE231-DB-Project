DELIMITER //

CREATE PROCEDURE Blocked (
    IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);
    
	SELECT *
    FROM twitter.blocked
    WHERE SRC_ID=@ID and DEST_ID=username;
END //

DELIMITER ;