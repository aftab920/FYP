import 'dart:convert';

import 'package:fyp_real/model/model_ngo/all_donated_model.dart';
import 'package:get/get.dart';

class AllDonatedController extends GetxController {
  var donatedMeds = [].obs;

  void allDonatedMeds(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    donatedMeds.value = it.map((e) => AllDonatedModel.fromMap(e)).toList();
  }
}
