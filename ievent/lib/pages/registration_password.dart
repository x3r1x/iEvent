import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ievent/pages/registration.dart';
import 'package:ievent/repositores/register_repository.dart';

late String userPassword;

class RegistrationPassword extends StatefulWidget {
  const RegistrationPassword({super.key});

  @override
  State<RegistrationPassword> createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {
  static const header = 'Регистрация';
  static const password = 'Пароль';
  static const confirm = 'Подтверждение пароля';
  static const text = 'Введите пароль ещё раз';
  static const pass = 'Продолжить';

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmationController = TextEditingController();

  String? _passwordError;

  bool _isPasswordError = false;
  bool _isConfirmationError = false;

  String login = userLogin;

  Future<void> buttonClick() async {
    String password = _passwordController.text;
    String confirmation = _confirmationController.text;

    if (password.length < 5) {
      setState(() {
        _isPasswordError = true;
        _passwordError = 'Пароль должен быть длиннее 5 символов';
      });
    } else {
      if (double.tryParse(password) != null) {
        setState(() {
          _isPasswordError = true;
          _passwordError = 'Пароль должен содержать латинскую букву';
        });
      } else {
        if (password == password.toUpperCase()) {
          setState(() {
            _isPasswordError = true;
            _passwordError = 'Пароль должен содержать маленькие буквы';
          });
        } else {
          if (password == password.toLowerCase()) {
            setState(() {
              _isPasswordError = true;
              _passwordError = 'Пароль должен содержать заглавные буквы';
            });
          } else {
            if (password != confirmation) {
              setState(() {
                _isConfirmationError = true;
                _isPasswordError = true;
                _passwordError = 'Пароли не совпадают';
              });
            } else {
              setState(() {
                _isConfirmationError = false;
                _isPasswordError = false;
                _passwordError = null;
              });
            }
          }
        }
      }
    }

    if (!_isPasswordError && !_isConfirmationError) {
      if (await RegisterRepository().canRegister(login, password)) {
        userPassword = password;
        Navigator.pushNamed(context, '/user_type');
      } else {
        setState(() {
          _isPasswordError = true;
          _isConfirmationError = true;
          _passwordError = 'Логин уже существует!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: header,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0C8746),
        ),
        home: Scaffold(
            body: SingleChildScrollView(
          child: SafeArea(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  const SizedBox(height: 179),
                  const Text(header,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Dela Gothic One',
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  const SizedBox(height: 80),
                  Stack(
                    children: [
                      ClipPath(
                          clipper: MyCustomClipperOne(),
                          child: Container(
                              width: 279,
                              height: 239,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 22),
                                      SizedBox(
                                          width: 197,
                                          height: 30,
                                          child: Row(
                                            children: [
                                              const Text(password,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Jost"),
                                                  textAlign: TextAlign.left),
                                              const SizedBox(width: 5),
                                              if (_isPasswordError)
                                                SizedBox(
                                                    width: 120,
                                                    child: Text(_passwordError!,
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                            height: 0.8,
                                                            fontSize: 12,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            fontFamily:
                                                                'Lora')))
                                            ],
                                          )),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                          width: 197,
                                          height: 34,
                                          child: TextField(
                                              controller: _passwordController,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'[a-zA-Z0-9]')),
                                              ],
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  fillColor:
                                                      const Color(0xffF0F09B),
                                                  border:
                                                      const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              _isPasswordError
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black)),
                                                  filled: true,
                                                  hintText: password,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Lora",
                                                      fontSize: 15),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 5, 0, 5)),
                                              style: const TextStyle(
                                                  fontFamily: 'Jost',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black))),
                                      const SizedBox(height: 16),
                                      const SizedBox(
                                          width: 197,
                                          height: 23,
                                          child: Text(confirm,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Jost"),
                                              textAlign: TextAlign.left)),
                                      const SizedBox(
                                        width: 197,
                                        height: 20,
                                        child: Text(text,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200,
                                                fontFamily: 'Lora',
                                                fontSize: 15)),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                          width: 197,
                                          height: 34,
                                          child: TextField(
                                              controller:
                                                  _confirmationController,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'[a-zA-Z0-9]')),
                                              ],
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  fillColor:
                                                      const Color(0xffF0F09B),
                                                  border:
                                                      const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              _isConfirmationError
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black)),
                                                  filled: true,
                                                  hintText: confirm,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Lora",
                                                      fontSize: 15),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 5, 0, 5)),
                                              style: const TextStyle(
                                                  fontFamily: 'Jost',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black)))
                                    ],
                                  )
                                ],
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 222.5),
                              SizedBox(
                                  height: 32,
                                  width: 263,
                                  child: Container(
                                      height: 32,
                                      width: 150,
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                          width: 150,
                                          height: 32,
                                          child: ElevatedButton(
                                            onPressed: buttonClick,
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xffFFFFA5)),
                                            child: const Text(
                                              pass,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Jost'),
                                            ),
                                          ))))
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
        )));
  }
}

class WhitelistingTextInputFormatter {
  const WhitelistingTextInputFormatter(RegExp regExp);
}

class MyCustomClipperOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(13, size.height / 2)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - 13, size.height / 2)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
