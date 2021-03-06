import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/donar_controller/member_api_calling.dart';
import 'package:fyp_real/controller/donar_controller/receipts_controller.dart';
import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';
import 'package:fyp_real/screens_donar/member_overview.dart';

import 'package:fyp_real/screens_ngo/health_unit.dart';
import 'package:get/get.dart';
import '../controller/variables.dart' as globals;
import 'package:number_inc_dec/number_inc_dec.dart';

class MemberFundsDonation extends StatefulWidget {
  @override
  State<MemberFundsDonation> createState() => _MemberFundsDonationState();
}

class _MemberFundsDonationState extends State<MemberFundsDonation> {
  var receipt;
  late ReceiptsController receiptCtrl;

  // final _quantityController = TextEditingController();
  // final _streamController = StreamController<int>();
  // Stream<int> get _stream => _streamController.stream;
  // Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    receiptCtrl = Get.put(ReceiptsController());
    MemberApiCalling().getReceipt();
    // _sink.add(initValue);
    // _stream.listen((event) => _quantityController.text = event.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation Receipts'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, indexMed) {
                  receipt = receiptCtrl.receipts[indexMed];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.local_pharmacy),
                      title: Text(receipt.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Text('Amount: ${(receipt.amount)}'),
                          Text('Assistant Name: ${(receipt.assisName)}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            child: Text('???'),
                            onPressed: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return Dialog(
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(20.0),
                              //       ), //this right here
                              //       child: Container(
                              //         height: 150,
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(12.0),
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               Text(
                              //                 'Set Amount to donate:',
                              //                 style: TextStyle(fontSize: 17),
                              //               ),
                              //               Row(
                              //                 crossAxisAlignment:
                              //                     CrossAxisAlignment.center,
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.center,
                              //                 children: [
                              //                   // TextButton(
                              //                   //     onPressed: () {
                              //                   //       _sink.add(--initValue);
                              //                   //     },
                              //                   //     child: Icon(Icons.remove)),
                              //                   Container(
                              //                     width: 100,
                              //                     child: TextField(
                              //                       controller:
                              //                           _quantityController,
                              //                     ),
                              //                   ),
                              //                   // TextButton(
                              //                   //     onPressed: () {
                              //                   //       _sink.add(++initValue);
                              //                   //     },
                              //                   //     child: Icon(Icons.add)),
                              //                 ],
                              //               ),
                              //               ElevatedButton(
                              //                 onPressed: () {
                              //                   MemberApiCalling().donateFunds(
                              //                       globals.id,
                              //                       receiptCtrl
                              //                           .pharmacies[indexMed].id,
                              //                       _quantityController.text);
                              //                   Navigator.pop(context);
                              //                 },
                              //                 child: Text('Donate'),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // );
                              MemberApiCalling().confirmDonation(
                                receiptCtrl.receipts[indexMed].id,
                                receiptCtrl.receipts[indexMed].amount,
                              );
                              Get.to(() => MemberOverview());
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                MemberApiCalling().rejectDonation();
                                Get.to(() => MemberOverview());
                              },
                              child: Text('???'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red)),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: receiptCtrl.receipts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
