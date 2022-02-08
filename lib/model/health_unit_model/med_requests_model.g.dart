// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'med_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedRequestsModel _$MedRequestsModelFromJson(Map<String, dynamic> json) =>
    MedRequestsModel()
      ..stockId = json['Hustockid'] as int
      ..medName = json['Medname'] as String
      ..type = json['Medtype'] as String
      ..quantity = json['Requestedqty'] as int
      ..rcvStatus = json['Recievedstatus'] as int;

Map<String, dynamic> _$MedRequestsModelToJson(MedRequestsModel instance) =>
    <String, dynamic>{
      'Hustockid': instance.stockId,
      'Medname': instance.medName,
      'Medtype': instance.type,
      'Requestedqty': instance.quantity,
      'Recievedstatus': instance.rcvStatus,
    };
