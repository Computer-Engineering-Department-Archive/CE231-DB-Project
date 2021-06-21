def commit(db):
    db.commit()


def login(cursor, username, password):
    args = [username, password]
    cursor.callproc('Login', args)

    return cursor.stored_results()


def get_all_users(cursor):
    cursor.callproc('GetAllUsers')

    return cursor.stored_results()


def contains_user(cursor, username):
    args = [username]
    cursor.callproc('ContainsUser', args)

    return cursor.stored_results()


def register(cursor, args):
    cursor.callproc('Register', args)

    print(cursor.rowcount, "record inserted.")

# def login_history
