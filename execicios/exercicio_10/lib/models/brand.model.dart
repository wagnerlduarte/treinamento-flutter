import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'brand.model.g.dart';

@JsonSerializable(nullable: false)
class Brand {
  final int id;
  final String key;
  final String name;
  final String type;

  Brand( {
    @required this.key,
    @required this.id,
    @required this.name,
    @required this.type,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
