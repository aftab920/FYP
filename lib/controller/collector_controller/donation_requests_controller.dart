import 'dart:convert';
import 'package:fyp_real/model/model_collector/donation_requests_model.dart';
import 'package:get/get.dart';

class DonationRequestsController extends GetxController {
  var res;
  var allRequests = [].obs;

  void allDonationRequests(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    allRequests.value =
        it.map((e) => DonationRequestsModel.fromMap(e)).toList();
  }
}
