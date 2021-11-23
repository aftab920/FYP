import 'package:json_annotation/json_annotation.dart';

part 'medicine_available_model.g.dart';

@JsonSerializable()
class MedicineAvailableModel {
  @JsonKey(name: "Id")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Expiry_Date")
  late String date;

  @JsonKey(name: "Quantity")
  late int quantity;

  MedicineAvailableModel();

  factory MedicineAvailableModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineAvailableModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineAvailableModelToJson(this);

  MedicineAvailableModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Id'];
    name = mp['Name'];
    date = mp['Expiry_Date'];
    quantity = mp['Quantity'];
  }
}
