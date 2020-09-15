// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version(
    key: json['key'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'name': instance.name,
    };
