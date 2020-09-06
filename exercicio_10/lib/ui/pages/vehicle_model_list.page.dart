import 'package:exercicio_10/models/vehicle.model.dart';
import 'package:exercicio_10/models/vehicle_model.model.dart';
import 'package:exercicio_10/models/version.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:exercicio_10/ui/components/list_item.widget.dart';
import 'package:exercicio_10/ui/components/loader.widget.dart';
import 'package:exercicio_10/ui/pages/vehicle_detail.page.dart';
import 'package:flutter/material.dart';

class VehicleModelListPageArguments {
  final VehicleModel model;

  VehicleModelListPageArguments(this.model);
}

class VehicleModelListPage extends StatefulWidget {
  final VehicleModelListPageArguments args;

  VehicleModelListPage(this.args);

  @override
  _VehicleModelListPageState createState() => _VehicleModelListPageState();
}

class _VehicleModelListPageState extends State<VehicleModelListPage> {
  List<Version> _versionsResponse;

  _loadBrands() async {
    if (_versionsResponse == null) {
      _versionsResponse = await Api.loadVersions(type: widget.args.model.type, brandId: widget.args.model.brand, modelId: widget.args.model.id);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _loadBrands();
  }

  @override
  Widget build(BuildContext context) {

    if (_versionsResponse == null) {
      return Loader();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.args.model.name),
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
      body: Container(
        child:
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Version version = this._versionsResponse[index];
            Vehicle vehicle;
            return ListItem(
              text: version.name,
              onTap: () async {
                vehicle = await Api.loadVehicle(type: widget.args.model.type, brandId: widget.args.model.brand, modelId: widget.args.model.id, version: version.id);

                Navigator.pushNamed(context, '/vehicle_detail', arguments: VehicleDetailPageArguments(vehicle));
              },
            );
          },
          itemCount: this._versionsResponse.length,
        ),
      ),
    );
  }
}
