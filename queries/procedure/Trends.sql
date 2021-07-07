DELIMITER //

CREATE PROCEDURE Trends (
)
BEGIN
	SET @AVERAGE=(SELECT AVG(A.CNT)
					FROM (SELECT COUNT(USER_ID) 
							AS CNT 
                            FROM twitter.liked 
                            GROUP BY TWEET_ID) 
						  AS A);
                          
	SELECT *
    FROM twitter.tweet AS T
    WHERE T.ID IN (SELECT TWEET_ID
					FROM LIKED
					GROUP BY TWEET_ID
					HAVING COUNT(USER_ID) > @AVERAGE);
END //

DELIMITER ;