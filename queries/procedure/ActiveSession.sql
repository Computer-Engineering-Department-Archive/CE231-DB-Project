DELIMITER //

CREATE PROCEDURE ActiveSession (
	OUT ID nvarchar(20)
)
BEGIN
	SET ID=(
	SELECT login.ID
	FROM twitter.login 
    ORDER BY id 
    DESC LIMIT 1);
END //

DELIMITER ;