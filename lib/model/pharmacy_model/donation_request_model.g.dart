// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationRequestsModel _$DonationRequestsModelFromJson(
        Map<String, dynamic> json) =>
    DonationRequestsModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..address = json['Address'] as String
      ..amount = json['Amount_donated'] as int;

Map<String, dynamic> _$DonationRequestsModelToJson(
        DonationRequestsModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Address': instance.address,
      'Amount_donated': instance.amount,
    };
