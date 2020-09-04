import 'package:exercicio_9/models/dog.response.dart';
import 'package:dio/dio.dart';

class Api {
  static Future<DogResponse> retrieveDog([String breed]) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://dog.ceo/api/';

    String url = breed != null && breed.isNotEmpty
        ? 'breed/$breed/images'
        : 'breeds/image';

    Response response;

    try {
      response = await dio.get('$url/random');
    } on DioError catch (e) {
      response = e.response;
    }

    return DogResponse.fromJson(response.data);
  }
}
