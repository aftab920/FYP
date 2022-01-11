// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ngo_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NgoStockModel _$NgoStockModelFromJson(Map<String, dynamic> json) =>
    NgoStockModel()
      ..id = json['Ngostockid'] as int
      ..name = json['MedName'] as String
      ..quantity = json['Quantity'] as int
      ..type = json['Type'] as String
      ..expiryDate = json['Expiry'] as String
      ..status = json['Status'] as String;

Map<String, dynamic> _$NgoStockModelToJson(NgoStockModel instance) =>
    <String, dynamic>{
      'Ngostockid': instance.id,
      'MedName': instance.name,
      'Quantity': instance.quantity,
      'Type': instance.type,
      'Expiry': instance.expiryDate,
      'Status': instance.status,
    };
