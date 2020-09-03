// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

New _$NewFromJson(Map<String, dynamic> json) {
  return New(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    author: json['author'] as String,
    image: json['image'] as String,
    category: (json['category'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$NewToJson(New instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'author': instance.author,
      'image': instance.image,
      'category': instance.category,
    };
