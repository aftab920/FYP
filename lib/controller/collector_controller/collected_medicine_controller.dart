import 'dart:convert';
import 'package:fyp_real/model/model_collector/collected_med_model.dart';
import 'package:get/get.dart';

class CollectedMedicinesController extends GetxController {
  var res;
  var allCollected = [].obs;

  void allCollectedMedicines(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allCollected.value = it.map((e) => CollectedMedModel.fromMap(e)).toList();
  }
}
