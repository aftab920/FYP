import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/collected_cash_controller.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import 'package:get/get.dart';

class CollectedCash extends StatefulWidget {
  @override
  State<CollectedCash> createState() => _CollectedCashState();
}

class _CollectedCashState extends State<CollectedCash> {
  var collection;
  late CollectedCashController collectionCtrl;

  @override
  void initState() {
    collectionCtrl = Get.put(CollectedCashController());
    PharmacyApiCalling().collectedCash();
    // _sink.add(initValue);
    // _stream.listen((event) => _quantityController.text = event.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines Donated'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  collection = collectionCtrl.collections[index];
                  if (collection != null) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(collection.donName),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // SizedBox(
                            //   height: 15,
                            // ),

                            Text('Received Amount: ${collection.amount}'),

                            Text('Assistant Name: ${collection.assisName}')
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('No Data Found');
                  }
                },
                itemCount: collectionCtrl.collections.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
