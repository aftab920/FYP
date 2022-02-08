import 'package:json_annotation/json_annotation.dart';

part 'med_requests_model.g.dart';

@JsonSerializable()
class MedRequestsModel {
  @JsonKey(name: "Hustockid")
  late int stockId;

  @JsonKey(name: "Medname")
  late String medName;

  @JsonKey(name: "Medtype")
  late String type;

  @JsonKey(name: "Requestedqty")
  late int quantity;

  @JsonKey(name: "Recievedstatus")
  late int rcvStatus;

  MedRequestsModel();

  factory MedRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$MedRequestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedRequestsModelToJson(this);

  MedRequestsModel.fromMap(Map<String, dynamic> mp) {
    stockId = mp['Hustockid'];
    medName = mp['Medname'];
    type = mp['Medtype'];
    quantity = mp['Requestedqty'];
    rcvStatus = mp['Recievedstatus'];
  }
}
