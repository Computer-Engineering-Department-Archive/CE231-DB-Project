DELIMITER //

CREATE PROCEDURE Follow (
    IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);
    
	INSERT
    INTO twitter.follower 
    VALUES(@ID, username);
END //

DELIMITER ;