DELIMITER //

CREATE PROCEDURE ContainsUser (
	IN username nvarchar(20)
)
BEGIN
	SELECT *
	FROM twitter.user AS U
	WHERE U.ID = username;
END //

DELIMITER ;