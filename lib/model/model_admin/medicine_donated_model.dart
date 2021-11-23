import 'package:json_annotation/json_annotation.dart';
//import 'package:json_serializable/builder.dart';

part 'medicine_donated_model.g.dart';

@JsonSerializable()
class MedicineDonatedModel {
  @JsonKey(name: "Id")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Donated_By")
  late String donatedBy;

  @JsonKey(name: "Date")
  late String date;

  @JsonKey(name: "Quantity")
  late int quantity;

  MedicineDonatedModel();

  factory MedicineDonatedModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineDonatedModelFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineDonatedModelToJson(this);

  MedicineDonatedModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Id'];
    name = mp['Name'];
    donatedBy = mp['Donated_By'];
    date = mp['Date'];
    quantity = mp['Quantity'];
  }
}
