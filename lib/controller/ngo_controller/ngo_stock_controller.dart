import 'dart:convert';
import 'package:fyp_real/model/model_ngo/ngo_stock_model.dart';
import 'package:get/get.dart';

class NgoStockController extends GetxController {
  var availableMedicines = [].obs;

  void ngoStock(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    availableMedicines.value = it.map((e) => NgoStockModel.fromMap(e)).toList();
  }
}
