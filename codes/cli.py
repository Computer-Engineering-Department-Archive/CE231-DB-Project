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
                                       input('date of birth: '), datetime.today().strftime('%Y-%m-%d'),
                                       input('biography: ')])
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

    callproc.commit(db)


def handler():
    # index()

    end = False

    while True:
        uin = input('> ')
        dec = uin.split()

        print(dec)

        if dec[0] == 'actvses':
            active_session(dec)
        elif dec[0] == 'tweet':
            tweet(dec, uin)
        elif dec[0] == 'follow':
            follow(dec)
        elif dec[0] == 'unfollow':
            unfollow(dec)
        elif dec[0] == 'block':
            block(dec)
        elif dec[0] == 'unblock':
            unblock(dec)
        elif dec[0] == 'timeline':
            timeline(dec)
        elif dec[0] == 'userack':
            user_activity(dec)
        elif dec[0] == 'reply':
            reply(dec)
        elif dec[0] == 'hashtag':
            hashtag(dec)
        elif dec[0] == 'like':
            like(dec)
        elif dec[0] == 'message':
            message(dec)
        elif dec[0] == 'help':
            help_message()
        elif dec[0] == 'logout':
            index()
        elif dec[0] == 'exit':
            break

        callproc.commit(db)


def help_message():
    print('commands::\n' +
          'actvses                                           active session\n' +
          'tweet <-p::post[content], -s::self>\n' +
          'follow [username]\n' +
          'unfollow [username]\n' +
          'block [username]\n' +
          'unblock [username]\n' +
          'timeline\n' +
          'user activity [username]\n' +
          'reply <-p [id, content], -s[show]>\n' +
          'hashtag [tag]\n' +
          'like <-u::upvote [id], -c::count [id], -l::list [id], -t::trend>\n' +
          'message <{send <-m::send_message [username, content], -t::send_tweet [username, id]}\n' +
          '         {get <-m::get_message [username], -t::get_tweet [username]}\n' +
          '         {getl::get_list <-m::get_message_list, -t::get_tweet_list}\n')


def message(dec):
    if dec[1] == 'send':  # send
        if dec[2] == '-m':  # message
            if len(dec) != 5:
                print('invalid input')
                return

            callproc.send_message(cursor, [dec[3], dec[4]])
        elif dec[2] == '-t':  # tweet
            if len(dec) != 5:
                print('invalid input')
                return

            callproc.send_tweet(cursor, [dec[3], dec[4]])
    elif dec[1] == 'get':  # get
        if dec[2] == '-m':  # message
            if len(dec) != 4:
                print('invalid input')
                return

            result = callproc.send_message(cursor, [dec[3]])
            print(load.fetch(result))
        elif dec[2] == '-t':  # tweet
            if len(dec) != 4:
                print('invalid input')
                return

            result = callproc.send_tweet(cursor, [dec[3]])
            print(load.fetch(result))
    elif dec[1] == 'getl':  # get list
        if dec[2] == '-m':  # message
            if len(dec) != 3:
                print('invalid input')
                return

            result = callproc.get_message_list(cursor)
            print(load.fetch(result))
        elif dec[2] == '-t':  # tweet
            if len(dec) != 3:
                print('invalid input')
                return

            result = callproc.get_tweet_list(cursor)
            print(load.fetch(result))


def like(dec):
    if dec[1] == '-u':  # upvote
        if len(dec) != 3:
            print('invalid input')
            return

        callproc.upvote(cursor, [dec[2]])
    elif dec[1] == '-c':  # count
        if len(dec) != 3:
            print('invalid input')
            return

        result = callproc.upvote_count(cursor, [dec[2]])
        print(load.fetch(result))
    elif dec[1] == '-l':  # list
        if len(dec) != 3:
            print('invalid input')
            return

        result = callproc.upvote_list(cursor, [dec[2]])
        print(load.fetch(result))
    elif dec[1] == '-t':  # trend
        if len(dec) != 3:
            print('invalid input')
            return

        result = callproc.trends(cursor)
        load.display_tweets(load.get_table(load.fetch(result)))


def hashtag(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    result = callproc.get_hashtag(cursor, [dec[1]])
    load.display_tweets(load.get_table(load.fetch(result)))


def reply(dec):
    if dec[1] == '-p':  # post
        if len(dec) != 4:
            print('invalid input')
            return

        callproc.reply(cursor, [dec[2], dec[3]])
    elif dec[1] == '-s':  # show
        if len(dec) != 3:
            print('invalid input')
            return

        result = callproc.show_replies(cursor, [dec[2]])
        load.display_tweets(load.get_table(load.fetch(result)))


def user_activity(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    result = callproc.user_activity(cursor, [dec[1]])
    load.display_tweets(load.get_table(load.fetch(result)))


def timeline(dec):
    if len(dec) != 1:
        print('invalid input')
        return

    result = callproc.timeline(cursor)
    load.display_tweets(load.get_table(load.fetch(result)))


def unblock(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    callproc.unblock(cursor, [dec[1]])


def block(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    callproc.block(cursor, [dec[1]])


def unfollow(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    callproc.unfollow(cursor, [dec[1]])


def follow(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    callproc.follow(cursor, [dec[1]])


def tweet(dec, uin):
    if dec[1] == '-p':  # post
        content = uin[8:]

        if len(content) > 256:
            print('tweet character limit is 256')
            return

        callproc.tweet(cursor, [content])
    elif dec[1] == '-s':  # self
        if len(dec) != 3:
            print('invalid input')
            return

        result = callproc.get_personal_tweet(cursor)
        load.display_tweets(load.get_table(load.fetch(result)))


def active_session(dec):
    if len(dec) != 1:
        print('invalid input')
        return

    callproc.login_history(cursor)


if __name__ == '__main__':
    db = connect.connect()
    cursor = db.cursor(named_tuple=False)

    handler()
