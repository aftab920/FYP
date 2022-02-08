// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUsersModel _$AllUsersModelFromJson(Map<String, dynamic> json) =>
    AllUsersModel()
      ..id = json['Userid'] as int
      ..name = json['Name'] as String
      ..email = json['Email'] as String
      ..type = json['Type'] as String;

Map<String, dynamic> _$AllUsersModelToJson(AllUsersModel instance) =>
    <String, dynamic>{
      'Userid': instance.id,
      'Name': instance.name,
      'Email': instance.email,
      'Type': instance.type,
    };
