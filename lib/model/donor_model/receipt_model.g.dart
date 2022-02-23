// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) => ReceiptModel()
  ..id = json['PharmacyId'] as int
  ..name = json['Name'] as String
  ..amount = json['Amount'] as int
  ..assisName = json['assisName'] as String;

Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) =>
    <String, dynamic>{
      'PharmacyId': instance.id,
      'Name': instance.name,
      'Amount': instance.amount,
      'assisName': instance.assisName,
    };
