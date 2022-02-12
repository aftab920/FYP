import 'package:json_annotation/json_annotation.dart';
//import 'package:json_serializable/builder.dart';

part 'medicine_requests_model.g.dart';

@JsonSerializable()
class MedicineRequestsModel {
  @JsonKey(name: "Hustockid")
  late int stockid;

  @JsonKey(name: "Medname")
  late String name;

  @JsonKey(name: "Requestedqty")
  late int quantity;

  @JsonKey(name: "Medtype")
  late String type;

  // @JsonKey(name: "Medexpiry")
  // late DateTime expiry;

  @JsonKey(name: "Healthunitid")
  late int huid;

  MedicineRequestsModel();

  factory MedicineRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineRequestsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineRequestsModelToJson(this);

  MedicineRequestsModel.fromMap(Map<String, dynamic> mp) {
    stockid = mp['Hustockid'];
    name = mp['Medname'];
    quantity = mp['Requestedqty'];
    type = mp['Medtype'];
    huid = mp['Healthunitid'];
    //expiry = mp['Medexpiry'];
  }
}
