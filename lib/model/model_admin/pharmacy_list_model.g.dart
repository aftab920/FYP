// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyListModel _$PharmacyListModelFromJson(Map<String, dynamic> json) =>
    PharmacyListModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String
      ..cash = json['AvailableCash'] as int;

Map<String, dynamic> _$PharmacyListModelToJson(PharmacyListModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
      'AvailableCash': instance.cash,
    };
