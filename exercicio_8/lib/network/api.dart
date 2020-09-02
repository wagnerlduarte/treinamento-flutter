import 'dart:convert';

import 'package:exercicio7start/models/new.model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Api {
  static Future<List<New>> retrieveLocalNews(BuildContext context) async {

    Dio dio = Dio();
    dio.options.baseUrl = 'https://api.currentsapi.services/';

    Response response = await dio.get('v1/latest-news?apiKey=YcIsZ0zdsQPIBeCptBhTTHcRvinK1DzwaoAQE61uelNT1nbu');

    List<New> news = [];
    response.data['news'].forEach((item) {

      List<String> categories = [];

      item['category'].forEach((category) {
        categories.add(category);
      });

      var notice = New(
        id: item['id'],
        title: item['title'],
        author:item['author'],
        description: item['description'],
        image: item['image'],
        url: item['url'],
        category: categories,
      );

      news.add(notice);
    });

    return news;
  }
}
