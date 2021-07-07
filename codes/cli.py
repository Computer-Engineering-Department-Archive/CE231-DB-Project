from datetime import datetime

import connect
import callproc
import load


def index():
    log = False

    while not log:
        uin = int(input('welcome to Twitter:)\n1.Register\n2.Login\n'))

        if uin == 1:
            print('please insert your personal information')
            callproc.register(cursor, [input('firstname: '), input('lastname: '),
                                       input('username: '), input('password: '),
                                       input('date of birth: '), datetime.today().strftime('%Y-%m-%d'), 'biography: '])
            print('account created, welcome to Twitter')
            log = True
        elif uin == 2:
            res = callproc.login(cursor, [input('username: '), input('password: ')])
            res = load.fetch(res)[0][0]

            if res == 1:
                log = True
                print('welcome back')
            else:
                print('username or password is incorrect, try again')
        else:
            print('invalid input')


def menu():
    end = False

    # commands
    # -lh                       login history
    # -t                        tweet
    # -pt                       personal tweets
    while True:
        uin = input('> ')
        dec = uin.split()

        cmd = dec[0]

        print(dec)

        if cmd == '-lh':
            callproc.login_history(cursor)
        elif cmd == '-t':
            content = uin[len(cmd) + 1:]

            if len(content) > 256:
                print('tweet character limit is 256')
                continue

            callproc.tweet(cursor, [content])
        elif cmd == '-pt':
            if len(dec) > 1:
                print('invalid input')
                continue

            result = callproc.get_personal_tweet(cursor)
            load.display_tweets(load.get_table(load.fetch(result)))
        if cmd == 'exit':
            break

    callproc.commit(db)


if __name__ == '__main__':
    db = connect.connect()
    cursor = db.cursor(named_tuple=False)

    # index()
    menu()
