import 'package:flutter/material.dart';

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
                ClipPath(
                  clipper: MyCustomClipperOne(),
                  child: Container(
                    width: 284,
                    height: 321,
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 52),
                            SizedBox(
                                width: 185.5,
                                height: 23,
                                child: Text(login,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Jost"),
                                    textAlign: TextAlign.left)),
                            SizedBox(height: 21),
                            SizedBox(
                                width: 185.5,
                                height: 32.5,
                                child: TextField(
                                  decoration: InputDecoration(
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
                                          EdgeInsets.fromLTRB(10, 5, 0, 5)),
                                )),
                            SizedBox(height: 16),
                            SizedBox(
                                width: 185.5,
                                height: 23,
                                child: Text(password,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Jost"),
                                    textAlign: TextAlign.left)),
                            SizedBox(height: 21),
                            SizedBox(
                                width: 185.5,
                                height: 32.5,
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
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
                                          EdgeInsets.fromLTRB(10, 5, 0, 5)),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: const Text(pass))
              ],
            )
          ]),
        ),
        floatingActionButton: Container(
            width: 160,
            height: 26,
            color: const Color(0xff0C8746),
            child: FloatingActionButton(
                onPressed: () {},
                child: const Text(
                  account,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Jost',
                      fontSize: 18),
                ))),
      ),
    );
  }
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
