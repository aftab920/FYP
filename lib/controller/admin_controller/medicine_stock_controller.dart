import 'dart:convert';
import 'package:fyp_real/model/model_admin/medicine_stock_model.dart';
import 'package:get/get.dart';

class MedicineStockController extends GetxController {
  var allStock = [].obs;

  void allMedicineStock(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allStock.value = it.map((e) => MedicineStockModel.fromMap(e)).toList();
  }
}
