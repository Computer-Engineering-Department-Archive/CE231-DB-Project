SELECT T.USER_ID, T.CONTENT, T.POSTAGE
FROM twitter.tweet AS T
WHERE (T.USER_ID = 'M_salehi_V') and not exists (SELECT * FROM twitter.blocked as B WHERE B.SRC_ID = 'M_salehi_V' and B.DEST_ID = 'Stalin00')