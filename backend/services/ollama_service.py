
   
import json
import requests


def intent_check(user_message, memory):
    prompt = prompt = f"""You are an intent detector.
        The available intents are: "hotel search", "flight_search", "complaint".
        Return a JSON object with a single key "intent".

        User: {user_message}
        Memory context: {memory}
        """

    response = requests.post("http://localhost:11434/api/generate",
                          json={  
  "model": "llama3",
  "prompt": prompt,
  "format": "json",
  "stream": False }
  )
    print(response)
    result=response.json()['response']
    return json.loads(result)