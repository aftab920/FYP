import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_model.g.dart';

@JsonSerializable()
class PharmacyModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Address")
  late String address;

  @JsonKey(name: "BlockStatus")
  late int blockStatus;

  PharmacyModel();

  factory PharmacyModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyModelToJson(this);

  PharmacyModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    address = mp['Address'];
    blockStatus = mp['BlockStatus'];
  }
}
