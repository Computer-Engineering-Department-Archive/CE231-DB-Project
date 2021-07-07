DELIMITER //

CREATE PROCEDURE GetFollowing (
	IN username nvarchar(20)
)
BEGIN
	SELECT DEST_ID
    FROM twitter.follower
    WHERE SRC_ID=username;
END //

DELIMITER ;