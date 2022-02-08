import 'dart:convert';
import 'package:fyp_real/model/donor_model/donated_med_model.dart';
import 'package:get/get.dart';

class DonatedMedController extends GetxController {
  var medicines = [].obs;

  void allDonated(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    medicines.value = it.map((e) => DonatedMedModel.fromMap(e)).toList();
  }
}
