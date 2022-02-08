// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineRequestsModel _$MedicineRequestsModelFromJson(
        Map<String, dynamic> json) =>
    MedicineRequestsModel()
      ..wishid = json['Wishid'] as int
      ..medName = json['Medname'] as String
      ..type = json['Type'] as String
      ..quantity = json['Quantity'] as int
      ..requestedNgoId = json['Userid'] as int
      ..status = json['Provided_status'] as int;

Map<String, dynamic> _$MedicineRequestsModelToJson(
        MedicineRequestsModel instance) =>
    <String, dynamic>{
      'Wishid': instance.wishid,
      'Medname': instance.medName,
      'Type': instance.type,
      'Quantity': instance.quantity,
      'Userid': instance.requestedNgoId,
      'Provided_status': instance.status,
    };
