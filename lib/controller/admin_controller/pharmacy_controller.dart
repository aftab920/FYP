import 'dart:convert';
import 'package:fyp_real/model/donor_model/pharmacy_model.dart';
import 'package:get/get.dart';

class PharmacyController extends GetxController {
  var pharmacylist = [].obs;

  void allPharmacies(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    pharmacylist.value = it.map((e) => PharmacyModel.fromMap(e)).toList();
  }
}
