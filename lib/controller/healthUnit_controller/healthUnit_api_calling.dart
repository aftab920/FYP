import 'dart:convert';

import 'package:fyp_real/controller/healthUnit_controller/med_requests_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/screens_healthunit/healthunit_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../../controller/variables.dart' as globals;

class HUApiCalling {
  Future medicineRequest(medName, quantity, type) async {
    try {
      String uri = '${globals.baseUrl}/healthunit/RequestMed';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "healthunitid": globals.id.toString(),
          "medName": medName,
          "Medquantity": quantity,
          "medtype": type,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('Got Med');
        Get.to(() => HealthUnitOverview());
      } else
        print('No Med');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getMedicineRequestsStatus(type) async {
    try {
      String uri =
          '${globals.baseUrl}/Healthunit/getMedicineRequestsStatus?id=${globals.id}&reqType=$type';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<MedRequestsStatusController>().requestsStatus(response);
      } else {
        print('Failed');
        Get.to(HealthUnitOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
