import 'dart:core';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ievent/repositores/login_repository.dart';

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

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _loginError;
  String? _passwordError;

  bool _isLoginError = false;
  bool _isPasswordError = false;

  void goToRegistration() =>
      Navigator.pushReplacementNamed(context, '/registration');

  Future<void> buttonClick() async {
    String login = _loginController.text;
    String password = _passwordController.text;

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

    if (password.length < 5) {
      setState(() {
        _isPasswordError = true;
        _passwordError = 'Должен быть длиннее 5 символов';
      });
    } else {
      if (double.tryParse(password) != null) {
        setState(() {
          _isPasswordError = true;
          _passwordError = 'Должен содержать латинскую букву';
        });
      } else {
        if (password == password.toUpperCase()) {
          setState(() {
            _isPasswordError = true;
            _passwordError = 'Должен содержать маленькие буквы';
          });
        } else {
          if (password == password.toLowerCase()) {
            setState(() {
              _isPasswordError = true;
              _passwordError = 'Должен содержать заглавные буквы';
            });
          } else {
            setState(() {
              _isPasswordError = false;
              _passwordError = null;
            });
          }
        }
      }
    }

    if (!_isLoginError && !_isPasswordError) {
      if (!LoginRepository().doesUserExist(login)) {
        setState(() {
          _loginError = 'Пользователь не найден';
          _isLoginError = true;
        });
      } else {
        if (await LoginRepository().doesPasswordMatch(login, password)) {
          Navigator.pushReplacementNamed(context, '/main_page');
        } else {
          setState(() {
            _passwordError = 'Неправильный логин или пароль';
            _isPasswordError = true;
            _isLoginError = true;
          });
        }
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                        SizedBox(
                                            width: 185.5,
                                            height: 23,
                                            child: Row(children: [
                                              const Text(login,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Jost"),
                                                  textAlign: TextAlign.left),
                                              const SizedBox(width: 5),
                                              if (_isLoginError)
                                                SizedBox(
                                                    width: 126,
                                                    child: Text(_loginError!,
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                            height: 0.8,
                                                            fontSize: 12,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            fontFamily:
                                                                'Lora')))
                                            ])),
                                        const SizedBox(height: 21),
                                        SizedBox(
                                            width: 185.5,
                                            height: 32.5,
                                            child: TextField(
                                                controller: _loginController,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'[a-zA-Z0-9]')),
                                                ],
                                                decoration: InputDecoration(
                                                    fillColor:
                                                        const Color(0xffF0F09B),
                                                    border:
                                                        const OutlineInputBorder(),
                                                    enabledBorder: OutlineInputBorder(
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
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        fontFamily: "Lora",
                                                        fontSize: 15),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .fromLTRB(
                                                            10, 5, 0, 5)),
                                                style: const TextStyle(
                                                    fontFamily: 'Jost',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black))),
                                        const SizedBox(height: 16),
                                        SizedBox(
                                            width: 185.5,
                                            height: 35,
                                            child: Row(children: [
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
                                                    width: 111,
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
                                            ])),
                                        const SizedBox(height: 9),
                                        SizedBox(
                                            width: 185.5,
                                            height: 32.5,
                                            child: TextField(
                                                controller: _passwordController,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          r'[a-zA-Z0-9]')),
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
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        fontFamily: "Lora",
                                                        fontSize: 15),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .fromLTRB(
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
            )),
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
                    recognizer: TapGestureRecognizer()
                      ..onTap = goToRegistration),
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
