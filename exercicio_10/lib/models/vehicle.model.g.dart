// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return Vehicle(
    key: json['key'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    anoModelo: json['ano_modelo'] as String,
    marca: json['marca'] as String,
    veiculo: json['veiculo'] as String,
    preco: json['preco'] as String,
    combustivel: json['combustivel'] as String,
    referencia: json['referencia'] as String,
    fipeCodigo: json['fipeCodigo'] as String,
  );
}

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'key': instance.key,
      'id': instance.id,
      'ano_modelo': instance.anoModelo,
      'marca': instance.marca,
      'name': instance.name,
      'veiculo': instance.veiculo,
      'preco': instance.preco,
      'combustivel': instance.combustivel,
      'referencia': instance.referencia,
      'fipeCodigo': instance.fipeCodigo,
    };
