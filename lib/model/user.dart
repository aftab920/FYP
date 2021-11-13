import 'package:json_annotation/json_annotation.dart';
//import 'package:json_serializable/builder.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "Id")
  late int id;

  @JsonKey(name: "Name")
  late String name;

  @JsonKey(name: "Email")
  late String email;

  @JsonKey(name: "Password")
  late String password;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.fromMap(Map<String, dynamic> mp) {
    id = mp['Id'];
    name = mp['Name'];
    email = mp['Email'];
    password = mp['Password'];
  }
}
