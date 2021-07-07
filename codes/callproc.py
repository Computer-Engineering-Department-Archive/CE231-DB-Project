def commit(db):
    db.commit()


def refresh_cursor(cursor):
    cursor.fetchall()


def login(cursor, args):
    cursor.callproc('Login', args)

    return cursor.stored_results()


def get_all_users(cursor):
    cursor.callproc('GetAllUsers')

    return cursor.stored_results()


def contains_user(cursor, args):
    cursor.callproc('ContainsUser', args)

    return cursor.stored_results()


def register(cursor, args):
    cursor.callproc('Register', args)

    print(cursor.rowcount, "record inserted.")


def login_history(cursor):
    cursor.callproc('LoginHistory')

    return cursor.stored_results()


def tweet(cursor, args):
    cursor.callproc('Tweet', args)


def get_user_tweet(cursor, args):
    cursor.callproc('GetUserTweet', args)

    return cursor.stored_results()


def get_hashtag(cursor, args):
    cursor.callproc('GetHashtag', args)

    return cursor.stored_results()


def follow(cursor, args):
    cursor.callproc('Follow', args)


def unfollow(cursor, args):
    cursor.callproc('Unfollow', args)


def my_followers(cursor):
    cursor.callproc('MyFollowers')

    return cursor.stored_results()


def get_followers(cursor, args):
    cursor.callproc('GetFollowers', args)

    return cursor.stored_results()


def my_following(cursor):
    cursor.callproc('MyFollowing')

    return cursor.stored_results()


def get_following(cursor, args):
    cursor.callproc('GetFollowing', args)

    return cursor.stored_results()


def block(cursor, args):
    cursor.callproc('Block', args)


def unblock(cursor, args):
    cursor.callproc('Unblock', args)


def blocked(cursor, args):
    cursor.callproc('Blocked', args)

    return cursor.stored_results()


def timeline(cursor):
    cursor.callproc('Timeline')

    return cursor.stored_results()


def user_activity(cursor, args):
    cursor.callproc('UserActivity', args)

    return cursor.stored_results()


def reply(cursor, args):
    cursor.callproc('Reply', args)


def show_replies(cursor, args):
    cursor.callproc('ShowReplies', args)

    return cursor.stored_results()


def upvote(cursor, args):
    cursor.callproc('Upvote', args)


def upvote_count(cursor, args):
    cursor.callproc('UpvoteCount', args)

    return cursor.stored_results()


def upvote_list(cursor, args):
    cursor.callproc('UpvoteList', args)

    return cursor.stored_results()


def trends(cursor):
    cursor.callproc('Trends')

    return cursor.stored_results()


def send_message(cursor, args):
    cursor.callproc('SendMessage', args)


def send_tweet(cursor, args):
    cursor.callproc('SendTweet', args)


def get_message(cursor, args):
    cursor.callproc('GetMessage', args)

    return cursor.stored_results()


def get_tweet(cursor, args):
    cursor.callproc('GetTweet', args)

    return cursor.stored_results()


def get_message_list(cursor):
    cursor.callproc('GetMessageList')

    return cursor.stored_results()


def get_tweet_list(cursor):
    cursor.callproc('GetTweetList')

    return cursor.stored_results()
