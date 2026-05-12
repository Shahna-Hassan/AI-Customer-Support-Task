from fastapi import FastAPI
from memory import memory_store
from models.chatRequstModel import ChatRequest
from services.ollama_service import intent_check
from services.tools import tool_decider



app=FastAPI()

@app.post('/chat')
def chat(req:ChatRequest):
    # str_user_message=f"Thiis is Ai response to : {req}"
    str_conversation_id= req.str_conversation_id
    str_prvious_memory=memory_store.get('str_conversation_id')
    str_message=req.str_message
    str_intent=intent_check(str_message, str_prvious_memory)
    response=tool_decider(str_intent)

    if str_conversation_id not in memory_store:
        memory_store[str_conversation_id] = []

    memory_store[str_conversation_id].append({
        "user":str_message,
        "assistant": response
    })

    return response
    # return {
    #     'reply': str_user_message
    # }


