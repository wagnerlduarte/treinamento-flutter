import 'package:exercicio_10/models/brand.model.dart';
import 'package:exercicio_10/models/vehicle_model.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:exercicio_10/ui/components/list_item.widget.dart';
import 'package:exercicio_10/ui/components/loader.widget.dart';
import 'package:exercicio_10/ui/pages/vehicle_model_list.page.dart';
import 'package:flutter/material.dart';

class VehicleListPageArguments {
  final Brand brand;

  VehicleListPageArguments(this.brand);
}

class VehicleListPage extends StatefulWidget {
  final VehicleListPageArguments args;

  VehicleListPage(this.args);

  @override
  _VehicleListPageState createState() => _VehicleListPageState();
}

class _VehicleListPageState extends State<VehicleListPage> {
  List<VehicleModel> _vehicleModelsResponse;

  _loadBrands() async {
    if (_vehicleModelsResponse == null) {
      _vehicleModelsResponse =
          await Api.loadVehicles(widget.args.brand.type, widget.args.brand.id);
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
    if (_vehicleModelsResponse == null) {
      return Loader();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.args.brand.name),
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
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            VehicleModel model = this._vehicleModelsResponse[index];
            return ListItem(
              text: model.name,
              onTap: () => {
                Navigator.pushNamed(context, '/vehicle_model_list',
                    arguments: VehicleModelListPageArguments(model))
              },
            );
          },
          itemCount: this._vehicleModelsResponse.length,
        ),
      ),
    );
  }
}
