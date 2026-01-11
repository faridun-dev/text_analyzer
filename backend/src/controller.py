from fastapi import APIRouter, Request, UploadFile, File

router = APIRouter(prefix="/analyzer", tags=["Analyzer"])


@router.post("/count_words_per_sentence")
async def count_words_per_sentence_endpoint(
    request: Request,
    file: UploadFile = File(...),
):
    return
