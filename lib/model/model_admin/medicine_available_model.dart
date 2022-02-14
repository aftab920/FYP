import 'package:json_annotation/json_annotation.dart';

part 'medicine_available_model.g.dart';

@JsonSerializable()
class MedicineAvailableModel {
  @JsonKey(name: "Whstockid")
  late int id;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Expiry")
  late String date;

  @JsonKey(name: "Quantity")
  late int quantity;

  MedicineAvailableModel();

  factory MedicineAvailableModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineAvailableModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineAvailableModelToJson(this);

  MedicineAvailableModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Whstockid'];
    name = mp['Medname'];
    date = mp['Expiry'];
    quantity = mp['Quantity'];
  }
}
