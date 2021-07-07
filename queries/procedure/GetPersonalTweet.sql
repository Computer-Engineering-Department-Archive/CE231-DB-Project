DELIMITER //

CREATE PROCEDURE GetPersonalTweet (
)
BEGIN
	CALL ActiveSession(@ID);

	SELECT *
    FROM twitter.tweet
    WHERE tweet.USER_ID = @ID;
END //

DELIMITER ;