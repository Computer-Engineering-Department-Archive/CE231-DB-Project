DELIMITER //

CREATE PROCEDURE GetHashtag (
    IN TAG nvarchar(6)
)
BEGIN
	SELECT *
    FROM twitter.tweet
    WHERE tweet.ID IN (SELECT TWEET_ID
					FROM twitter.hashtag
					WHERE hashtag.TAG = TAG);
END //

DELIMITER ;