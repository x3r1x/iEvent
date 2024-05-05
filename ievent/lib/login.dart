import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  Widget build(BuildContext context) {
    const header = 'Вход';
    const login = 'Логин';
    const password = 'Пароль';

    return MaterialApp(
      title: header,
      home: Scaffold(
        backgroundColor: const Color(0xff0C8746),
        body: SafeArea(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 179)),
                const Text(header,
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Dela Gothic One',
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
                const Padding(padding: EdgeInsets.only(top: 40)),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    width: 284,
                    height: 321,
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 52)),
                            Text(
                              login,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Jost"),
                            ),
                            Padding(padding: EdgeInsets.only(top: 16)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

/*  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState(); */
}

class MyCustomClipper extends CustomClipper<Path> {
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

/*class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/
