import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fyp_real/controller/donar_controller/member_api_calling.dart';
import 'package:fyp_real/controller/donar_controller/receipts_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';

import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/screens_donar/cash_donated.dart';
import 'package:fyp_real/screens_donar/check.dart';
import 'package:fyp_real/screens_donar/medicine_donated_donar.dart';
import 'package:fyp_real/screens_donar/member_funds_donation.dart';
import 'package:fyp_real/screens_donar/member_profile_edit.dart';
import 'package:fyp_real/widgets_member/member_home_feature.dart';
import 'package:fyp_real/widgets_member/member_medicine_request.dart';
import 'package:get/get.dart';
import '../controller/variables.dart' as globals;

class MemberOverview extends StatefulWidget {
  @override
  State<MemberOverview> createState() => _MemberOverviewState();
}

class _MemberOverviewState extends State<MemberOverview> {
  // var receipt;
  // late ReceiptsController receiptCtrl;
  @override
  void initState() {
    // receiptCtrl = Get.put(ReceiptsController());
    // Future <List> content;
    // content =
    var data = MemberApiCalling().getAlertReceipt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: CircleAvatar(
                radius: 10.0,
                //backgroundImage: ,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Profile_Image.jpg',
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(70.0),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              margin: EdgeInsets.only(right: 5, left: 5),
              child: Text(
                'ACCOUNT ID: ${globals.id}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  Get.to(() => MemberProfileEdit());
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                child: ListTile(
                  title: Text(
                    'Logout',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.red),
                  ),
                  onTap: () {
                    Get.to(() => AuthScreen());
                    // Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Donor Mode'),
        actions: [],
        centerTitle: true,
      ),
      body:
          // FutureBuilder(
          //   future: MemberApiCalling().getAlertReceipt(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     print(snapshot.data);
          //     if (snapshot.data != null) {
          //       // var convData = snapshot.data[0];
          //       // var phid = snapshot.data[0];
          //       return AlertDialog(
          //         title: Text("Confirmation!"),
          //         content: Text(
          //             'Pharmacy assistant "${snapshot.data[2]}" from "${snapshot.data[0]}"has generate you "${snapshot.data[3]}/-" receipt. Press "Confirm" button to issue.'),
          //         contentPadding: EdgeInsets.all(20),
          //         actions: [
          //           ElevatedButton(
          //               onPressed: () {
          //                 MemberApiCalling().confirmDonation(
          //                   snapshot.data[1],
          //                   snapshot.data[3],
          //                 );

          //                 Get.to(() => MemberOverview());
          //               },
          //               child: Text('Confirm'),
          //               style: ElevatedButton.styleFrom(primary: Colors.green)),
          //           ElevatedButton(
          //             onPressed: () {
          //               MemberApiCalling().rejectDonation();
          //             },
          //             child: Text('Reject'),
          //           ),
          //         ],
          //       );
          //     }

          //     return
          SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                children: [
                  Image.asset(
                    'assets/images/sample.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/sample2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/sample3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
                autoPlayInterval: 3000,
                isLoop: true,
              ),
              Expanded(
                child: GridView(
                  children: memberHomeFeature.map((overviewFunctions) {
                    return InkWell(
                      onTap: () {
                        if (overviewFunctions.id == 'a1') {
                          Get.to(() => MedicineDonatedDonar());
                        }
                        if (overviewFunctions.id == 'a2') {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MemberMedicineRequest();
                              });
                        }
                        if (overviewFunctions.id == 'a3') {
                          Get.to(() => MemberFundsDonation());
                        }
                        if (overviewFunctions.id == 'a4') {
                          Get.to(() => CashDonated());
                        }
                        // if (overviewFunctions.id == 'a5') {
                        //   Get.to(() => Check());
                        // }
                      },
                      child: MainFunctionsItem(
                        overviewFunctions.id,
                        overviewFunctions.title,
                        overviewFunctions.icon,
                      ),
                    );
                  }).toList(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
