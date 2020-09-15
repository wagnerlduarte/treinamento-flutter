import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.model.g.dart';

@JsonSerializable(nullable: false)
class VehicleModel {
  final String id;
  final String key;
  final String name;
  final String type;
  final int brand;

  VehicleModel({
    @required this.key,
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.brand,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}
