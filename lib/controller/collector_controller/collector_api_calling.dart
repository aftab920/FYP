import 'dart:convert';

import 'package:fyp_real/controller/collector_controller/donation_requests_controller.dart';
import 'package:fyp_real/screens/screens_collector.dart/collector_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;

class CollectorApiCalling {
  String baseUrl = 'http://192.168.0.111/ApiDemo/api/';

  Future getDonationRequests() async {
    try {
      String uri = '$baseUrl/collector/allDonationRequests';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<DonationRequestsController>().allDonationRequests(response);
      } else {
        print('insertion failed');
        Get.to(CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future addMedicine(
      name, quantity, type, expiryDate, collectorId, donorId) async {
    try {
      String uri = '$baseUrl/collector/addMedicine';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<DonationRequestsController>().allDonationRequests(response);
      } else {
        print('Failed');
        Get.to(CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future acceptDonation(id) async {
    try {
      String uri = '$baseUrl/collector/acceptdonation';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "id": id,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
      } else {
        print('Failed');
        Get.to(CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
