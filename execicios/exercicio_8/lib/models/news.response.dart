import 'package:json_annotation/json_annotation.dart';
import 'new.model.dart';

part 'news.response.g.dart';

@JsonSerializable(nullable: false)
class NewsResponse {
  final List<New> news;

  NewsResponse({this.news});

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}
