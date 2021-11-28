// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUsersModel _$AllUsersModelFromJson(Map<String, dynamic> json) =>
    AllUsersModel()
      ..name = json['Name'] as String
      ..email = json['Email'] as String
      ..phone = json['Phone'] as String;

Map<String, dynamic> _$AllUsersModelToJson(AllUsersModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Email': instance.email,
      'Phone': instance.phone,
    };
