import mysql.connector


def connect():
    db = mysql.connector.connect(
        host='localhost',
        username='root',
        password='password1234',
        database='twitter',
        port='2000'
    )

    return db


def get_cursor(db):
    return db.cursor(named_tuple=True)
