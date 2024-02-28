
from fastapi import APIRouter

from server.infrastructure.openai_client import OpenAIClient


router = APIRouter()

@router.get("/")
def read_root():
    return {"Hello": "World"}


@router.get("/generate_quiz")
async def generate_quiz(user_id : str):
    return await OpenAIClient().generate_quiz("TOEIC英語の4択の文法問題を作成してください。",user_id)

