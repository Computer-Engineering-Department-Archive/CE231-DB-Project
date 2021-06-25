DELIMITER //

CREATE TRIGGER PulloutTag
AFTER INSERT 
ON twitter.tweet
FOR EACH ROW
BEGIN
    SET @CONTENT=(SELECT tweet.CONTENT 
					FROM twitter.tweet
					ORDER BY id DESC  
					LIMIT 1);
	
    SET @LEN=CHAR_LENGTH(@CONTENT);
                    
	SET @ID=(SELECT ID 
				FROM twitter.tweet
				ORDER BY id DESC  
				LIMIT 1);
                
	SET @P=LOCATE('#', @CONTENT);
    
    WHILE @P > 0 DO
		SET @TAG=SUBSTRING(@CONTENT, @P, 6);
        INSERT INTO twitter.hashtag VALUES(@ID, @TAG);
        
        SET @CONTENT=SUBSTRING(@CONTENT, @P + 6, @LEN - @P - 5);
        SET @P=LOCATE('#', @CONTENT);
	END WHILE;
END //

DELIMITER ;