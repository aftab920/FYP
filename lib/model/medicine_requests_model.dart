import 'package:json_annotation/json_annotation.dart';
//import 'package:json_serializable/builder.dart';

part 'medicine_requests_model.g.dart';

@JsonSerializable()
class MedicineRequestsModel {
  @JsonKey(name: "Id")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Requested_By")
  late String requestedBy;

  // @JsonKey(name: "Password")
  // late String password;

  @JsonKey(name: "Quantity")
  late int quantity;

  MedicineRequestsModel();

  factory MedicineRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineRequestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineRequestsModelToJson(this);

  MedicineRequestsModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Id'];
    name = mp['Name'];
    requestedBy = mp['Requested_By'];
    //password = mp['Password'];
    quantity = mp['Quantity'];
  }
}
