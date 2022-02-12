import 'package:json_annotation/json_annotation.dart';

part 'ngo_stock_model.g.dart';

@JsonSerializable()
class NgoStockModel {
  @JsonKey(name: "Ngostockid")
  late int id;

  @JsonKey(name: "MedName")
  late String name;

  @JsonKey(name: "Quantity")
  late int quantity;

  @JsonKey(name: "Type")
  late String type;

  @JsonKey(name: "Expiry")
  late String expiryDate;

  // @JsonKey(name: "Status")
  // late String status;

  NgoStockModel();

  factory NgoStockModel.fromJson(Map<String, dynamic> json) =>
      _$NgoStockModelFromJson(json);
  Map<String, dynamic> toJson() => _$NgoStockModelToJson(this);

  NgoStockModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Ngostockid'];
    name = mp['Medname'];
    quantity = mp['Quantity'];
    expiryDate = mp['Expiry'];
    type = mp['Type'];
//    status = mp['Status'];
  }
}
