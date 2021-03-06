CREATE TABLE twitter.reply(
    ID						INT AUTO_INCREMENT NOT NULL,
    TWEET_ID					INT NOT NULL,
    REPLY_ID					INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (TWEET_ID) REFERENCES twitter.tweet(ID) ON DELETE CASCADE,
    FOREIGN KEY (REPLY_ID) REFERENCES twitter.tweet(ID) ON DELETE CASCADE)