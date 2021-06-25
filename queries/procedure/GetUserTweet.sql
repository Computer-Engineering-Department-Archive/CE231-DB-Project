DELIMITER //

CREATE PROCEDURE GetUserTweet (
	IN username nvarchar(20)
)
BEGIN
	SELECT *
    FROM twitter.tweet
    WHERE tweet.USER_ID = username;
END //

DELIMITER ;