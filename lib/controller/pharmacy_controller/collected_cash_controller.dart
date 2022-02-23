import 'dart:convert';

import 'package:fyp_real/model/donor_model/receipt_model.dart';
import 'package:fyp_real/model/pharmacy_model/collected_cash_model.dart';
import 'package:get/get.dart';

class CollectedCashController extends GetxController {
  var collections = [].obs;

  void allCollection(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    collections.value = it.map((e) => CollectedCashModel.fromMap(e)).toList();
  }
}
