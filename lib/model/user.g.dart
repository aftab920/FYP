// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['Id'] as int
  //..name = json['Name'] as String
  ..email = json['Email'] as String
  ..password = json['Password'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.id,
      //  'Name': instance.name,
      'Email': instance.email,
      'Password': instance.password,
    };
