import 'dart:convert';

import 'package:fyp_real/model/model_admin/medicine_available_model.dart';
import 'package:get/get.dart';

class MedicineAvailableController extends GetxController {
  var res;
  var allAvailable = [].obs;

  void allAvailableMedicine(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allAvailable.value =
        it.map((e) => MedicineAvailableModel.fromMap(e)).toList();
  }
}
