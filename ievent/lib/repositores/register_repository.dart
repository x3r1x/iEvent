import 'dart:convert';
import 'package:ievent/pages/registration.dart';
import 'package:ievent/pages/registration_password.dart';
import 'package:http/http.dart' as http;

class RegisterRepository {
  void registerUser() async {
    String name = userName;
    String surname = userSurname;
    String patronymic = userPatronymic;
    String login = userLogin;
    String password = userPassword;
    String type = "Ученик";
    int classroom = 10;

    var data = {
      "name": name,
      "surname": surname,
      "username": login,
      "type": type,
      "class": classroom,
      "patronymic": patronymic,
      "password": password
    };

    String json = jsonEncode(data);

    var url = Uri.parse('http://185.247.17.150/api/User/register');
    var response = await http.post(url, body: json);

    if (response.statusCode == 200) {
      print('POST запрос выполнен успешно');
      print('Ответ сервера: ${response.body}');
    } else {
      print('Ошибка при выполнении POST запроса: ${response.statusCode}');
    }
  }
}
