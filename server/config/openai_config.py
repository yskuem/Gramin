
CREATE_QUIZ_FUNCTION = {
    "name": "create_english_question",
    "description": "英語の四択問題を作成する。難易度はとても難しい",
    "parameters": {
        "type": "object",
        "properties": {
            "question": {
                "type": "string",
                "description": "問題文(英語)"
            },
            "choices": {
                "type": "array",
                "description": "4つの選択肢(英語)",
                "items": {
                    "type": "string"
                },
                "minItems": 4,
                "maxItems": 4
            },
            "answer": {
                "type": "string",
                "description": "問題の正解(英語)"
            },
            "translation": {
                "type": "string",
                "description": "問題の日本語訳(日本語)"
            },
            "explanation": {
                "type": "string",
                "description": "解説(日本語)"
            },
            "category": {
                "type": "string",
                "description": "問題のカテゴリ（例えば「関係代名詞」など）"
            },
        },
        "required": ["theme", "question", "choices", "answer","translation","explanation","category"]
    }
}

