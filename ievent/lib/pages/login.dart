import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const header = 'Вход';
  static const login = 'Логин';
  static const password = 'Пароль';
  static const pass = 'Войти';
  static const account = 'Ещё нет аккаунта';

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
                  const SizedBox(height: 40),
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
                                      const SizedBox(height: 52),
                                      const SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Text(login,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Jost"),
                                              textAlign: TextAlign.left)),
                                      const SizedBox(height: 21),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z0-9]')),
                                            ],
                                            decoration: const InputDecoration(
                                                fillColor: Color(0xffF0F09B),
                                                border: OutlineInputBorder(),
                                                filled: true,
                                                hintText: login,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Lora",
                                                    fontSize: 15),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 5, 0, 5)),
                                          )),
                                      const SizedBox(height: 16),
                                      const SizedBox(
                                          width: 185.5,
                                          height: 23,
                                          child: Text(password,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Jost"),
                                              textAlign: TextAlign.left)),
                                      const SizedBox(height: 21),
                                      SizedBox(
                                          width: 185.5,
                                          height: 32.5,
                                          child: TextField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[a-zA-Z0-9]')),
                                            ],
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                                fillColor: Color(0xffF0F09B),
                                                border: OutlineInputBorder(),
                                                filled: true,
                                                hintText: password,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Lora",
                                                    fontSize: 15),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        10, 5, 0, 5)),
                                          ))
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
                                      width: 130,
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                          width: 130,
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
                  recognizer: TapGestureRecognizer()..onTap = goToRegistration),
            ),
          ),
        ));
  }

  void goToRegistration() =>
      Navigator.pushReplacementNamed(context, '/registration');

  void buttonClick() {
    //LoginRepository().doesUserExist();
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
