INSERT INTO twitter.liked SELECT 2,'M_salehi_V'
WHERE NOT EXISTS(
SELECT * FROM twitter.blocked AS B, twitter.tweet AS T
WHERE T.ID = 2 AND T.USER_ID = B.SRC_ID AND B.DEST_ID = 'M_salehi_V')