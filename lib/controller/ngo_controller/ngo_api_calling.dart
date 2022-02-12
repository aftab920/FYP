import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/all_donated_controller.dart';
import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/medicine_requests_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens_ngo/ngo_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../variables.dart' as globals;
import '../../screens_ngo/health_unit.dart' as valueChanger;

class NgoApiCalling {
  String baseUrlMedicine = 'http://192.168.85.35/ApiDemo/api/requested_med';

  Future RegisterNGO(name, email, password, regNo, address, type) async {
    try {
      String uri = '${globals.baseUrl}/userData/RegisterUser';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "email": email,
          "password": password,
          "regno": regNo,
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

  Future getAllHealthUnits() async {
    try {
      String uri = '${globals.baseUrl}/NGO/AllHealthUnits?id=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<AllHealthUnitsController>().allHealthUnits(response);
      } else {
        print('There is some problem status code not 200');
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future getAvailableStock() async {
    try {
      String uri = '${globals.baseUrl}/NGO/AvailableMedicines?id=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<NgoStockController>().ngoStock(response);
        //return allRequestsController.allRequests;
      } else {
        print('There is some problem status code not 200');
        print(response.body);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future medicineRequest(String name, String quantity, String type) async {
    try {
      String uri = '${globals.baseUrl}/NGO/RequestMed';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "ngouserid": globals.id.toString(),
          "medName": name,
          "Medquantity": quantity,
          "medtype": type,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        Get.to(() => NGOOverview());
      } else
        print('No Med');
    } on Exception catch (e) {
      print(e);
    }
  }

////////////// MY FIRST CODE RUNNING ///////////////////////
  ///
  // Future medicineRequest(String name, int quantity, String type) async {
  //   try {
  //     String uri =
  //         '$baseUrl/ngo/RequestMed?name=$name&quantity=$quantity&type=$type';
  //     var response = await http1.get(
  //       Uri.parse(uri),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //     );

  //     print(response.body);
  //     var data = jsonDecode(response.body);
  //     print(data[0]);
  //     print(data[1]);
  //     print(data[2]);
  //     print(data[2][0]);
  //     // print(data[3]);
  //     if (response.statusCode == 200 && data[1] == quantity) {
  //       print('Got $quantity pcs of $type 1st');
  //       addDonatedMedicineStock(data[0], data[1]);
  //       addMedicineStock(name, quantity, type, data[2][0]);
  //       Get.to(() => NGOOverview());
  //     } else if (response.statusCode == 200 && data[1] != quantity) {
  //       print('Got ${data[1]} pcs of $type');
  //       addDonatedMedicineStock(data[0], data[1]);
  //       addMedicineStock(name, data[1], type, data[2]);
  //       Get.to(() => NGOOverview());
  //     } else
  //       print('insertion failed');
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

//// check ////////
  // Future addDonatedMedicineStock(id, quantity) async {
  //   try {
  //     String uri = '${globals.baseUrl}/NGO/addDonatedMedicineStock';

  //     var response = await http1.post(
  //       Uri.parse(uri),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         "whStockId": id,
  //         "quantity": quantity,
  //       }),
  //     );

  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       print('inserted into Donated Medicine Stock');
  //     } else {
  //       print('insertion failed into Donated Medicine Stock');
  //       Get.to(() => NGOOverview());
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  Future addMedicineStock(name, quantity, type, expiryDate) async {
    try {
      String uri = '${globals.baseUrl}/NGO/addMedicineStock';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "medName": name,
          "quantity": quantity,
          "type": type,
          "expiry": expiryDate,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('inserted into ngo stock');
      } else {
        print('insertion failed into ngo stock');
        Get.to(() => NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future donateToHealthUnit(ngoId, medName, medType, stockId, huStockId,
      healthUnitId, donateQuantity, availQty) async {
    try {
      String uri = '${globals.baseUrl}/ngo/donateToHealthUnit';
      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "ngoid": ngoId.toString(),
          // "medName": medName.toString(),
          // "medType": medType.toString(),
          "Ngostockid": stockId.toString(),
          "HU_Stockid": huStockId.toString(),
          "healthUnitId": healthUnitId.toString(),
          "donateQuantity": donateQuantity.toString(),
          "AvailableQty": availQty.toString(),
        }),
      );
      print(response.body);
      var data = jsonDecode(response.body);
      print(data[0]);
      // print(data[1]);
      if (response.statusCode == 200) {
        if (data[0] == "1" || data[0] == 1 || data[0] == "1") {
          NgoApiCalling().confirmMedicine(huStockId);
        }
      } else {
        print('Donation failed to Health Unit');
        Get.to(() => NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
      Get.to(() => NGOOverview());
    }
  }

  Future addHealthUnit(email, password, name, address, type) async {
    try {
      String uri = '${globals.baseUrl}/ngo/addHealthUnit';
      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "NgoId": globals.id,
          "Email": email,
          "Password": password,
          "Name": name,
          "Address": address,
          "Type": type,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Added Health Unit');
        Get.to(() => NGOOverview());
      } else {
        print('Addition failed to Health Unit');
        Get.to(() => NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
      Get.to(() => NGOOverview());
    }
  }

  Future allDonatedMeds() async {
    try {
      String uri = '${globals.baseUrl}/ngo/allMedsDonated?id=${globals.id}';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<AllDonatedController>().allDonatedMeds(response);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future acceptMedRequest(
      healthunitstockid, medName, quantity, type, huid) async {
    try {
      String uri = '${globals.baseUrl}/ngo/acceptMedReq';
      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "NgoId": globals.id,
          "healthunitstockid": healthunitstockid,
          "medName": medName,
          "quantity": quantity,
          "Type": type,
          "Healthunitid": huid,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.to(() => NGOOverview());
      } else {
        print('Failed');
        Get.to(() => NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
      Get.to(() => NGOOverview());
    }
  }

  Future getMedicineRequests() async {
    try {
      String uri =
          '${globals.baseUrl}/ngo/allMedicineRequests?id=${globals.id}';

      var response = await http1.get(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Successfull');
        Get.find<MedicineRequestsController>().allMedicineRequests(response);
      } else {
        print('Failed');
        Get.to(NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future confirmMedicine(huStockid) async {
    try {
      String uri = '${globals.baseUrl}/ngo/confirmMed?hustock_id=$huStockid';

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
        Get.to(NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
