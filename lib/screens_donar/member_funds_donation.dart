import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/donar_controller/member_api_calling.dart';
import 'package:fyp_real/controller/donar_controller/pharmacy_controller.dart';
import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';
import 'package:fyp_real/screens_ngo/donate_med_2.dart';
import 'package:fyp_real/screens_ngo/health_unit.dart';
import 'package:get/get.dart';
import '../controller/variables.dart' as globals;
import 'package:number_inc_dec/number_inc_dec.dart';

class MemberFundsDonation extends StatefulWidget {
  @override
  State<MemberFundsDonation> createState() => _MemberFundsDonationState();
}

class _MemberFundsDonationState extends State<MemberFundsDonation> {
  var pharmacy;
  late PharmacyController pharmacyCtrl;
  bool value = false;
  final _quantityController = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    pharmacyCtrl = Get.put(PharmacyController());
    MemberApiCalling().getAllPharmacies();
    _sink.add(initValue);
    _stream.listen((event) => _quantityController.text = event.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacies'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, indexMed) {
                  pharmacy = pharmacyCtrl.pharmacies[indexMed];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.medication_sharp),
                      title: Text(pharmacy.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Text('Address: ${(pharmacy.address)}'),
                        ],
                      ),
                      trailing: ElevatedButton(
                          child: Text('Donate'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ), //this right here
                                  child: Container(
                                    height: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Set Amount to donate:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // TextButton(
                                              //     onPressed: () {
                                              //       _sink.add(--initValue);
                                              //     },
                                              //     child: Icon(Icons.remove)),
                                              Container(
                                                width: 100,
                                                child: TextField(
                                                  controller:
                                                      _quantityController,
                                                ),
                                              ),
                                              // TextButton(
                                              //     onPressed: () {
                                              //       _sink.add(++initValue);
                                              //     },
                                              //     child: Icon(Icons.add)),
                                            ],
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              MemberApiCalling().donateFunds(
                                                  globals.id,
                                                  pharmacy.id,
                                                  _quantityController.text);
                                            },
                                            child: Text('Donate'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  );
                },
                itemCount: pharmacyCtrl.pharmacies.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
