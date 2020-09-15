// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return NewsResponse(
    news: (json['news'] as List)
        .map((e) => New.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'news': instance.news,
    };
