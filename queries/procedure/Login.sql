DELIMITER //

CREATE PROCEDURE Login (
	IN username nvarchar(20),
    IN password nvarchar(128)
)
BEGIN
	SELECT *
	FROM twitter.user AS U
	WHERE U.ID = username AND U.PASSWORD_HASH = SHA2(password, 256);
END //

DELIMITER ;