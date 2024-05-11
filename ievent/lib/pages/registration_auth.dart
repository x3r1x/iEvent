import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ievent/pages/main_page.dart';
import 'package:ievent/pages/registration.dart';
import 'package:ievent/pages/registration_password.dart';
import 'package:ievent/repositores/register_repository.dart';

late String userType;

class RegistrationAuth extends StatefulWidget {
  const RegistrationAuth({super.key});

  @override
  State<RegistrationAuth> createState() => _RegistrationAuthState();
}

class _RegistrationAuthState extends State<RegistrationAuth> {
  static const header = 'Кто вы?';
  static const student = 'Ученик';
  static const teacher = 'Учитель';
  static const parent = 'Родитель';
  static const admin = 'Администрация школы';
  static const pass = 'Продолжить';
  static const back = 'Назад';
  static const double rowWidth = 160;
  static const double rowHeight = 29;

  Color sHit = Colors.black;
  Color tHit = Colors.black;
  Color pHit = Colors.black;
  Color aHit = Colors.black;

  String type = '';

  bool _isError = false;
  late String? _errorMessage;

  void buttonClick() {
    if (type == '') {
      setState(() {
        _isError = true;
        _errorMessage = 'Кто вы?';
      });
    } else {
      if (type != admin) {
        userType = type;
        Navigator.pushNamed(context, '/user_classroom');
      } else {
        registerAdmin();
      }
    }
  }

  void goToPassword() => Navigator.pop(context);

  Future<void> registerAdmin() async {
    userType = 'Администратор';

    String name = userName;
    String surname = userSurname;
    String patronymic = userPatronymic;
    String login = userLogin;
    String password = userPassword;

    if (await RegisterRepository()
        .registerUser(name, surname, patronymic, login, password, type, 0)) {
      userToken = await RegisterRepository().getToken(login, password);
      print(userToken);
      if (userToken == 'err') {
        setState(() {
          _isError = true;
          _errorMessage = 'Ошибка регистрации';
        });
      } else {
        Navigator.pushReplacementNamed(context, '/main');
      }
    } else {
      setState(() {
        _isError = true;
        _errorMessage = 'Ошибка регистрации';
      });
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
                            width: 245,
                            height: 298,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 31),
                                    SizedBox(
                                        height: rowHeight,
                                        width: rowWidth,
                                        child: InkWell(
                                            onTap: () {
                                              type = student;
                                              setState(() {
                                                sHit = Colors.red;
                                                tHit = Colors.black;
                                                pHit = Colors.black;
                                                aHit = Colors.black;
                                              });
                                            },
                                            child: Text(
                                              student,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Jost',
                                                  color: sHit),
                                            ))),
                                    const SizedBox(height: 29),
                                    SizedBox(
                                        height: rowHeight,
                                        width: rowWidth,
                                        child: InkWell(
                                            onTap: () {
                                              type = teacher;
                                              setState(() {
                                                sHit = Colors.black;
                                                tHit = Colors.red;
                                                pHit = Colors.black;
                                                aHit = Colors.black;
                                              });
                                            },
                                            child: Text(
                                              teacher,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Jost',
                                                  color: tHit),
                                            ))),
                                    const SizedBox(height: 29),
                                    SizedBox(
                                        height: rowHeight,
                                        width: rowWidth,
                                        child: InkWell(
                                            onTap: () {
                                              type = parent;
                                              setState(() {
                                                sHit = Colors.black;
                                                tHit = Colors.black;
                                                pHit = Colors.red;
                                                aHit = Colors.black;
                                              });
                                            },
                                            child: Text(
                                              parent,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Jost',
                                                  color: pHit),
                                            ))),
                                    const SizedBox(height: 29),
                                    SizedBox(
                                        height: 50,
                                        width: rowWidth,
                                        child: InkWell(
                                            onTap: () {
                                              type = admin;
                                              setState(() {
                                                sHit = Colors.black;
                                                tHit = Colors.black;
                                                pHit = Colors.black;
                                                aHit = Colors.red;
                                              });
                                            },
                                            child: Text(
                                              admin,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Jost',
                                                  color: aHit),
                                            )))
                                  ],
                                )
                              ],
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 282.5),
                              SizedBox(
                                  height: 32,
                                  width: 230,
                                  child: Container(
                                      height: 32,
                                      width: 141,
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                          width: 150,
                                          height: 32,
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
                              if (_isError) const SizedBox(height: 50),
                              if (_isError)
                                SizedBox(
                                    width: 110,
                                    child: Text(_errorMessage!,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red,
                                            fontFamily: 'Dela Gothic One')))
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )),
          floatingActionButton: SizedBox(
            width: 420,
            height: 28,
            child: RichText(
              text: TextSpan(
                  text: back,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Abel',
                      fontWeight: FontWeight.w400),
                  recognizer: TapGestureRecognizer()..onTap = goToPassword),
            ),
          )),
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
