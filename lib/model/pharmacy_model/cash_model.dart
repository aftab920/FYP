import 'package:json_annotation/json_annotation.dart';

part 'cash_model.g.dart';

@JsonSerializable()
class CashModel {
  @JsonKey(name: "AvailableCash")
  late int cash;

  CashModel();

  factory CashModel.fromJson(Map<String, dynamic> json) =>
      _$CashModelFromJson(json);
  Map<String, dynamic> toJson() => _$CashModelToJson(this);

  CashModel.fromMap(Map<String, dynamic> mp) {
    cash = mp['AvailableCash'];
  }
}
