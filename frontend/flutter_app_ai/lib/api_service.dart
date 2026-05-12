import 'package:dio/dio.dart';

class ApiService {

  static Future<Map<String, dynamic>> sendMessage(
    String message,
  ) async {

    final response = await Dio().post(

      "http://10.0.2.2:8000/chat",

      data: {
        "conversation_id": "1",
        "message": message,
      },
    );

    return response.data;
  }
}