DELIMITER //

CREATE PROCEDURE AddSession (
	IN ID nvarchar(20)
)
BEGIN
	INSERT
    INTO twitter.login 
    VALUES(ID, current_date());
END //

DELIMITER ;