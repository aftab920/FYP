import 'package:json_annotation/json_annotation.dart';

part 'donated_med_model.g.dart';

@JsonSerializable()
class DonatedMedModel {
  @JsonKey(name: "Donor_id")
  late int id;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Quantity")
  late int quantity;

  @JsonKey(name: "Expiry")
  late String expiry;

  DonatedMedModel();

  factory DonatedMedModel.fromJson(Map<String, dynamic> json) =>
      _$DonatedMedModelFromJson(json);
  Map<String, dynamic> toJson() => _$DonatedMedModelToJson(this);

  DonatedMedModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Donor_id'];
    name = mp['Medname'];
    quantity = mp['Quantity'];
    expiry = mp['Expiry'];
  }
}
