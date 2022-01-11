import 'dart:convert';

import 'package:fyp_real/model/donor_model/pharmacy_model.dart';
import 'package:get/get.dart';

class PharmacyController extends GetxController {
  var pharmacies = [].obs;

  void allpharmacies(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    pharmacies.value = it.map((e) => PharmacyModel.fromMap(e)).toList();
  }
}
