// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogResponse _$DogResponseFromJson(Map<String, dynamic> json) {
  return DogResponse(
    message: json['message'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$DogResponseToJson(DogResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
