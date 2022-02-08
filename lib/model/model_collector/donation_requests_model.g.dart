// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectorDonationRequestsModel _$CollectorDonationRequestsModelFromJson(
        Map<String, dynamic> json) =>
    CollectorDonationRequestsModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String;

Map<String, dynamic> _$CollectorDonationRequestsModelToJson(
        CollectorDonationRequestsModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
    };
