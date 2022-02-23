// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collected_cash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectedCashModel _$CollectedCashModelFromJson(Map<String, dynamic> json) =>
    CollectedCashModel()
      ..donName = json['donorName'] as String
      ..amount = json['amount'] as int
      ..assisName = json['assistantName'] as String;

Map<String, dynamic> _$CollectedCashModelToJson(CollectedCashModel instance) =>
    <String, dynamic>{
      'donorName': instance.donName,
      'amount': instance.amount,
      'assistantName': instance.assisName,
    };
