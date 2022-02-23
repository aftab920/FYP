import 'package:json_annotation/json_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel {
  @JsonKey(name: "PharmacyId")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Amount")
  late int amount;

  @JsonKey(name: "assisName")
  late String assisName;

  ReceiptModel();

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);

  ReceiptModel.fromMap(Map<String, dynamic> mp) {
    id = mp['PharmacyId'];
    name = mp['Name'];
    amount = mp['Amount'];
    assisName = mp['assisName'];
  }
}
