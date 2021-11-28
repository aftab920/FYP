import 'package:json_annotation/json_annotation.dart';

part 'all_users_model.g.dart';

@JsonSerializable()
class AllUsersModel {
  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Email")
  late String email;

  @JsonKey(name: "Phone")
  late String phone;

  AllUsersModel();

  factory AllUsersModel.fromJson(Map<String, dynamic> json) =>
      _$AllUsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllUsersModelToJson(this);

  AllUsersModel.fromMap(Map<String, dynamic> mp) {
    name = mp['Name'];
    email = mp['Email'];
    phone = mp['Phone'];
  }
}
