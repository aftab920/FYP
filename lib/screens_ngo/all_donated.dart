import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/all_donated_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:get/get.dart';

class AllDonated extends StatefulWidget {
  @override
  State<AllDonated> createState() => _AllDonatedState();
}

class _AllDonatedState extends State<AllDonated> {
  var meds;

  late AllDonatedController medsCtrl;

  @override
  void initState() {
    medsCtrl = Get.put(AllDonatedController());
    NgoApiCalling().allDonatedMeds();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Donated'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  meds = medsCtrl.donatedMeds[index];
                  if (meds != null) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(meds.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // SizedBox(
                            //   height: 15,
                            // ),
                            Text('Health Unit Name: ${meds.HUname}'),
                            Text('Address: ${meds.address}'),
                            Text('Donated quantity: ${meds.quantity}'),
                            Text('Type: ${meds.type}'),
                            Text('Expiry: ${DateTime.parse(meds.expiry)}')
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('No Data Found');
                  }
                },
                itemCount: medsCtrl.donatedMeds.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
