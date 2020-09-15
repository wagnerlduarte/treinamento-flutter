import 'package:exercicio_10/models/brand.model.dart';
import 'package:exercicio_10/models/pages/params_list_page.model.dart';
import 'package:exercicio_10/network/api.dart';
import 'package:exercicio_10/ui/components/list_item.widget.dart';
import 'package:exercicio_10/ui/components/loader.widget.dart';
import 'package:exercicio_10/ui/pages/vehicle_list.page.dart';
import 'package:flutter/material.dart';

class BrandListPageArguments {
  final ParamsListPageModel params;

  BrandListPageArguments(this.params);
}

class BrandListPage extends StatefulWidget {
  final BrandListPageArguments args;

  BrandListPage(this.args);

  @override
  _BrandListPageState createState() => _BrandListPageState();
}

class _BrandListPageState extends State<BrandListPage> {
  List<Brand> _brandsResponse;

  _loadBrands() async {
    if (_brandsResponse == null) {
      _brandsResponse = await Api.loadBrands(widget.args.params.id);
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
    if (_brandsResponse == null) {
      return Loader();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.args.params.label),
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
            Brand brand = this._brandsResponse[index];
            return ListItem(
              text: brand.name,
              onTap: () => {
                Navigator.pushNamed(context, '/vehicle_list',
                    arguments: VehicleListPageArguments(brand))
              },
            );
          },
          itemCount: this._brandsResponse.length,
        ),
      ),
    );
  }
}
