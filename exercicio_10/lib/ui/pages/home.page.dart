import 'package:exercicio_10/models/pages/params_list_page.model.dart';
import 'package:flutter/material.dart';

import 'brand_list.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class VehicleType {
  final String id;
  final String label;

  final IconData icon;

  VehicleType({
    @required this.id,
    @required this.label,
    @required this.icon,
  });
}

class _HomePageState extends State<HomePage> {
  List<VehicleType> types = [
    VehicleType(id: 'carros', label: 'Cars', icon: Icons.directions_car),
    VehicleType(id: 'motos', label: 'Motorcycles', icon: Icons.motorcycle),
    VehicleType(id: 'caminhoes', label: 'Trucks', icon: Icons.local_shipping)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIPE Table'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorite');
            },
            icon: Icon(Icons.favorite),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                types.map<Widget>((type) => _buildCard(context, type)).toList(),
          ),
        ),
      ),
    );
  }
}

Widget _buildCard(BuildContext context, VehicleType type) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/brand_list', arguments: BrandListPageArguments(ParamsListPageModel(id: type.id, label: type.label)));
      },
      child: Container(
        height: 80,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type.label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              type.icon,
              color: Colors.white,
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    ),
  );
}
