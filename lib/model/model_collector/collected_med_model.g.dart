// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collected_med_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectedMedModel _$CollectedMedModelFromJson(Map<String, dynamic> json) =>
    CollectedMedModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..medName = json['Medname'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$CollectedMedModelToJson(CollectedMedModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Medname': instance.medName,
      'Quantity': instance.quantity,
    };
