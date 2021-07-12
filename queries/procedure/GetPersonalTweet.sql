DELIMITER //

CREATE PROCEDURE GetPersonalTweet (
)
BEGIN
	CALL ActiveSession(@ID);

	SELECT *
    FROM twitter.tweet
    WHERE USER_ID = @ID
    ORDER BY POSTAGE DESC;
END //

DELIMITER ;