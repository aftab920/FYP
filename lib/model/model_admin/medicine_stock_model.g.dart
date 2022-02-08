// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineStockModel _$MedicineStockModelFromJson(Map<String, dynamic> json) =>
    MedicineStockModel()
      ..id = json['sqid'] as int
      ..name = json['Medname'] as String
      ..quantity = json['Totalquantity'] as int;

Map<String, dynamic> _$MedicineStockModelToJson(MedicineStockModel instance) =>
    <String, dynamic>{
      'sqid': instance.id,
      'Medname': instance.name,
      'Totalquantity': instance.quantity,
    };
