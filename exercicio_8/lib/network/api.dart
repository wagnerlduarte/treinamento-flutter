import 'package:exercicio7start/models/news.response.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Api {
  static Future<NewsResponse> retrieveLocalNews(BuildContext context) async {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.currentsapi.services/';

    Response response = await dio.get('v1/latest-news?apiKey=YcIsZ0zdsQPIBeCptBhTTHcRvinK1DzwaoAQE61uelNT1nbu');

    return NewsResponse.fromJson(response.data);
  }
}
