import connect
import callproc
import load


def membership():
    print('1.Register\n2.Login')

    return int(input())


def loop():
    print('welcome to Twitter:)')
    result = None

    while result is None:
        uin = membership()

        if uin == 1:
            print('please insert your personal info: [firstname, lastname, id, password, born, joined, bio]')
            callproc.register(cursor, [input(), input(), input(), input(), input(), input(), input()])
        elif uin == 2:
            result = callproc.login(cursor, input(), input())
            result = next(result).fetchall()

            if len(result) == 0:
                print('invalid username or password')
                result = None
        else:
            print('invalid input')

    table = None
    keys = None

    table, keys = load.get_table(result)
    load.pretty_table(table, keys)

    username = load.get_username(table)
    print('you logged in as:', username)


if __name__ == '__main__':
    db = connect.connect()
    cursor = connect.get_cursor(db)

    loop()

    callproc.commit(db)