def refactor(src):
    src = src[1:-1].strip()
    src = src.replace(', ', ' : ')

    return src


def fetch(result):
    return next(result).fetchall()


def get_table(rows):
    table = []

    for row in rows:
        # print(row)
        result = refactor(str(row))
        # print(result)
        # print()

        row = []

        for i in result.split(' : '):
            row.append(i)

        table.append(row)

    return table


def display_tweets(table):
    builder = ''
    for row in table:
        builder = builder + '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n'
        builder = builder + 'username: <' + row[1] + '> tid: <' + row[0] + '>\n\n'
        builder = builder + '> ' + row[2][1:-1] + '\n\n'
        builder = builder + row[3][14:] + '-' + row[4] + '-' + row[5][0:-1] + '\n'
        builder = builder + '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n'

    print(builder)
