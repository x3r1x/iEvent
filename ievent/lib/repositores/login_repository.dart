import 'dart:convert';

import 'package:dio/dio.dart';

class LoginRepository {
  var dio = Dio();

  bool doesUserExist(String login) {
    return true;
  }

  Future<bool> doesPasswordMatch(String login, String password) async {
    String url = 'http://185.247.17.150/api/User/login';

    var data = {"username": login, "password": password};
    String dataEncoded = jsonEncode(data);

    try {
      Response response = await dio.post(url, data: dataEncoded);

      return response.statusCode == 200;
    } catch (error) {
      return false;
    }
  }

  Future<String> getToken(String login, String password) async {
    String url = 'http://185.247.17.150/api/User/login';

    var data = {"username": login, "password": password};
    String dataEncoded = jsonEncode(data);

    try {
      Response response = await dio.post(url, data: dataEncoded);

      return response.data['token'];
    } catch (error) {
      return 'err';
    }
  }
}
