// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_donated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineDonatedModel _$MedicineDonatedModelFromJson(
        Map<String, dynamic> json) =>
    MedicineDonatedModel()
      ..id = json['Id'] as int
      ..name = json['Name'] as String
      ..donatedBy = json['Donated_By'] as String
      ..date = json['Date'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$MedicineDonatedModelToJson(
        MedicineDonatedModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Donated_By': instance.donatedBy,
      'Date': instance.date,
      'Quantity': instance.quantity,
    };
