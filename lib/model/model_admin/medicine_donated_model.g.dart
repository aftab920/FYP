// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_donated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineDonatedModel _$MedicineDonatedModelFromJson(
        Map<String, dynamic> json) =>
    MedicineDonatedModel()
      ..name = json['Name'] as String
      ..medName = json['Medname'] as String
      ..quantity = json['quantity'] as int
      ..expiry = json['Expiry'] as String;

Map<String, dynamic> _$MedicineDonatedModelToJson(
        MedicineDonatedModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Medname': instance.medName,
      'quantity': instance.quantity,
      'Expiry': instance.expiry,
    };
