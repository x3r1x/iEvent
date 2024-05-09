import 'package:flutter/material.dart';
import 'package:ievent/pages/login.dart';
import 'package:ievent/pages/main_page.dart';
import 'package:ievent/pages/post.dart';
import 'package:ievent/pages/problem.dart';
import 'package:ievent/pages/registration.dart';
import 'package:ievent/pages/registration_auth.dart';
import 'package:ievent/pages/registration_password.dart';

void main() => runApp(const IEvent());

class IEvent extends StatelessWidget {
  const IEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/registraion_password',
      routes: {
        '/': (context) => const Login(),
        '/registration': (context) => const MainRegistration(),
        '/registraion_password': (context) => const RegistrationPassword(),
        '/user_type': (context) => const RegistrationAuth(),
        '/main_page': (context) => const MainPage(),
        '/post': (context) => const Post(),
        '/problem': (context) => const Problem()
      },
    );
  }
}
