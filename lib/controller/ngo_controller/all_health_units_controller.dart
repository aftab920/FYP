import 'dart:convert';

import 'package:fyp_real/model/model_ngo/health_unit_model.dart';
import 'package:get/get.dart';

class AllHealthUnitsController extends GetxController {
  var healthUnits = [].obs;

  void allHealthUnits(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    healthUnits.value = it.map((e) => HealthUnitModel.fromMap(e)).toList();
  }
}
