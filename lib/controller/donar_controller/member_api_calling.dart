import 'dart:convert';

import 'package:fyp_real/controller/donar_controller/donated_med_controller.dart';
import 'package:fyp_real/controller/donar_controller/pharmacy_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens_donar/member_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../../controller/variables.dart' as globals;

class MemberApiCalling {
  String baseUrl = 'http://192.168.143.35/ApiDemo/api/';

  Future RegisterUser(name, email, password, phone, address, type) async {
    try {
      String uri = '${globals.baseUrl}/RegisterUser';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
          "address": address,
          "type": type,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('inserted');
        Get.to(() => AuthScreen());
      } else
        print('insertion failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future DonateMed(id) async {
    try {
      String uri = '${globals.baseUrl}/donor/donatemed?id=$id';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "id": id.toString(),
          },
        ),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        print('Called the collector');
        Get.to(() => MemberOverview());
      } else
        print('Collector calling failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAllPharmacies() async {
    try {
      String uri = '${globals.baseUrl}/Donor/Allpharmacies';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<PharmacyController>().allpharmacies(response);
        //return allRequestsController.allRequests;
      } else {
        print('There is some problem status code not 200');
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future donateFunds(donorId, pharmacyId, amount) async {
    try {
      String uri = '${globals.baseUrl}/donor/donateFunds';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "DonorId": donorId.toString(),
          "PharmacyId": pharmacyId.toString(),
          "Amount": amount.toString(),
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('inserted');
        // Get.to(() => AuthScreen());
      } else
        print('insertion failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getDonatedMeds() async {
    try {
      String uri = '${globals.baseUrl}/donor/getDonatedMeds?id=${globals.id}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<DonatedMedController>().allDonated(response);
      } else {
        print('Getting Donated medicine data failed');
        Get.to(() => MemberOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
