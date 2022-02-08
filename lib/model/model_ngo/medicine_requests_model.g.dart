// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineRequestsModel _$MedicineRequestsModelFromJson(
        Map<String, dynamic> json) =>
    MedicineRequestsModel()
      ..stockid = json['Hustockid'] as int
      ..name = json['Medname'] as String
      ..quantity = json['Requestedqty'] as int
      ..type = json['Medtype'] as String
      ..expiry = DateTime.parse(json['Medexpiry'] as String)
      ..huid = json['Healthunitid'] as int;

Map<String, dynamic> _$MedicineRequestsModelToJson(
        MedicineRequestsModel instance) =>
    <String, dynamic>{
      'Hustockid': instance.stockid,
      'Medname': instance.name,
      'Requestedqty': instance.quantity,
      'Medtype': instance.type,
      'Medexpiry': instance.expiry.toIso8601String(),
      'Healthunitid': instance.huid,
    };
