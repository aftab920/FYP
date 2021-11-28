import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/screens_admin/all_users.dart';
import 'package:fyp_real/screens_admin/available_medicines.dart';
import 'package:fyp_real/screens_admin/donated_medicines.dart';
import 'package:fyp_real/screens_admin/medicine_requests.dart';
import 'package:fyp_real/screens_admin/profile_edit.dart';
import 'package:fyp_real/widgets_admin/admin_medicine_request.dart';
import 'package:get/get.dart';

import '../widgets_admin/admin_home_feature.dart';

class AdminOverview extends StatelessWidget {
  static const routeName = '/admin-overview';

  void _requestMedicine(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AdminMedicineRequest(),
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
                  Get.to(() => ProfileEdit());
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
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Admin Mode'),
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
              children: homeFeature.map((overviewFunctions) {
                return InkWell(
                  onTap: () {
                    if (overviewFunctions.id == 'a1') {
                      Get.to(() => AllUsers());
                    }
                    if (overviewFunctions.id == 'a2') {
                      Get.to(() => MedicineRequests());
                    }
                    if (overviewFunctions.id == 'a3') {
                      Get.to(() => AvailableMedicines());
                    }
                    if (overviewFunctions.id == 'a4') {
                      //      Get.to(() => Wishlist());
                    }
                    if (overviewFunctions.id == 'a5') {
                      Get.to(() => DonatedMedicines());
                    }
                    if (overviewFunctions.id == 'a4') {
                      //      Get.to(() => Wishlist());
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
        onPressed: () => _requestMedicine(context),
      ),
    );
  }
}
