import 'package:flutter/material.dart';
import 'package:ievent/login.dart';
import 'package:ievent/main_page.dart';
import 'package:ievent/post.dart';
import 'package:ievent/problem.dart';
import 'package:ievent/registration.dart';
import 'package:ievent/registration_auth.dart';

void main() => runApp(const IEvent());

class IEvent extends StatelessWidget {
  const IEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/registration': (context) => const MainRegistration(),
        '/user_type': (context) => const RegistrationAuth(),
        '/main_page': (context) => const MainPage(),
        '/post': (context) => const Post(),
        '/problem': (context) => const Problem()
      },
    );
  }
}
