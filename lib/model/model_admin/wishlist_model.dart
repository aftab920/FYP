import 'package:json_annotation/json_annotation.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class WishlistModel {
  @JsonKey(name: "Wishid")
  late int id;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Type")
  late String type;

  WishlistModel();

  factory WishlistModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistModelFromJson(json);
  Map<String, dynamic> toJson() => _$WishlistModelToJson(this);

  WishlistModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Wishid'];
    name = mp['Medname'];
    type = mp['Type'];
  }
}
