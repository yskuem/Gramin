from pydantic import BaseModel

class Quiz(BaseModel):
    question: str
    choices: list[str]
    answer: str
    translation: str
    explanation: str
    category: str