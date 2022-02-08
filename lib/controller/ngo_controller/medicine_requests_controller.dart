import 'dart:convert';

import 'package:fyp_real/model/model_ngo/medicine_requests_model.dart';
import 'package:get/get.dart';

class MedicineRequestsController extends GetxController {
  var res;
  var allRequests = [].obs;

  void allMedicineRequests(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allRequests.value =
        it.map((e) => MedicineRequestsModel.fromMap(e)).toList();
  }
}
