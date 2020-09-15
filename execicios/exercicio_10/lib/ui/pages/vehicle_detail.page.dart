import 'dart:convert';

import 'package:exercicio_10/models/vehicle.model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleDetailPageArguments {
  final Vehicle vehicle;

  VehicleDetailPageArguments(this.vehicle);
}

class VehicleDetailPage extends StatefulWidget {
  final VehicleDetailPageArguments args;

  VehicleDetailPage(this.args);

  @override
  _VehicleDetailPageState createState() => _VehicleDetailPageState();
}

class _VehicleDetailPageState extends State<VehicleDetailPage> {
  _addToFavorites() async {
    List<String> vehicles = List();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    vehicles = prefs.getStringList('favorites');

    var encodedVehicle = jsonEncode(widget.args.vehicle);

    if (!vehicles.contains(encodedVehicle)) {
      vehicles.add(jsonEncode(widget.args.vehicle));
      prefs.setStringList('favorites', vehicles);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.args.vehicle.name),
          ],
        ),
        leading: new IconButton(
          color: Colors.white,
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    '${widget.args.vehicle.marca} - ${widget.args.vehicle.veiculo}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Year model: ${widget.args.vehicle.anoModelo}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Fuel: ${widget.args.vehicle.combustivel}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Brand: ${widget.args.vehicle.marca}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Value: ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      widget.args.vehicle.preco,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Reference: ${widget.args.vehicle.referencia}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => _addToFavorites(),
                    child: Text(
                      'Add to favorites',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
