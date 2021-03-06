import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fyp_real/screens/auth_screen.dart';

import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/screens_admin/donated_medicines.dart';
import 'package:fyp_real/screens_ngo/all_donated.dart';
import 'package:fyp_real/screens_ngo/view_stock.dart';
import 'package:fyp_real/screens_ngo/health_unit.dart';
import 'package:fyp_real/screens_ngo/medicine_requests.dart';
import 'package:fyp_real/screens_ngo/ngo_profile_edit.dart';
import 'package:fyp_real/widgets_ngo/ngo_medicine_request.dart';
import 'package:fyp_real/widgets_ngo/ngo_home_feature.dart';

import 'package:get/get.dart';

class NGOOverview extends StatelessWidget {
  static const routeName = '/ngo-overview';

  // void _addNewTransaction(
  //     String txTitle, double txAmount, DateTime chosenDate) {
  //   final newTx = Transaction(
  //     title: txTitle,
  //     amount: txAmount,
  //     date: chosenDate,
  //     id: DateTime.now().toString(),
  //   );

  //   setState(() {
  //     _userTransactions.add(newTx);
  //   });
  // }

  void _requestMedicine(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NgoMedicineRequest(),
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
                  Get.to(() => NGOProfileEdit());
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
        title: const Text('NGO Mode'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(children: [
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
                children: ngoHomeFeature.map((overviewFunctions) {
                  return InkWell(
                    onTap: () {
                      if (overviewFunctions.id == 'a1') {
                        _requestMedicine(context);
                      }
                      if (overviewFunctions.id == 'a2') {
                        Get.to(() => ViewStock());
                      }
                      if (overviewFunctions.id == 'a3') {
                        Get.to(() => HealthUnit());
                      }
                      if (overviewFunctions.id == 'a4') {
                        Get.to(() => MedicineRequests());
                      }
                      if (overviewFunctions.id == 'a5') {
                        Get.to(() => AllDonated());
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
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _requestMedicine(context),
      ),
    );
  }
}
