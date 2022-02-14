// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_donated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyDonatedModel _$PharmacyDonatedModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyDonatedModel()
      ..name = json['Medname'] as String
      ..type = json['Type'] as String
      ..expiry = json['Expiry'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$PharmacyDonatedModelToJson(
        PharmacyDonatedModel instance) =>
    <String, dynamic>{
      'Medname': instance.name,
      'Type': instance.type,
      'Expiry': instance.expiry,
      'Quantity': instance.quantity,
    };
