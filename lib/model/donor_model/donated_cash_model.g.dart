// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donated_cash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonatedCashModel _$DonatedCashModelFromJson(Map<String, dynamic> json) =>
    DonatedCashModel()
      ..pharmName = json['PharmacyName'] as String
      ..amount = json['Amount'] as int;

Map<String, dynamic> _$DonatedCashModelToJson(DonatedCashModel instance) =>
    <String, dynamic>{
      'PharmacyName': instance.pharmName,
      'Amount': instance.amount,
    };
