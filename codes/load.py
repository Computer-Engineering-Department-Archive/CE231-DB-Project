def refactor(src):
    src = src[4:-1].strip()
    src = src.replace(', U', ' : U')
    src = src.replace('\', ', ' : ')
    src = src.replace('), ', ') : ')
    src = src.replace('datetime.', '')

    return src


def fetch(result):
    return next(result).fetchall()


def get_table(rows):
    table = []
    keys = {}

    for row in rows:
        # print(row)
        result = refactor(str(row))
        # print(result)
        # print()

        column = {}

        for index, i in enumerate(result.split(' : ')):
            pair = i.strip().split('=')

            key = pair[0]
            value = pair[1].replace('\'', '')

            keys[index] = key
            column[key] = value

        table.append(column)

    return table, keys


def display_tweets(table):
    builder = ''
    for i in range(0, len(table)):
        builder = builder + '-----------------------------------------------------------------\n'
        builder = builder + 'username: <' + table[i].get('USER_ID') + '> tid: <' + table[i].get('ID') + '>\n'
        builder = builder + table[i].get('CONTENT') + '\n'
        builder = builder + table[i].get('POSTAGE') + '\n'
        builder = builder + '-----------------------------------------------------------------\n\n'

    print(builder)
