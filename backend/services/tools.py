def tool_decider(intent):
    if intent=="hotel_search":
        hotels=[
            {
                "name": "Grand Palace" ,
                "price": "$220",
                "rating": 4.8
            },

            {
                "name": "Hilton" ,
                "price": "$200",
                "rating": 4.0
            },

        ]
        return {
            "message": "Hotels found",
            "ui_type": "hotel_list",
            "data": hotels

        }
    elif intent=="flight_search":
        flights=[
            {
                "name": "Emirates" ,
                "price": "$220",
                "rating": 4.8
            },

            

        ]
        return {
            "message": "flights found",
            "ui_type": "flight_list",
            "data": flights

        }
    
    elif intent == "complaint":
       
        return {
            "message": "Complaint",
            "ui_type": "text",
            "data": None

        }
