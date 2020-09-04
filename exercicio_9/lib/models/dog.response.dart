import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog.response.g.dart';

@JsonSerializable(nullable: false)
class DogResponse {
  final String message;
  final String status;

  DogResponse({@required this.message, @required this.status});

  factory DogResponse.fromJson(Map<String, dynamic> json) =>
      _$DogResponseFromJson(json);
}
