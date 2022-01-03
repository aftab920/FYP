import 'dart:convert';

import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens_ngo/ngo_overview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http1;
import '../variables.dart' as globals;

class NgoApiCalling {
  String baseUrl = 'http://192.168.0.111/ApiDemo/api/';
  String baseUrlMedicine = 'http://192.168.0.111/ApiDemo/api/requested_med';

  Future RegisterNGO(name, email, password, regNo, address, type) async {
    try {
      String uri = '$baseUrl/userData/RegisterUser';

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
      String uri = '$baseUrl/NGO/AllHealthUnits';
      var response = (await http1.get(Uri.parse(uri)));

      if (response.statusCode == 200) {
        Get.find<AllHealthUnitsController>().allHealthUnits(response);
        //return allRequestsController.allRequests;
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
      String uri = '$baseUrl/NGO/AvailableMedicines';
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
      String uri = '$baseUrl/NGO/RequestMed';

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
        print('Got Med');
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

  Future addDonatedMedicineStock(id, quantity) async {
    try {
      String uri = '$baseUrl/NGO/addDonatedMedicineStock';

      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "whStockId": id,
          "quantity": quantity,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('inserted into Donated Medicine Stock');
      } else {
        print('insertion failed into Donated Medicine Stock');
        Get.to(() => NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future addMedicineStock(name, quantity, type, expiryDate) async {
    try {
      String uri = '$baseUrl/NGO/addMedicineStock';

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

  Future donateToHealthUnit(ngoId, medId, healthUnitId, quantity) async {
    try {
      String uri = '$baseUrl/ngo/donateToHealthUnit';
      var response = await http1.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          "ngoId": ngoId,
          "medId": medId,
          "healthUnitId": healthUnitId,
          "quantity": quantity,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Donated to Health Unit');
        Get.to(NGOOverview());
      } else {
        print('Donation failed to Health Unit');
        Get.to(() => NGOOverview());
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // Future findNgo() async {
  //   try {
  //     String uri = '$baseUrl/findngo?email=$email';

  //     var response = await http1.get(
  //       Uri.parse(uri),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8'
  //       },
  //     );
  //     print(response.statusCode);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       print('Signed In');
  //       Get.to(() => NGOOverview());
  //     } else
  //       print('Authentication failed');
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }
}
