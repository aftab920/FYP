// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_donated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDonatedModel _$AllDonatedModelFromJson(Map<String, dynamic> json) =>
    AllDonatedModel()
      ..id = json['Huid'] as int
      ..HUname = json['Name'] as String
      ..name = json['Medname'] as String
      ..type = json['Type'] as String
      ..expiry = json['Expiry'] as String
      ..address = json['Address'] as String
      ..quantity = json['Donatedquantity'] as int;

Map<String, dynamic> _$AllDonatedModelToJson(AllDonatedModel instance) =>
    <String, dynamic>{
      'Huid': instance.id,
      'Name': instance.HUname,
      'Medname': instance.name,
      'Type': instance.type,
      'Expiry': instance.expiry,
      'Address': instance.address,
      'Donatedquantity': instance.quantity,
    };
