from fastapi import FastAPI
from .controller import router


def configure_routers(app: FastAPI):
    app.include_router(router)
