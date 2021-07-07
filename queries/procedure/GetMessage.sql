DELIMITER //

CREATE PROCEDURE GetMessage (
	IN username nvarchar(20)
)
BEGIN
	CALL ActiveSession(@ID);

	SELECT *
	FROM twitter.message
	WHERE TYPE=0 AND SENDER_ID = username AND RECEIVER_ID = @ID
    AND NOT EXISTS (SELECT *
						FROM twitter.blocked
                        WHERE SRC_ID = @ID AND DEST_ID = username)
	ORDER BY POSTAGE DESC;
END //

DELIMITER ;