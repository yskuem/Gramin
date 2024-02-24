import os
from openai import AsyncOpenAI
from server.config.openai_config import CREATE_QUIZ_FUNCTION

class OpenAIClient:
    def __init__(self, api_key):
        self.client = AsyncOpenAI(
            api_key = os.environ.get("OPENAI_API_KEY"),
        )

    async def generate_quiz(self,sentence : str, model : str = "gpt-4-0125-preview"):
        return await self.client.chat.completions.create(
            messages=[
                {
                    "role": "user",
                    "content": sentence,
                }
            ],
            model = model,
            functions=[
                CREATE_QUIZ_FUNCTION
            ],
            function_call="auto",
        )