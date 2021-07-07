DELIMITER //

CREATE PROCEDURE Block (
    IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);
    
	INSERT
    INTO twitter.blocked 
    VALUES(@ID, username);
END //

DELIMITER ;