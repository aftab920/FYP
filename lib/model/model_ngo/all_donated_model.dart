import 'package:json_annotation/json_annotation.dart';

part 'all_donated_model.g.dart';

@JsonSerializable()
class AllDonatedModel {
  @JsonKey(name: "Huid")
  late int id;

  @JsonKey(name: "Name")
  late String HUname;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Type")
  late String type;

  @JsonKey(name: "Expiry")
  late String expiry;

  @JsonKey(name: "Address")
  late String address;

  @JsonKey(name: "Donatedquantity")
  late int quantity;

  AllDonatedModel();

  factory AllDonatedModel.fromJson(Map<String, dynamic> json) =>
      _$AllDonatedModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllDonatedModelToJson(this);

  AllDonatedModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Huid'];
    HUname = mp['Name'];
    name = mp['Medname'];
    type = mp['Type'];
    expiry = mp['Expiry'];
    address = mp['Address'];
    quantity = mp['Donatedquantity'];
  }
}
