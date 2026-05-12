from pydantic import BaseModel
class ChatRequest(BaseModel):
    str_conversation_id: int
    str_message: str
