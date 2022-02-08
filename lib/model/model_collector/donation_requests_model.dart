import 'package:json_annotation/json_annotation.dart';

part 'donation_requests_model.g.dart';

@JsonSerializable()
class CollectorDonationRequestsModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Address")
  late String address;

  CollectorDonationRequestsModel();

  factory CollectorDonationRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectorDonationRequestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectorDonationRequestsModelToJson(this);

  CollectorDonationRequestsModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    address = mp['Address'];
  }
}
