// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donated_med_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonatedMedModel _$DonatedMedModelFromJson(Map<String, dynamic> json) =>
    DonatedMedModel()
      ..id = json['Donor_id'] as int
      ..name = json['Medname'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$DonatedMedModelToJson(DonatedMedModel instance) =>
    <String, dynamic>{
      'Donor_id': instance.id,
      'Medname': instance.name,
      'Quantity': instance.quantity,
    };
