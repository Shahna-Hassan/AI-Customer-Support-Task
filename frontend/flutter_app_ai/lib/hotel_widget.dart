import 'package:flutter/material.dart';

class HotelWidget extends StatelessWidget {

  final List hotels;

  HotelWidget({
    required this.hotels,
  });

  @override
  Widget build(BuildContext context) {

return ListView.builder(
  itemCount: hotels.length,
  itemBuilder: (context, index) {
  final hotel=hotels[index];
  return Card(
    child: Row(
      children: [
        Image(image: AssetImage('sample')),
        Column(
          children: [
            Text(hotel["name"]),
             Text( "Rating: ${hotel["rating"]}", ),
             Text("Price: ${hotel["price"]}")
          ],
        )
      ],
    ),
  );
},);
  
  }
}