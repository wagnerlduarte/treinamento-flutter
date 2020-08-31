import 'package:exemplo_4/food_detail.page.dart';
import 'package:exemplo_4/food_list.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor:  Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FoodListPage(),
        '/second': (context) => FoodDetailPage(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}
