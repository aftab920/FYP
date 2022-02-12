import 'package:json_annotation/json_annotation.dart';

part 'receive_med_model.g.dart';

@JsonSerializable()
class ReceivedMedModel {
  @JsonKey(name: "Hustockid")
  late int stockId;

  @JsonKey(name: "Connectedngoid")
  late int ngoId;

  @JsonKey(name: "Medname")
  late String medName;

  @JsonKey(name: "Medtype")
  late String type;

  @JsonKey(name: "Requestedqty")
  late int quantity;

  @JsonKey(name: "Recievedstatus")
  late int rcvStatus;

  @JsonKey(name: "Medexpiry")
  late String expiry;

  ReceivedMedModel();

  factory ReceivedMedModel.fromJson(Map<String, dynamic> json) =>
      _$ReceivedMedModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReceivedMedModelToJson(this);

  ReceivedMedModel.fromMap(Map<String, dynamic> mp) {
    stockId = mp['Hustockid'];
    medName = mp['Medname'];
    type = mp['Medtype'];
    quantity = mp['Requestedqty'];
    rcvStatus = mp['Recievedstatus'];
    ngoId = mp['Connectedngoid'];
    expiry = mp['Medexpiry'];
  }
}
