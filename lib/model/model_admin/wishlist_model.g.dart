// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistModel _$WishlistModelFromJson(Map<String, dynamic> json) =>
    WishlistModel()
      ..id = json['Wishid'] as int
      ..name = json['Medname'] as String
      ..type = json['Type'] as String;

Map<String, dynamic> _$WishlistModelToJson(WishlistModel instance) =>
    <String, dynamic>{
      'Wishid': instance.id,
      'Medname': instance.name,
      'Type': instance.type,
    };
