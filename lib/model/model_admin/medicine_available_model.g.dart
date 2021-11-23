// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_available_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineAvailableModel _$MedicineAvailableModelFromJson(
        Map<String, dynamic> json) =>
    MedicineAvailableModel()
      ..id = json['Id'] as int
      ..name = json['Name'] as String
      ..date = json['Expiry_Date'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$MedicineAvailableModelToJson(
        MedicineAvailableModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Expiry_Date': instance.date,
      'Quantity': instance.quantity,
    };
