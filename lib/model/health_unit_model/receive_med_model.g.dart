// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_med_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedMedModel _$ReceivedMedModelFromJson(Map<String, dynamic> json) =>
    ReceivedMedModel()
      ..stockId = json['Hustockid'] as int
      ..ngoId = json['Connectedngoid'] as int
      ..medName = json['Medname'] as String
      ..type = json['Medtype'] as String
      ..quantity = json['Requestedqty'] as int
      ..rcvStatus = json['Recievedstatus'] as int
      ..expiry = json['Medexpiry'] as String;

Map<String, dynamic> _$ReceivedMedModelToJson(ReceivedMedModel instance) =>
    <String, dynamic>{
      'Hustockid': instance.stockId,
      'Connectedngoid': instance.ngoId,
      'Medname': instance.medName,
      'Medtype': instance.type,
      'Requestedqty': instance.quantity,
      'Recievedstatus': instance.rcvStatus,
      'Medexpiry': instance.expiry,
    };
