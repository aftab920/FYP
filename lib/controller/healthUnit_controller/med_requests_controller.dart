import 'dart:convert';
import 'package:fyp_real/model/health_unit_model/med_requests_model.dart';
import 'package:get/get.dart';

class MedRequestsStatusController extends GetxController {
  var reqStatus = [].obs;

  void requestsStatus(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    reqStatus.value = it.map((e) => MedRequestsModel.fromMap(e)).toList();
  }
}
