def refactor(src):
    src = src[4:-1].strip()
    src = src.replace('\', ', ' : ')
    src = src.replace('), ', ') : ')
    src = src.replace('datetime.', '')

    return src


def get_table(rows):
    table = []
    keys = {}

    for row in rows:
        result = refactor(str(row))

        column = {}

        for index, i in enumerate(result.split(' : ')):
            pair = i.strip().split('=')

            key = pair[0]
            value = pair[1].replace('\'', '')

            keys[index] = key
            column[key] = value

        table.append(column)

    return table, keys


def get_username(table):
    return table[0].get('ID')


def header(columns, corner, vertical, length, keys):
    builder = ''
    for i in range(columns):
        if keys[i] == 'PASSWORD_HASH':
            builder = builder + corner + vertical * 130 + corner
            continue

        if keys.get(i) == 'BIOGRAPHY':
            builder = builder + corner + vertical * 70 + corner
            continue

        builder = builder + corner + vertical * length + corner
    builder = builder + '\n'

    return builder


def pretty_table(table, keys):
    corner = '+'
    vertical = '-'

    length = 20

    columns = len(keys)
    rows = len(table)

    builder = ''
    builder = builder + header(columns, corner, vertical, length, keys)

    for i in range(columns):
        if keys[i] == 'PASSWORD_HASH':
            builder = builder + '| {:^128s} |'.format(keys[i])
            continue

        if keys.get(i) == 'BIOGRAPHY':
            builder = builder + '| {:^68s} |'.format(keys[i])
            continue

        builder = builder + '| {:^18s} |'.format(keys[i])
    builder = builder + '\n'

    builder = builder + header(columns, corner, vertical, length, keys)

    for i in range(rows):
        for j in range(len(table[i])):
            if keys[j] == 'PASSWORD_HASH':
                builder = builder + '| {:^128s} |'.format(table[i].get(keys[j]))
                continue

            if keys.get(j) == 'BIOGRAPHY':
                builder = builder + '| {:^68s} |'.format(table[i].get(keys[j]))
                continue
            builder = builder + '| {:^18s} |'.format(table[i].get(keys[j]))
        builder = builder + '\n'

    builder = builder + header(columns, corner, vertical, length, keys)

    print(builder)
