import 'package:json_annotation/json_annotation.dart';

part 'donation_request_model.g.dart';

@JsonSerializable()
class DonationRequestsModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Address")
  late String address;

  @JsonKey(name: "Amount_donated")
  late int amount;

  DonationRequestsModel();

  factory DonationRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$DonationRequestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$DonationRequestsModelToJson(this);

  DonationRequestsModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    address = mp['Address'];
    amount = mp['Amount_donated'];
  }
}
