import 'package:json_annotation/json_annotation.dart';

part 'health_unit_model.g.dart';

@JsonSerializable()
class HealthUnitModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Address")
  late String address;

  @JsonKey(name: "Type")
  late String type;

  @JsonKey(name: "BlockStatus")
  late int deleteStatus;

  HealthUnitModel();

  factory HealthUnitModel.fromJson(Map<String, dynamic> json) =>
      _$HealthUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$HealthUnitModelToJson(this);

  HealthUnitModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    address = mp['Address'];
    type = mp['Type'];
    deleteStatus = mp['BlockStatus'];
  }
}
