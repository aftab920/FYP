import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_donated_model.g.dart';

@JsonSerializable()
class PharmacyDonatedModel {
  // @JsonKey(name: "Wishlist_id")
  // late int id;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Type")
  late String type;

  @JsonKey(name: "Expiry")
  late String expiry;

  @JsonKey(name: "Quantity")
  late int quantity;

  PharmacyDonatedModel();

  factory PharmacyDonatedModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyDonatedModelFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyDonatedModelToJson(this);

  PharmacyDonatedModel.fromMap(Map<String, dynamic> mp) {
    // id = mp['Wishlist_id'];
    name = mp['Medname'];
    type = mp['Type'];
    expiry = mp['Expiry'];
    quantity = mp['Quantity'];
  }
}
