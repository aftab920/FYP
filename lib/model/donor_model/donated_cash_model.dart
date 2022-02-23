import 'package:json_annotation/json_annotation.dart';

part 'donated_cash_model.g.dart';

@JsonSerializable()
class DonatedCashModel {
  @JsonKey(name: "PharmacyName")
  late String pharmName;

  @JsonKey(name: "Amount")
  late int amount;

  DonatedCashModel();

  factory DonatedCashModel.fromJson(Map<String, dynamic> json) =>
      _$DonatedCashModelFromJson(json);
  Map<String, dynamic> toJson() => _$DonatedCashModelToJson(this);

  DonatedCashModel.fromMap(Map<String, dynamic> mp) {
    pharmName = mp['PharmacyName'];
    amount = mp['Amount'];
  }
}
