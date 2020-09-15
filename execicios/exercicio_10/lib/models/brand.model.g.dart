// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) {
  return Brand(
    key: json['key'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
    };
