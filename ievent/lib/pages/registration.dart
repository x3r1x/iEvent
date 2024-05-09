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
                                      const SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Text(name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Jost"),
                                              textAlign: TextAlign.left)),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[а-яА-Я]')),
                                            ],
                                            decoration: const InputDecoration(
                                                fillColor: Color(0xffF0F09B),
                                                border: OutlineInputBorder(),
                                                filled: true,
                                                hintText: name,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Lora",
                                                    fontSize: 15),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 5, 0, 5)),
                                          )),
                                      const SizedBox(height: 7.5),
                                      const SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Text(surname,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Jost"),
                                              textAlign: TextAlign.left)),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[а-яА-Я]')),
                                            ],
                                            decoration: const InputDecoration(
                                                fillColor: Color(0xffF0F09B),
                                                border: OutlineInputBorder(),
                                                filled: true,
                                                hintText: surname,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Lora",
                                                    fontSize: 15),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 5, 0, 5)),
                                          )),
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
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[а-яА-Я]')),
                                              ],
                                              decoration: const InputDecoration(
                                                  fillColor: Color(0xffF0F09B),
                                                  border: OutlineInputBorder(),
                                                  filled: true,
                                                  hintText: patronymic,
                                                  hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Lora",
                                                      fontSize: 15),
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 5, 0, 5)))),
                                      const SizedBox(height: 5),
                                      const SizedBox(
                                          height: 23,
                                          width: 185.5,
                                          child: Text(
                                            login,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Jost'),
                                          )),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(
                                                        RegExp(r'[a-zA-Z0-9]')),
                                              ],
                                              decoration: const InputDecoration(
                                                  fillColor: Color(0xffF0F09B),
                                                  border: OutlineInputBorder(),
                                                  filled: true,
                                                  hintText: patronymic,
                                                  hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Lora",
                                                      fontSize: 15),
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 5, 0, 5))))
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

  void goToLogin() => Navigator.pushReplacementNamed(context, '/');

  void buttonClick() {
    Navigator.pushNamed(context, '/registraion_password');
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
