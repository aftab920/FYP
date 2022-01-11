// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyModel _$PharmacyModelFromJson(Map<String, dynamic> json) =>
    PharmacyModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String
      ..blockStatus = json['BlockStatus'] as int;

Map<String, dynamic> _$PharmacyModelToJson(PharmacyModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
      'BlockStatus': instance.blockStatus,
    };
