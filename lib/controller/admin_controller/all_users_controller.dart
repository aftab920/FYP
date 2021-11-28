import 'dart:convert';
import 'package:fyp_real/model/model_admin/all_users_model.dart';
import 'package:get/get.dart';

class AllUsersController extends GetxController {
  var res;
  var allUsers = [].obs;

  void allRegisteredUsers(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allUsers.value = it.map((e) => AllUsersModel.fromMap(e)).toList();
  }
}
