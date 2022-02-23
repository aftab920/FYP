import 'dart:convert';
import 'package:fyp_real/model/donor_model/donated_cash_model.dart';
import 'package:fyp_real/model/donor_model/donated_med_model.dart';
import 'package:get/get.dart';

class DonatedCashController extends GetxController {
  var cash = [].obs;

  void allDonated(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    cash.value = it.map((e) => DonatedCashModel.fromMap(e)).toList();
  }
}
