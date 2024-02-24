from pydantic import BaseModel

class Quiz(BaseModel):
    theme: str
    question: str
    choices: list[str]
    answer: str
    translation: str
    explanation: str
    category: str