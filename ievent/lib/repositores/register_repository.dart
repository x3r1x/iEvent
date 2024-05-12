import 'dart:convert';

import 'package:dio/dio.dart';

class RegisterRepository {
  var dio = Dio();

  Future<bool> canRegister(String login, String password) async {
    String url = 'http://185.247.17.150/api/User/login';

    var data = {"username": login, "password": password};
    String dataEncoded = jsonEncode(data);

    try {
      Response response = await dio.post(url, data: dataEncoded);

      return !(response.statusCode == 200);
    } catch (error) {
      return error.toString().contains('401');
    }
  }

  Future<void> registerUser(String name, String surname, String patronymic,
      String login, String password, String type, int userClass) async {
    String url = 'http://185.247.17.150/api/User/register';

    var data = {
      "name": name,
      "surname": surname,
      "username": login,
      "type": type,
      "class": userClass,
      "patronymic": patronymic,
      "password": password
    };

    String dataEncoded = jsonEncode(data);
    await dio.post(url, data: dataEncoded);
  }

  Future<String> getToken(String login, String password) async {
    String url = 'http://185.247.17.150/api/User/login';

    var data = {"username": login, "password": password};
    String dataEncoded = jsonEncode(data);
    Response response = await dio.post(url, data: dataEncoded);

    return response.data['token'];
  }
}
