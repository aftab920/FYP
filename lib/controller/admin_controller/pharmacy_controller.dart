import 'dart:convert';

import 'package:fyp_real/model/model_admin/pharmacy_list_model.dart';
import 'package:get/get.dart';

class PharmacyController extends GetxController {
  var pharmacylist = [].obs;

  void allPharmacies(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    pharmacylist.value = it.map((e) => PharmacyListModel.fromMap(e)).toList();
  }
}
