DELIMITER //

CREATE PROCEDURE ActiveSession (
	OUT ID nvarchar(20)
)
BEGIN
	SET ID=(
	SELECT L.ID
	FROM twitter.login AS L
    ORDER BY L.pk
    DESC LIMIT 1);
END //

DELIMITER ;