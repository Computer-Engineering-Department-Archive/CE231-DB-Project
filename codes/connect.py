import mysql.connector


def connect():
    db = mysql.connector.connect(
        host='localhost',
        username='root',
        password='root12345678',
        database='twitter',
        port='2000'
    )

    return db


def get_cursor(db):
    return db.cursor(named_tuple=True)
