import 'dart:convert';

import 'package:fyp_real/model/donor_model/receipt_model.dart';
import 'package:get/get.dart';

class ReceiptsController extends GetxController {
  var receipts = [].obs;

  void allReceipts(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    receipts.value = it.map((e) => ReceiptModel.fromMap(e)).toList();
  }
}
