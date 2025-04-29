#!/bin/bash
source venv/bin/activate
alembic -c alembic.ini upgrade head
uvicorn app:app --host 0.0.0.0 --port 8000