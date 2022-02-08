import 'package:json_annotation/json_annotation.dart';

part 'medicine_stock_model.g.dart';

@JsonSerializable()
class MedicineStockModel {
  @JsonKey(name: "sqid")
  late int id;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Totalquantity")
  late int quantity;

  MedicineStockModel();

  factory MedicineStockModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineStockModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineStockModelToJson(this);

  MedicineStockModel.fromMap(Map<String, dynamic> mp) {
    id = mp['sqid'];
    name = mp['Medname'];
    quantity = mp['Totalquantity'];
  }
}
