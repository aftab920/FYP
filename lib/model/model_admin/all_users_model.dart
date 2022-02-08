import 'package:json_annotation/json_annotation.dart';

part 'all_users_model.g.dart';

@JsonSerializable()
class AllUsersModel {
  @JsonKey(name: "Userid")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Email")
  late String email;

  @JsonKey(name: "Type")
  late String type;

  AllUsersModel();

  factory AllUsersModel.fromJson(Map<String, dynamic> json) =>
      _$AllUsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllUsersModelToJson(this);

  AllUsersModel.fromMap(Map<String, dynamic> mp) {
    id = mp['Userid'];
    name = mp['Name'];
    email = mp['Email'];
    type = mp['Type'];
  }
}
