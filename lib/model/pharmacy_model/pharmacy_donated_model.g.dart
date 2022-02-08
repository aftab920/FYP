// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_donated_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyDonatedModel _$PharmacyDonatedModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyDonatedModel()
      ..id = json['Wishlist_id'] as int
      ..name = json['Medname'] as String
      ..type = json['Type'] as String
      ..amount = json['Med_amount'] as int
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$PharmacyDonatedModelToJson(
        PharmacyDonatedModel instance) =>
    <String, dynamic>{
      'Wishlist_id': instance.id,
      'Medname': instance.name,
      'Type': instance.type,
      'Med_amount': instance.amount,
      'Quantity': instance.quantity,
    };
