DELIMITER //

CREATE PROCEDURE GetFollowers (
	IN username nvarchar(20)
)
BEGIN
	SELECT SRC_ID
    FROM twitter.follower
    WHERE DEST_ID=username;
END //

DELIMITER ;