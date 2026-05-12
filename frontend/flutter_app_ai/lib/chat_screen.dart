import 'package:flutter/material.dart';
import 'package:flutter_app_ai/api_service.dart';
import 'package:flutter_app_ai/flight_widget.dart';
import 'package:flutter_app_ai/hotel_widget.dart';


class ChatScreen extends StatefulWidget {

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();

  Map? data;

  sendMessage() async {

    final response = await ApiService.sendMessage(controller.text );

    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("AI Assistant"),
      ),

      body: Column(
        children: [

          Expanded(
            child: 
            data!['ui_type']=="hotel_list"?HotelWidget(hotels: data!["data"])
            :data!['ui_type']=="flight_list"?FlightWidget(flights: data!["data"])
            :Text(data!["message"])

          ),

          SizedBox(

            child: Row(

              children: [
                Expanded(child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Type message",

                  ),
                )),
                SizedBox(width: 5,),
                ElevatedButton(onPressed: () {
                  sendMessage();
                }, child: Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
