from fastapi import FastAPI
from datetime import datetime

app = FastAPI()


@app.get("/")
async def root():
    timestamp = int(datetime.timestamp(datetime.now()))
    response = {
        "message": "Automate all the things!",
        "timestamp": timestamp
    }
    return response