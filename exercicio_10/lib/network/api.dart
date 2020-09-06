import 'package:exercicio_10/models/brand.model.dart';
import 'package:dio/dio.dart';
import 'package:exercicio_10/models/vehicle.model.dart';
import 'package:exercicio_10/models/vehicle_model.model.dart';
import 'package:exercicio_10/models/version.model.dart';

class Api {
  static Future<List<Brand>> loadBrands(String type) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${type}/marcas.json');

    return response.data.map<Brand>((brand) {
      brand['type'] = type;

      return Brand.fromJson(brand);
    }).toList();
  }

  static Future<List<VehicleModel>> loadVehicles(String type, int brandId) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${type}/veiculos/${brandId}.json');

    return response.data.map<VehicleModel>((vehicle){
      vehicle['type'] = type;
      vehicle['brand'] = brandId;

      return VehicleModel.fromJson(vehicle);
    }).toList();
  }

  static Future<List<Version>> loadVersions({String type, int brandId, String modelId}) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${type}/veiculo/${brandId}/${modelId}.json');

    return response.data.map<Version>((version) =>  Version.fromJson(version)).toList();
  }

  static Future<Vehicle> loadVehicle({String type, int brandId, String modelId, String version}) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://fipeapi.appspot.com/api/1/';

    Response response = await dio.get('${type}/veiculo/${brandId}/${modelId}/${version}.json');

    return Vehicle.fromJson(response.data);
  }
}
