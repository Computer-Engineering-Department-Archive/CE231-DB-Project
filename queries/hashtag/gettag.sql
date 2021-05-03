SELECT USER_ID, CONTENT, POSTAGE FROM twitter.hashtag AS TAG, twitter.tweet AS T
WHERE TAG.TWEET_ID = T.ID AND TAG.TAG = '#abcde' AND T.USER_ID = 'bardiArdakanian'
AND NOT EXISTS(
SELECT * FROM twitter.blocked AS B
WHERE B.SRC_ID = T.USER_ID AND B.DEST_ID = 'M_salehi_V')