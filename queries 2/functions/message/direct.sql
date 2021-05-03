INSERT INTO twitter.message (SENDER_ID, RECEIVER_ID, TWEET_ID, POSTAGE, TYPE) SELECT 'bardiArdakanian','M_salehi_V', 13, current_date(), 0
FROM twitter.tweet AS T
WHERE T.ID = 13
AND 'M_salehi_V' NOT IN (
	SELECT B.DEST_ID 
	FROM twitter.blocked AS B
	WHERE T.USER_ID = B.SRC_ID)
AND NOT EXISTS(
	SELECT * FROM twitter.blocked AS B
	WHERE (B.SRC_ID = 'bardiArdakanian' AND B.DEST_ID = 'M_salehi_V') OR (B.SRC_ID = 'M_salehi_V' AND B.DEST_ID = 'bardiArdakanian'))