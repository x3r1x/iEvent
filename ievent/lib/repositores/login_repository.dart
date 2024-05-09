import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginRepository {
  Future<void> doesUserExist() async {
    final response =
        await Dio().get('http://185.247.17.150/api/User/Users/Current');

    debugPrint(response.toString());
  }
}
