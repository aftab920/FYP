import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:fyp_real/screens/main_functions_item.dart';
import 'package:fyp_real/widgets/ngo_medicine_request.dart';
import 'package:fyp_real/widgets/ngo_home_feature.dart';
import '../controller/admin_api_calling.dart';

class NGOOverview extends StatelessWidget {
  static const routeName = '/admin-overview';

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
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
                child: CircleAvatar(
                  maxRadius: 5.0,
                )),
            Card(
              child: ListTile(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  Navigator.pop(context);
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
                        //Get.to(page);
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
