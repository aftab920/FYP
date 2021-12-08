import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/screens/screens_pharmacy/medicine_donated_pharmacy.dart';
import 'package:fyp_real/screens/screens_pharmacy/pharmacy_profile_edit.dart';
import 'package:fyp_real/screens_admin/all_users.dart';
import 'package:fyp_real/screens_admin/medicine_requests.dart';
import 'package:fyp_real/screens_admin/profile_edit.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/medicine_financial_donation.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/pharmacy_home_feature.dart';
import 'package:fyp_real/widgets/widgets_pharmacy/pharmacy_medicine_request.dart';

import 'package:get/get.dart';

class PharmacyOverview extends StatelessWidget {
  void _requestMedicine(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: PharmacyMedicineRequest(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _medicineFinancialDonation(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: MedicineFinancialDonation(),
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
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Pharmacy Mode'),
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
                      _medicineFinancialDonation(context);
                    }
                    if (overviewFunctions.id == 'a2') {
                      _requestMedicine(context);
                    }
                    if (overviewFunctions.id == 'a3') {
                      Get.to(() => MedicineDonatedPharmacy());
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
