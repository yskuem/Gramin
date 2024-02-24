
from fastapi import APIRouter


router = APIRouter()

@router.get("/")
def read_root():
    return {"Hello": "World"}


@router.get("/generate_quiz")
async def generate_quiz():
    return ""

