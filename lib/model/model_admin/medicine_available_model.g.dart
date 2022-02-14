// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_available_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineAvailableModel _$MedicineAvailableModelFromJson(
        Map<String, dynamic> json) =>
    MedicineAvailableModel()
      ..id = json['Whstockid'] as int
      ..name = json['Medname'] as String
      ..date = json['Medname'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$MedicineAvailableModelToJson(
        MedicineAvailableModel instance) =>
    <String, dynamic>{
      'Whstockid': instance.id,
      'Medname': instance.name,
      'Expiry': instance.date,
      'Quantity': instance.quantity,
    };
