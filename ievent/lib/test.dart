import 'dart:convert';
import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();

  // Данные для отправки в формате JSON
  Map<String, dynamic> data = {
    "name": "string",
    "surname": "string",
    "username": "string",
    "type": "string",
    "class": 1,
    "patronymic": "string",
    "password": "string"
  };

  String json = jsonEncode(data);

  try {
    Response response =
        await dio.get('https://185.247.17.150/api/Problem/GetAllProblems');

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');
  } catch (e) {
    print('Error sending GET request: $e');
  }
}
