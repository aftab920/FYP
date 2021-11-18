import 'package:flutter/material.dart';

import 'package:fyp_real/controller/admin_api_calling.dart';
import 'package:fyp_real/controller/medicine_requests_controller.dart';
import 'package:get/get.dart';

class MedicineRequests extends StatefulWidget {
  @override
  State<MedicineRequests> createState() => _MedicineRequestsState();
}

class _MedicineRequestsState extends State<MedicineRequests> {
  // late List allRequests;
  var medReq;
  late MedicineRequestsController allReqCtrl;
  // = Get.find<MedicineRequestsController>();
  @override
  void initState() {
    //allRequests =
    allReqCtrl = Get.put(MedicineRequestsController());
    AdminApiCalling().getMedicineRequests();

    // Get.put(MedicineRequestsController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Requests 2'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            medReq = allReqCtrl.allRequests[index];

            return Card(
              elevation: 5,
              child: ListTile(
                  title: Text(medReq.name),
                  subtitle: Column(
                    children: [
                      Text('Quantity: ${medReq.quantity.toString()}'),
                      Text('Requested By: ${medReq.requestedBy}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('✔'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                      ElevatedButton(
                        child: Text('✖'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ],
                  )
                  // trailing: Text(int.parse(medReq.id)),
                  ),
            );
          },
          itemCount: allReqCtrl.allRequests.length,
        ),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:fyp_real/model/list_user_response.dart';
// import 'package:fyp_real/model/user.dart';
// import '../http_service.dart';
// import 'package:http/http.dart' as http1;

// class ListUserScreen extends StatefulWidget {
//   @override
//   _ListUserScreenState createState() => _ListUserScreenState();
// }

// class _ListUserScreenState extends State<ListUserScreen> {
//   late HttpService http;
//   List users = [];
//   late ListUserResponse listUserResponse;

//   bool isLoading = false;

//   @override
//   void initState() {
//     http = HttpService();
//     getListUser();
//     super.initState();
//   }

//   Future getListUser() async {
//     // Response response;
//     try {
//       // response = await Dio()
//       //     .get('http://192.168.170.35/WebAPIDemo/api/users/allusers');
//       String uri = 'http://192.168.0.113/ApiDemo/api/admins/alladmins';
//       var response = (await http1.get(Uri.parse(uri)));

//       if (response.statusCode == 200) {
//         setState(() {
//           print(response.body);
//           print(response.statusCode);
//           // var job = '{"Name":"Ali","Email":"abc","Password":"Pass","Id":1}';
//           // jsonDecode(job);
//           Iterable it = jsonDecode(response.body);
//           users = it.map((e) => User.fromMap(e)).toList();
//           //int x = -90;
//           // listUserResponse = ListUserResponse.fromJson(response.data);
//           // users = listUserResponse.user;
//         });
//       } else {
//         print('There is some problem status code not 200');
//       }
//     } on Exception catch (e) {
//       print(e);
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Single User get'),
//       ),
//       body: Center(
//           child: ListView.builder(
//         itemBuilder: (context, index) {
//           final user = users[index];
//           return Card(
//             child: ListTile(
//               title: Text(user.password),
//               leading: Image.network('https://via.placeholder.com/150'),
//               subtitle: Text(user.email),
//               trailing: ElevatedButton(
//                 child: Text('Get'),
//                 onPressed: () {},
//               ),
//             ),
//           );
//         },
//         itemCount: users.length,
//       )),
//     );
//   }
// }
