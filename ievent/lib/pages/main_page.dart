import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

late String userToken;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  Image event = const Image(image: AssetImage('assets/images/events.png'));
  Image problem = const Image(image: AssetImage('assets/images/problems.png'));
  Image profile = const Image(image: AssetImage('assets/images/account.png'));

  void resetImages() {
    setState(() {
      event = const Image(image: AssetImage('assets/images/events.png'));
      problem = const Image(image: AssetImage('assets/images/problems.png'));
      profile = const Image(image: AssetImage('assets/images/account.png'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffF6F6A8)),
      home: Scaffold(
        body: const SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 56),
                SizedBox(height: 197, child: Row()),
                SizedBox(height: 15)
              ],
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              setState(() {
                currentPageIndex = index;
                if (currentPageIndex == 0) {
                  resetImages();
                  setState(() {
                    event = const Image(
                        image: AssetImage('assets/images/selected_events.png'));
                  });
                }
                if (currentPageIndex == 1) {
                  resetImages();
                  setState(() {
                    problem = const Image(
                        image:
                            AssetImage('assets/images/selected_problems.png'));
                  });
                }
                if (currentPageIndex == 2) {
                  resetImages();
                }
              });
            },
            backgroundColor: const Color(0xff0C8746),
            currentIndex: currentPageIndex,
            selectedItemColor: const Color(0xff0E6437),
            items: [
              BottomNavigationBarItem(icon: event, label: 'События'),
              BottomNavigationBarItem(icon: problem, label: 'Проблемы'),
              BottomNavigationBarItem(icon: profile, label: 'Аккаунт')
            ]),
      ),
    );
  }
}

class MyCustomClipperOne extends CustomClipper<Path> {
  static const double radius = 17;

  @override
  Path getClip(size) {
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
