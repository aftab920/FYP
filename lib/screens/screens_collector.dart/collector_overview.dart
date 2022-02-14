import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:fyp_real/screens/auth_screen.dart';
import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/screens/screens_collector.dart/collected_medicines.dart';
import 'package:fyp_real/screens/screens_collector.dart/collector_profile_edit.dart';
import 'package:fyp_real/screens/screens_collector.dart/donation_requests.dart';
import 'package:fyp_real/screens/screens_collector.dart/pharmacy_donation_manage.dart';
import 'package:fyp_real/widgets/widgets_collector/add_medicine_form.dart';
import 'package:fyp_real/widgets/widgets_collector/collector_home_feature.dart';
import 'package:get/get.dart';
import '../../controller/variables.dart' as globals;

class CollectorOverview extends StatelessWidget {
  // void _addMedicine(BuildContext ctx, id) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: AddMedicineForm(id),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //   );
  // }

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
                  Get.to(() => CollectorProfileEdit());
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
                    //Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Collector Mode'),
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
                children: collectorHomeFeature.map((overviewFunctions) {
                  return InkWell(
                    onTap: () {
                      if (overviewFunctions.id == 'a1') {
                        Get.to(() => DonationRequests());
                      }
                      if (overviewFunctions.id == 'a2') {
                        Get.to(() => PharmacyDonationManage());
                      }
                      if (overviewFunctions.id == 'a3') {
                        Get.to(() => CollectedMedicines());
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: Icon(Icons.add),
      //   onPressed: () => showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return MemberMedicineRequest();
      //     },
      //   ),
      // ),
    );
  }
}
