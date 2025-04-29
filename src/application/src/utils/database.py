from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import configparser

def get_database_uri():
    config = configparser.ConfigParser()
    config.read('config.ini')
    db_uri = config.get('database', 'uri')
    return db_uri

db_engine = create_engine(get_database_uri())
db_connection = db_engine.connect()
Session = sessionmaker(db_engine, expire_on_commit=False)