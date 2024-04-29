from pydantic import BaseModel

class Quiz(BaseModel):
    quiz_id : str
    create_user_id :str
    question: str
    choices: list[str]
    answer: str
    translation: str
    explanation: str
    category: str