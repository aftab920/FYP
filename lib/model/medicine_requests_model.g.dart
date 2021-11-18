// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineRequestsModel _$MedicineRequestsModelFromJson(
        Map<String, dynamic> json) =>
    MedicineRequestsModel()
      ..id = json['Id'] as int
      ..name = json['Name'] as String
      ..requestedBy = json['Requested_By'] as String
      ..quantity = json['Quantity'] as int;

Map<String, dynamic> _$MedicineRequestsModelToJson(
        MedicineRequestsModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Requested_By': instance.requestedBy,
      'Quantity': instance.quantity,
    };
