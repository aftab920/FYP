import 'dart:convert';

import 'package:fyp_real/model/model_admin/medicine_donated_model.dart';
import 'package:get/get.dart';

class MedicineDonatedController extends GetxController {
  var res;
  var allDonated = [].obs;

  void allMedicineDonated(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allDonated.value = it.map((e) => MedicineDonatedModel.fromMap(e)).toList();
  }
}
