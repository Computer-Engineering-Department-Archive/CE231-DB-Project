DELIMITER //

CREATE PROCEDURE GetAllUsers()
BEGIN
	SELECT *  FROM twitter.user;
END //

DELIMITER ;