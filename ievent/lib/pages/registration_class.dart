import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ievent/pages/main_page.dart';
import 'package:ievent/pages/registration.dart';
import 'package:ievent/pages/registration_auth.dart';
import 'package:ievent/pages/registration_password.dart';
import 'package:ievent/repositores/register_repository.dart';

class RegistrationClass extends StatefulWidget {
  const RegistrationClass({super.key});

  @override
  State<RegistrationClass> createState() => _RegistrationClassState();
}

class _RegistrationClassState extends State<RegistrationClass> {
  static const header = 'Ваш класс?';
  static const grade1 = '1 класс';
  static const grade2 = '2 класс';
  static const grade3 = '3 класс';
  static const grade4 = '4 класс';
  static const grade5 = '5 класс';
  static const grade6 = '6 класс';
  static const grade7 = '7 класс';
  static const grade8 = '8 класс';
  static const grade9 = '9 класс';
  static const grade10 = '10 класс';
  static const grade11 = '11 класс';
  static const pass = 'Готово';
  static const back = 'Назад';
  static const double rowWidth = 217;
  static const double rowHeight = 29;
  static const double rowSpace = 20;

  Color grade1Color = Colors.black;
  Color grade2Color = Colors.black;
  Color grade3Color = Colors.black;
  Color grade4Color = Colors.black;
  Color grade5Color = Colors.black;
  Color grade6Color = Colors.black;
  Color grade7Color = Colors.black;
  Color grade8Color = Colors.black;
  Color grade9Color = Colors.black;
  Color grade10Color = Colors.black;
  Color grade11Color = Colors.black;

  int grade = 0;

  bool _isError = false;
  late String? _errorMessage;

  void resetColors() {
    grade1Color = Colors.black;
    grade2Color = Colors.black;
    grade3Color = Colors.black;
    grade4Color = Colors.black;
    grade5Color = Colors.black;
    grade6Color = Colors.black;
    grade7Color = Colors.black;
    grade8Color = Colors.black;
    grade9Color = Colors.black;
    grade10Color = Colors.black;
    grade11Color = Colors.black;
  }

  Future<void> buttonClick() async {
    if (grade == 0) {
      setState(() {
        _isError = true;
        _errorMessage = header;
      });
    } else {
      if (await registerUser()) {
        try {
          userToken =
              await RegisterRepository().getToken(userLogin, userPassword);

          Navigator.pushReplacementNamed(context, '/main_page');
        } catch (e) {
          setState(() {
            _errorMessage = 'Ошибка регистрации';
            _isError = true;
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Ошибка регистрации';
          _isError = true;
        });
      }
    }
  }

  void goToType() => Navigator.pop(context);

  Future<bool> registerUser() async {
    try {
      await RegisterRepository().registerUser(userName, userSurname,
          userPatronymic, userLogin, userPassword, userType, grade);

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Вход',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffF6F6A8)),
      home: Scaffold(
          body: SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 163),
                  const Text(header,
                      style: TextStyle(
                          color: Color(0xff129751),
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          fontFamily: 'Dela Gothic One')),
                  const SizedBox(height: 46),
                  Stack(
                    children: [
                      ClipPath(
                        clipper: MyCustomClipperOne(),
                        child: Container(
                            width: 271,
                            height: 330,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  const SizedBox(height: 30),
                                  SizedBox(
                                      width: rowWidth,
                                      height: rowHeight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              grade = 1;
                                              setState(() {
                                                resetColors();
                                                grade1Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade1,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade1Color)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              grade = 6;
                                              setState(() {
                                                resetColors();
                                                grade6Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade6,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade6Color)),
                                          )
                                        ],
                                      )),
                                  const SizedBox(height: rowSpace),
                                  SizedBox(
                                      width: rowWidth,
                                      height: rowHeight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              grade = 2;
                                              setState(() {
                                                resetColors();
                                                grade2Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade2,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade2Color)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              grade = 7;
                                              setState(() {
                                                resetColors();
                                                grade7Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade7,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade7Color)),
                                          )
                                        ],
                                      )),
                                  const SizedBox(height: rowSpace),
                                  SizedBox(
                                      width: rowWidth,
                                      height: rowHeight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              grade = 3;
                                              setState(() {
                                                resetColors();
                                                grade3Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade3,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade3Color)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              grade = 8;
                                              setState(() {
                                                resetColors();
                                                grade8Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade8,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade8Color)),
                                          )
                                        ],
                                      )),
                                  const SizedBox(height: rowSpace),
                                  SizedBox(
                                      width: rowWidth,
                                      height: rowHeight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              grade = 4;
                                              setState(() {
                                                resetColors();
                                                grade4Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade4,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade4Color)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              grade = 9;
                                              setState(() {
                                                resetColors();
                                                grade9Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade9,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade9Color)),
                                          )
                                        ],
                                      )),
                                  const SizedBox(height: rowSpace),
                                  SizedBox(
                                      width: rowWidth,
                                      height: rowHeight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              grade = 5;
                                              setState(() {
                                                resetColors();
                                                grade5Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade5,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade5Color)),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              grade = 10;
                                              setState(() {
                                                resetColors();
                                                grade10Color = Colors.red;
                                              });
                                            },
                                            child: Text(grade10,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost',
                                                    color: grade10Color)),
                                          )
                                        ],
                                      )),
                                  const SizedBox(height: rowSpace),
                                  InkWell(
                                    onTap: () {
                                      grade = 11;
                                      setState(() {
                                        resetColors();
                                        grade11Color = Colors.red;
                                      });
                                    },
                                    child: Text(grade11,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Jost',
                                            color: grade11Color)),
                                  )
                                ])
                              ],
                            )),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 308),
                                SizedBox(
                                    height: 47,
                                    width: 230,
                                    child: Container(
                                        height: 32,
                                        width: 188,
                                        alignment: Alignment.topRight,
                                        child: SizedBox(
                                            width: 188,
                                            height: 47,
                                            child: ElevatedButton(
                                              onPressed: buttonClick,
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xff34A469)),
                                              child: const Text(
                                                pass,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Jost'),
                                              ),
                                            )))),
                                if (_isError) const SizedBox(height: 30),
                                if (_isError)
                                  SizedBox(
                                      width: 170,
                                      child: Text(_errorMessage!,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red,
                                              fontFamily: 'Dela Gothic One')))
                              ],
                            ),
                          ])
                    ],
                  )
                ],
              )
            ],
          )),
          floatingActionButton: SizedBox(
              height: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 50),
                  RichText(
                    text: TextSpan(
                        text: back,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'Abel',
                            fontWeight: FontWeight.w400),
                        recognizer: TapGestureRecognizer()..onTap = goToType),
                  ),
                ],
              ))),
    );
  }
}

class MyCustomClipperOne extends CustomClipper<Path> {
  static const double radius = 30;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, radius)
      ..arcTo(
          Rect.fromCircle(center: const Offset(radius, radius), radius: radius),
          pi,
          0.5 * pi,
          true)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius),
          radius: const Radius.circular(radius))
      ..lineTo(size.width, size.height - radius)
      ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius),
              radius: radius),
          0,
          0.5 * pi,
          true)
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius),
          radius: const Radius.circular(radius))
      ..lineTo(0, radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
