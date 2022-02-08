import 'dart:convert';
import 'package:fyp_real/model/pharmacy_model/pharmacy_donated_model.dart';
import 'package:get/get.dart';

class PharmacyDonatedController extends GetxController {
  var donatedMeds = [].obs;

  void allDonatedMeds(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    donatedMeds.value = it.map((e) => PharmacyDonatedModel.fromMap(e)).toList();
  }
}
