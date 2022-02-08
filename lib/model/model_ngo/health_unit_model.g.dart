// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthUnitModel _$HealthUnitModelFromJson(Map<String, dynamic> json) =>
    HealthUnitModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String
      ..type = json['Type'] as String
      ..deleteStatus = json['BlockStatus'] as int;

Map<String, dynamic> _$HealthUnitModelToJson(HealthUnitModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
      'Type': instance.type,
      'BlockStatus': instance.deleteStatus,
    };
