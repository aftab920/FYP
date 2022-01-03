// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthUnitModel _$HealthUnitModelFromJson(Map<String, dynamic> json) =>
    HealthUnitModel()
      ..id = json['Huid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String
      ..type = json['Type'] as String
      ..deleteStatus = json['deletestatus'] as String;

Map<String, dynamic> _$HealthUnitModelToJson(HealthUnitModel instance) =>
    <String, dynamic>{
      'Huid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
      'Type': instance.type,
      'deletestatus': instance.deleteStatus,
    };
