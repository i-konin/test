
import psycopg2

connect = psycopg2.connect("postgresql://admin:123@localhost:5432/my_db")
cursor = connect.cursor()
