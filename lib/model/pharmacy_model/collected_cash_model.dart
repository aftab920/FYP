import 'package:json_annotation/json_annotation.dart';

part 'collected_cash_model.g.dart';

@JsonSerializable()
class CollectedCashModel {
  @JsonKey(name: "donorName")
  late String donName;

  @JsonKey(name: "amount")
  late int amount;

  @JsonKey(name: "assistantName")
  late String assisName;

  CollectedCashModel();

  factory CollectedCashModel.fromJson(Map<String, dynamic> json) =>
      _$CollectedCashModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectedCashModelToJson(this);

  CollectedCashModel.fromMap(Map<String, dynamic> mp) {
    donName = mp['donorName'];
    amount = mp['amount'];
    assisName = mp['assistantName'];
  }
}
