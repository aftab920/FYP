import 'package:json_annotation/json_annotation.dart';

part 'medicine_request_model.g.dart';

@JsonSerializable()
class MedicineRequestsModel {
  @JsonKey(name: "Wishid")
  late int wishid;

  @JsonKey(name: "Medname")
  late String medName;

  @JsonKey(name: "Type")
  late String type;

  @JsonKey(name: "Quantity")
  late int quantity;

  @JsonKey(name: "Userid")
  late int requestedNgoId;

  @JsonKey(name: "Provided_status")
  late int status;

  MedicineRequestsModel();

  factory MedicineRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineRequestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineRequestsModelToJson(this);

  MedicineRequestsModel.fromMap(Map<String, dynamic> mp) {
    wishid = mp['Wishid'];
    medName = mp['Medname'];
    type = mp['Type'];
    quantity = mp['Quantity'];
    requestedNgoId = mp['Userid'];
    status = mp['Provided_status'];
  }
}
