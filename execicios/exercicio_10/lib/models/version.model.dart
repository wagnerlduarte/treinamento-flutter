import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'version.model.g.dart';

@JsonSerializable(nullable: false)
class Version {
  final String key;
  final String id;
  final String name;

  Version({
    @required this.key,
    @required this.id,
    @required this.name,
  });

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
}
