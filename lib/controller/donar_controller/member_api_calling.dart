import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/donar_controller/donated_cash_controller.dart';
import 'package:fyp_real/controller/donar_controller/donated_med_controller.dart';
import 'package:fyp_real/controller/donar_controller/receipts_controller.dart';
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
        Get.snackbar("Successfull", "Our collector will reach out to you soon");
        Get.to(() => MemberOverview());
      } else {
        Get.snackbar("Alert!", "Only Request once at a time.");
        print('Collector calling failed');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getReceipt() async {
    try {
      String uri = '${globals.baseUrl}/Donor/AllReceipts?did=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<ReceiptsController>().allReceipts(response);
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
        Get.snackbar("Successfull",
            "Funds Donated, Waiting for the pharmacy to confirm!");
        // Get.to(() => AuthScreen());
      } else
        print('insertion failed');
      Get.snackbar("Error", "Error Adding Funds");
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

  Future confirmDonation(pharmacyId, amount) async {
    try {
      String uri =
          '${globals.baseUrl}/donor/confirmDonation?pharmacyId=$pharmacyId&donorId=${globals.id}&amount=$amount';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "pharmacyId": pharmacyId.toString(),
            "donorId": globals.id.toString(),
            "amount": amount.toString(),
          },
        ),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('inserted');
        //AdminApiCalling().LoginAdmin(globals.email, globals.pswd);
        Get.snackbar("Successfull", "Funds Donation Confirmed");
      } else {
        print('insertion failed');
        Get.snackbar("Error", "Error Adding Funds");
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future rejectDonation() async {
    try {
      String uri =
          '${globals.baseUrl}/Donor/rejectDonation?donorId=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        // AdminApiCalling().LoginAdmin(globals.email, globals.pswd);
        Get.snackbar("Alert", "Rejected Succesfully");
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    } on Exception catch (e) {
      Get.snackbar("Exception!", '$e');
    }
  }

  Future<List> getAlertReceipt() async {
    try {
      String uri = '${globals.baseUrl}/Donor/AllReceipts?did=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Get.snackbar(
        //   'Confirmation', "Donation Request confirmation",
        //   duration: Duration(days: 1),
        //   //onTap: ,
        //   // mainButton: TextButton(
        //   //   onPressed: () {Navigator.pop(context)},
        //   //   child: Text('click'),

        //   // ),
        // );

        return data;
      } else {
        print('There is some problem status code not 200');
        print(response.body);
        return [];
      }
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }

  Future getDonatedCash() async {
    try {
      String uri =
          '${globals.baseUrl}/Donor/getDonatedCash?donorId=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<DonatedCashController>().allDonated(response);
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    } on Exception catch (e) {
      Get.snackbar("Exception!", '$e');
    }
  }
}
