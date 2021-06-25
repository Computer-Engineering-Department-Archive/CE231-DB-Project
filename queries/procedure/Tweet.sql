DELIMITER //

CREATE PROCEDURE Tweet (
    IN content nvarchar(256)
)
BEGIN
    CALL ActiveSession(@ID);

	INSERT
    INTO twitter.tweet (USER_ID, CONTENT, POSTAGE)
    VALUES(@ID, content, current_date());
END //

DELIMITER ;