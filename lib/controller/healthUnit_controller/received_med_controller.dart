import 'dart:convert';
import 'package:fyp_real/model/health_unit_model/receive_med_model.dart';
import 'package:get/get.dart';

class ReceivedMedController extends GetxController {
  var reqStatus = [].obs;

  void requestsStatus(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    reqStatus.value = it.map((e) => ReceivedMedModel.fromMap(e)).toList();
  }
}
