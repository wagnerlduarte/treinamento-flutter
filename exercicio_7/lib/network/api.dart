import 'dart:convert';

import 'package:exercicio7start/models/new.model.dart';
import 'package:flutter/material.dart';

class Api {
  static Future<List<New>> retrieveLocalNews(BuildContext context) async {
    final String json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/feed_data.json');

    final dynamic data = JsonDecoder().convert(json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    List<New> news = [];
    data['news'].forEach((item) {
      var notice = New(
        id: item['id'],
        title: item['title'],
        author:item['author'],
        description: item['description'],
        image: item['image'],
        url: item['url'],
      );

      news.add(notice);
    });

    return news;
  }
}
