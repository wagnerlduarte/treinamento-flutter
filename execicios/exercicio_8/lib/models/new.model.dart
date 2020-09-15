import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new.model.g.dart';

@JsonSerializable()
class New {
  final String id;
  final String title;
  final String description;
  final String url;
  final String author;
  final String image;
  final List<String> category;

  New({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.author,
    @required this.image,
    @required this.category,
  });

  factory New.fromJson(Map<String, dynamic> json) => _$NewFromJson(json);
}
