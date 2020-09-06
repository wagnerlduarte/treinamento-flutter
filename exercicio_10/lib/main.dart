
import 'package:exercicio_10/ui/pages/vehicle_detail.page.dart';
import 'package:exercicio_10/ui/pages/vehicle_list.page.dart';
import 'package:exercicio_10/ui/pages/vehicle_model_list.page.dart';
import 'package:flutter/material.dart';

import 'ui/pages/favorite.page.dart';
import 'ui/pages/home.page.dart';
import 'ui/pages/brand_list.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/favorite': (context) => FavoritePage(),
        '/brand_list': (context) => BrandListPage(ModalRoute.of(context).settings.arguments),
        '/vehicle_list': (context) => VehicleListPage(ModalRoute.of(context).settings.arguments),
        '/vehicle_model_list': (context) => VehicleModelListPage(ModalRoute.of(context).settings.arguments),
        '/vehicle_detail': (context) => VehicleDetailPage(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}