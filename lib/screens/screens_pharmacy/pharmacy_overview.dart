import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_cash_controller.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/screens/screens_pharmacy/collected_cash.dart';
import 'package:fyp_real/screens/screens_pharmacy/donation_requests_by_donor.dart';
import 'package:fyp_real/screens/screens_pharmacy/funds_receipt.dart';
import 'package:fyp_real/screens/screens_pharmacy/medicine_requests_by_admin.dart';
import 'package:fyp_real/screens/screens_pharmacy/pharmacy_donated.dart';
import 'package:fyp_real/screens/screens_pharmacy/pharmacy_profile_edit.dart';
import 'package:fyp_real/screens/screens_pharmacy/view_cash.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/pharmacy_home_feature.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/pharmacy_medicine_request.dart';

import 'package:get/get.dart';

class PharmacyOverview extends StatefulWidget {
  @override
  State<PharmacyOverview> createState() => _PharmacyOverviewState();
}

class _PharmacyOverviewState extends State<PharmacyOverview> {
  // late int availableCash;
  // late PharmacyCashController cashCtrl;

  void _donationReceiptDonor(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: FundsReceipt(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
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
            Card(
              child: ListTile(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  Get.to(() => PharmacyProfileEdit());
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
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Pharmacy Mode'),
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only(top: 15, right: 20),
        //     child: Text(
        //       '\$${availableCash = cashCtrl.cash.value}',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ImageSlideshow(
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
          ),
          Flexible(
            flex: 2,
            child: GridView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: pharmacyHomeFeature.map((overviewFunctions) {
                return InkWell(
                  onTap: () {
                    if (overviewFunctions.id == 'a1') {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PharmacyMedicineRequest();
                          });
                    }
                    if (overviewFunctions.id == 'a2') {
                      _donationReceiptDonor(context);
                    }
                    if (overviewFunctions.id == 'a3') {
                      Get.to(() => MedicineRequestsByAdmin());
                    }
                    if (overviewFunctions.id == 'a4') {
                      Get.to(() => PharmacyDonated());
                    }
                    if (overviewFunctions.id == 'a5') {
                      Get.to(() => ViewCash());
                    }
                    if (overviewFunctions.id == 'a6') {
                      Get.to(() => CollectedCash());
                    }
                  },
                  child: MainFunctionsItem(
                    overviewFunctions.id,
                    overviewFunctions.title,
                    overviewFunctions.icon,
                  ),
                );
              }).toList(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return PharmacyMedicineRequest();
          },
        ),
      ),
    );
  }
}
