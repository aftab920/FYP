import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_real/model/medicine_requests_model.dart';
import 'package:get/get.dart';

class MedicineRequestsController extends GetxController {
  var res;
  var allRequests = [].obs;

  void allMedicneRequests(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allRequests.value =
        it.map((e) => MedicineRequestsModel.fromMap(e)).toList();
  }
}
