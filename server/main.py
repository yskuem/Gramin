from fastapi import FastAPI
from server.api.routers import router

app = FastAPI()

app.include_router(router.router)

