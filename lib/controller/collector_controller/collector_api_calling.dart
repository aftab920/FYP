import 'dart:convert';

import 'package:fyp_real/controller/collector_controller/collected_medicine_controller.dart';
import 'package:fyp_real/controller/collector_controller/collector_donation_requests_controller.dart';
import 'package:fyp_real/screens/screens_collector.dart/collector_overview.dart';
import 'package:fyp_real/screens/screens_collector.dart/pharmacy_donation_manage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../variables.dart' as globals;

class CollectorApiCalling {
  String baseUrl = 'http://192.168.143.35/ApiDemo/api/';

  Future getDonationRequests() async {
    try {
      String uri = '${globals.baseUrl}/collector/allDonationRequests';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<CollectorDonationRequestsController>()
            .allDonationRequests(response);
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
      String uri = '${globals.baseUrl}/collector/addMedicine';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "Medname": name,
          "Quantity": quantity,
          "Type": type,
          "Expiry": expiryDate,
          "Collector_id": collectorId.toString(),
          "Donor_id": donorId.toString(),
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.snackbar("Successfull", "Added Succesfully");
      } else {
        print('Failed');
        Get.snackbar("Error", "Something went wrong");
        Get.to(CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future doneDonation() async {
    try {
      String uri =
          '${globals.baseUrl}/collector/doneDonation?donorId=${globals.donorId}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.snackbar("Successfull", "All Collected");
        Get.to(() => CollectorOverview());
      } else {
        print('Failed');
        Get.to(() => CollectorOverview());
      }
    } catch (e) {}
  }

  Future acceptDonation(id) async {
    try {
      String uri = '${globals.baseUrl}/collector/acceptdonation?id=$id';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
      } else {
        print('Failed');
        Get.to(() => CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getCollectedMedicines() async {
    try {
      String uri =
          '${globals.baseUrl}/collector/getCollectedMed?id=${globals.id}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<CollectedMedicinesController>()
            .allCollectedMedicines(response);
      } else {
        print('Failed');
        Get.to(() => CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // Future getUserType() async {
  //   try {
  //     String uri =
  //         '${globals.baseUrl}/collector/getUserType?id=${globals.donorId}';

  //     var response = await http1.get(
  //       Uri.parse(uri),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //     );
  //     print(response.body);
  //     var data = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       print('Successfull');
  //       if (data[0] == "pharmacy" || data[0] == "Pharmacy") {
  //         Get.to(() => PharmacyDonationManage());
  //       }
  //     } else {
  //       print('Failed');
  //       Get.to(() => CollectorOverview());
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  Future addFunds(amount) async {
    try {
      String uri = '${globals.baseUrl}/collector/addFunds';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "Amount": amount,
          "Collector_id": globals.id,
          "Donor_id": globals.donorId,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.snackbar("Successfull", "Added Succesfully");
      } else {
        print('Failed');
        Get.snackbar("Error", "Something went wrong");
        Get.to(() => CollectorOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
