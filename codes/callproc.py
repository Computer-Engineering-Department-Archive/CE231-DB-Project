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
