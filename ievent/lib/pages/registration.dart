import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainRegistration extends StatefulWidget {
  const MainRegistration({super.key});

  @override
  State<MainRegistration> createState() => _MainRegistrationState();
}

class _MainRegistrationState extends State<MainRegistration> {
  static const header = 'Регистрация';
  static const name = 'Имя';
  static const surname = 'Фамилия';
  static const patronymic = 'Отчество';
  static const login = 'Логин';
  static const pass = 'Продолжить';
  static const account = 'Уже есть аккаунт';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();

  String? _nameError;
  String? _surnameError;
  String? _loginError;

  bool _isNameError = false;
  bool _isSurnameError = false;
  bool _isLoginError = false;

  void goToLogin() => Navigator.pushReplacementNamed(context, '/');

  void buttonClick() {
    String name = _nameController.text;
    String surname = _surnameController.text;
    String patronymic = _patronymicController.text;
    String login = _loginController.text;

    if (name.isEmpty) {
      setState(() {
        _nameError = 'Не должно быть пустым';
        _isNameError = true;
      });
    } else {
      setState(() {
        _nameError = null;
        _isNameError = false;
      });
    }

    if (surname.isEmpty) {
      setState(() {
        _surnameError = 'Не должна быть пустой';
        _isSurnameError = true;
      });
    } else {
      setState(() {
        _surnameError = '';
        _isSurnameError = false;
      });
    }

    if (login.length < 3) {
      setState(() {
        _loginError = 'Должен быть длиннее 2 символов';
        _isLoginError = true;
      });
    } else {
      if (RegExp(r'^[0-9]').hasMatch(login)) {
        setState(() {
          _loginError = 'Не может начинаться с цифры';
          _isLoginError = true;
        });
      } else {
        setState(() {
          _loginError = '';
          _isLoginError = false;
        });
      }
    }

    if (!_isLoginError && !_isNameError && !_isLoginError) {
      Navigator.pushNamed(context, '/registraion_password');
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
          body: SafeArea(
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
                  const SizedBox(height: 44),
                  Stack(
                    children: [
                      ClipPath(
                          clipper: MyCustomClipperOne(),
                          child: Container(
                              width: 284,
                              height: 321,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 11),
                                      SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Row(
                                            children: [
                                              const Text(name,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Jost"),
                                                  textAlign: TextAlign.left),
                                              const SizedBox(width: 5),
                                              if (_isNameError)
                                                SizedBox(
                                                  width: 120,
                                                  child: Text(_nameError!,
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                          height: 0.6,
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontFamily: 'Lora')),
                                                )
                                            ],
                                          )),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                              controller: _nameController,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[а-яА-Я]')),
                                              ],
                                              decoration: InputDecoration(
                                                  fillColor:
                                                      const Color(0xffF0F09B),
                                                  border:
                                                      const OutlineInputBorder(),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: _isNameError
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black)),
                                                  filled: true,
                                                  hintText: name,
                                                  hintStyle: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
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
                                      const SizedBox(height: 7.5),
                                      SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Row(
                                            children: [
                                              const Text(surname,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Jost"),
                                                  textAlign: TextAlign.left),
                                              const SizedBox(width: 5),
                                              if (_isSurnameError)
                                                SizedBox(
                                                  width: 80,
                                                  child: Text(_surnameError!,
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                          height: 0.6,
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontFamily: 'Lora')),
                                                )
                                            ],
                                          )),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                              controller: _surnameController,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[а-яА-Я]')),
                                              ],
                                              decoration: InputDecoration(
                                                  fillColor:
                                                      const Color(0xffF0F09B),
                                                  border:
                                                      const OutlineInputBorder(),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: _isSurnameError
                                                              ? Colors.red
                                                              : Colors.black)),
                                                  filled: true,
                                                  hintText: surname,
                                                  hintStyle: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
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
                                      const SizedBox(height: 11.5),
                                      const SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Text(patronymic,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Jost'))),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                              controller: _patronymicController,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[а-яА-Я]')),
                                              ],
                                              decoration: InputDecoration(
                                                  fillColor:
                                                      const Color(0xffF0F09B),
                                                  border:
                                                      const OutlineInputBorder(),
                                                  filled: true,
                                                  hintText: patronymic,
                                                  hintStyle: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5),
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
                                      const SizedBox(height: 5),
                                      SizedBox(
                                          height: 23,
                                          width: 185.5,
                                          child: Row(
                                            children: [
                                              const Text(
                                                login,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost'),
                                              ),
                                              const SizedBox(width: 5),
                                              if (_isLoginError)
                                                SizedBox(
                                                  width: 125,
                                                  child: Text(_loginError!,
                                                      softWrap: true,
                                                      style: const TextStyle(
                                                          height: 0.6,
                                                          fontSize: 12,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontFamily: 'Lora')),
                                                )
                                            ],
                                          )),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                              controller: _loginController,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'[a-zA-Z0-9]')),
                                              ],
                                              decoration: InputDecoration(
                                                fillColor:
                                                    const Color(0xffF0F09B),
                                                border:
                                                    const OutlineInputBorder(),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: _isLoginError
                                                                ? Colors.red
                                                                : Colors
                                                                    .black)),
                                                filled: true,
                                                hintText: login,
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Lora",
                                                    fontSize: 15),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 5, 0, 5),
                                              ),
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
                              const SizedBox(height: 305),
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
          floatingActionButton: SizedBox(
            width: 160,
            height: 26,
            child: RichText(
              text: TextSpan(
                  text: account,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w700),
                  recognizer: TapGestureRecognizer()..onTap = goToLogin),
            ),
          ),
        ));
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
