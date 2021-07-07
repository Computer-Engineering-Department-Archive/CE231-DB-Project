CREATE TABLE twitter.message(
    SENDER_ID					NVARCHAR(20) 	NOT NULL,
    RECEIVER_ID					NVARCHAR(20)	NOT NULL,
    TWEET_ID					INT,
    CONTENT						NVARCHAR(256),
    POSTAGE						DATE,
    TYPE						INT NOT NULL,
    FOREIGN KEY (SENDER_ID) REFERENCES twitter.user(ID) ON DELETE CASCADE,
    FOREIGN KEY (RECEIVER_ID) REFERENCES twitter.user(ID) ON DELETE CASCADE,
    FOREIGN KEY (TWEET_ID) REFERENCES twitter.tweet(ID) ON DELETE CASCADE)
    
/*
	TYPE == 0        	TWEET
	TYPE == 1			CONTENT
*/