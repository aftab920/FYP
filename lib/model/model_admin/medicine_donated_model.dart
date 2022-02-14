import 'package:json_annotation/json_annotation.dart';
//import 'package:json_serializable/builder.dart';

part 'medicine_donated_model.g.dart';

@JsonSerializable()
class MedicineDonatedModel {
  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Medname")
  late String medName;

  @JsonKey(name: "quantity")
  late int quantity;

  @JsonKey(name: "Expiry")
  late String expiry;

  MedicineDonatedModel();

  factory MedicineDonatedModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineDonatedModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineDonatedModelToJson(this);

  MedicineDonatedModel.fromMap(Map<String, dynamic> mp) {
    name = mp['Name'];
    medName = mp['Medname'];
    quantity = mp['quantity'];
    expiry = mp['Expiry'];
  }
}
