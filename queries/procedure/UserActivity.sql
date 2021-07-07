DELIMITER //

CREATE PROCEDURE UserActivity (
	IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);
    
	SELECT T.ID, T.USER_ID, T.CONTENT, T.POSTAGE
	FROM twitter.tweet as T
    WHERE 
    T.USER_ID = username
	AND NOT EXISTS (SELECT * FROM twitter.blocked WHERE SRC_ID=@ID and DEST_ID=username)
    ORDER BY T.POSTAGE DESC;
END //

DELIMITER ;