import 'package:flutter/material.dart';

import 'home.page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFE83F3F),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    ),
  );
}
