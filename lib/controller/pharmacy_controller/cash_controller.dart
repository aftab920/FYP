import 'dart:convert';
import 'package:fyp_real/model/pharmacy_model/cash_model.dart';
import 'package:get/get.dart';

class CashController extends GetxController {
  var res;
  var cash = [].obs;

  void cashRecord(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    cash.value = it.map((e) => CashModel.fromMap(e)).toList();
  }
}
