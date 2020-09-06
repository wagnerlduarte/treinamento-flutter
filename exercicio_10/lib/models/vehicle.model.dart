import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle.model.g.dart';

@JsonSerializable(nullable: false)
class Vehicle {
  final String key;
  final String id;
  @JsonKey(name: 'ano_modelo')
  final String anoModelo;
  final String marca;
  final String name;
  final String veiculo;
  final String preco;
  final String combustivel;
  final String referencia;
  final String fipeCodigo;

  Vehicle({
    @required this.key,
    @required this.id,
    @required this.name,
    @required this.anoModelo,
    @required this.marca,
    @required this.veiculo,
    @required this.preco,
    @required this.combustivel,
    @required this.referencia,
    @required this.fipeCodigo,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
