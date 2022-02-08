import 'package:json_annotation/json_annotation.dart';

part 'collected_med_model.g.dart';

@JsonSerializable()
class CollectedMedModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Medname")
  late String medName;

  @JsonKey(name: "Quantity")
  late int quantity;

  CollectedMedModel();

  factory CollectedMedModel.fromJson(Map<String, dynamic> json) =>
      _$CollectedMedModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectedMedModelToJson(this);

  CollectedMedModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    medName = mp['Medname'];
    quantity = mp['Quantity'];
  }
}
