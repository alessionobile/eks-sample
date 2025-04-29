from fastapi import FastAPI
from sqlalchemy import select
from utils.database import get_database_uri, db_connection, Session
from utils.base_model import EksSample

app = FastAPI()

@app.get("/")
async def home():
  with Session() as session:
    try:
      results = session.scalars(select(EksSample).where(EksSample.key == "hello")).all()
      message = results[0].value
      return {"message": message}
    except:
      raise