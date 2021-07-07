DELIMITER //

CREATE PROCEDURE SendMessage (
	IN username nvarchar(20),
    IN content nvarchar(256)
)
BEGIN
	CALL ActiveSession(@ID);

	INSERT
    INTO twitter.message
    SELECT @ID, username, null, content, current_date(), 0
    WHERE EXISTS (SELECT *
					FROM twitter.user 
                    WHERE ID = username) -- check user exists
    AND NOT EXISTS (SELECT *
						FROM twitter.blocked as B
						WHERE B.SRC_ID = username AND B.DEST_ID = @ID); -- check sender is not blocked
END //

DELIMITER ;