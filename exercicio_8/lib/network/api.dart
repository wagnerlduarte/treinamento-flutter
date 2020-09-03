import 'package:exercicio7start/models/news.response.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static Future<NewsResponse> retrieveLocalNews(BuildContext context) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.currentsapi.services/';

    Response response = await dio.get('v1/latest-news?apiKey=${DotEnv().env['API_KEY']}');

    return NewsResponse.fromJson(response.data);
  }
}
