import json
import os
import uuid
from openai import AsyncOpenAI
from server.api.schemas.schemas import Quiz
from server.config.openai_config import CREATE_QUIZ_FUNCTION

class OpenAIClient:
    _instance = None
    _is_initialized = False

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self):
        if not self._is_initialized:
            self.client = AsyncOpenAI(
                api_key = os.environ.get("OPENAI_API_KEY"),
            )
            self._is_initialized = True

    async def generate_quiz(self, sentence: str,user_id: str, model: str = "gpt-4-0125-preview"):
        response = await self.client.chat.completions.create(
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
        data = json.loads(response.choices[0].message.function_call.arguments)

        return Quiz(
            quiz_id = str(uuid.uuid4),
            create_user_id = user_id,
            question = data["question"],
            choices = data["choices"],
            answer = data["answer"],
            translation = data["translation"],
            explanation = data["explanation"],
            category = data["category"],
        )
