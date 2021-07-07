import connect
import callproc
import load


def index():
    print('welcome to Twitter:)')
    print('1.Register\n2.Login')

    res = None

    while res is None:
        uin = int(input())

        if uin == 1:
            print('please insert your personal info: [firstname, lastname, id, password, born, joined, bio]')
            callproc.register(cursor, [input(), input(), input(), input(), input(), input(), input()])
        elif uin == 2:
            res = callproc.login(cursor, [input(), input()])
            res = next(res).fetchall()

            if len(res) == 0:
                print('invalid username or password')
                res = None
        else:
            print('invalid input')

    table = None
    keys = None

    table, keys = load.get_table(res)

    # username = load.get_username(table)
    # print('you logged in as:', username)


if __name__ == '__main__':
    db = connect.connect()
    # cursor = connect.get_cursor(db)
    cursor = db.cursor(named_tuple=False)

    # index()
    # args = ['#ccccc #bbbbb']
    # callproc.tweet(cursor, args)
    # result = callproc.get_tweet_list(cursor)
    # x = next(result).fetchall()
    # print(x)
    # table, keys = load.get_table(load.fetch(result))
    # load.display_tweets(table, keys)

    callproc.commit(db)
