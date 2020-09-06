// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) {
  return VehicleModel(
    key: json['key'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    brand: json['brand'] as int,
  );
}

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'brand': instance.brand,
    };
