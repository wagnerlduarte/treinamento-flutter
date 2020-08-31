import 'package:exercicio_5/register.page.dart';
import 'package:exercicio_5/verification.page.dart';
import 'package:flutter/material.dart';

import 'login.page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFE83F3F),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/verification': (context) => VerificationPage(ModalRoute.of(context).settings.arguments),
      },
    ),
  );
}
