import 'package:flutter/material.dart';

class FlightWidget extends StatelessWidget {

  final List flights;

  FlightWidget({
    required this.flights,
  });

  @override
  Widget build(BuildContext context) {

    
return ListView.builder(
  itemCount: flights.length,
  itemBuilder: (context, index) {
  final flight=flights[index];
  return Card(
    child: Row(
      children: [
        Image(image: AssetImage('sample')),
        Column(
          children: [
            Text(flight["name"]),
             Text( "Rating: ${flight["rating"]}", ),
             Text("Price: ${flight["price"]}")
          ],
        )
      ],
    ),
  );
},);
  }
}