import os
from openai import AsyncOpenAI
from server.config.openai_config import CREATE_QUIZ_FUNCTION

class OpenAIClient:
    _instance = None
    _is_initialized = False

    def __new__(cls, api_key = None):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self, api_key):
        if not self._is_initialized:
            self.client = AsyncOpenAI(
                api_key=os.environ.get("OPENAI_API_KEY", api_key),
            )
            self._is_initialized = True

    async def generate_quiz(self, sentence: str, model: str = "gpt-4-0125-preview"):
        return await self.client.chat.completions.create(
            messages=[
                {
                    "role": "user",
                    "content": sentence,
                }
            ],
            model=model,
            functions=[
                CREATE_QUIZ_FUNCTION
            ],
            function_call="auto",
        )
