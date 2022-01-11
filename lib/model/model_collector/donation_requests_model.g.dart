// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationRequestsModel _$DonationRequestsModelFromJson(
        Map<String, dynamic> json) =>
    DonationRequestsModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String;

Map<String, dynamic> _$DonationRequestsModelToJson(
        DonationRequestsModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
    };
