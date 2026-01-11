from fastapi import FastAPI
from src.api import configure_routers
import uvicorn


app = FastAPI(
    title="Text Analyzer Backend",
    description="Local backend service for desktop app 'Text Analyzer'",
    debug=True,
    version="0.1.0",
    docs_url="/documentation",
)

configure_routers(app)

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
