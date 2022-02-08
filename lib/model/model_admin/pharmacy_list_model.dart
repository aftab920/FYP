import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_list_model.g.dart';

@JsonSerializable()
class PharmacyListModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Address")
  late String address;

  @JsonKey(name: "AvailableCash")
  late int cash;

  PharmacyListModel();

  factory PharmacyListModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyListModelFromJson(json);
  Map<String, dynamic> toJson() => _$PharmacyListModelToJson(this);

  PharmacyListModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    address = mp['Address'];
    cash = mp['AvailableCash'];
  }
}
