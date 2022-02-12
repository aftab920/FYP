import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';

import 'package:get/get.dart';
import '../controller/variables.dart' as globals;

class ViewStock extends StatefulWidget {
  @override
  State<ViewStock> createState() => _ViewStockState();
}

class _ViewStockState extends State<ViewStock> {
  var availableMedicines;
  late NgoStockController ngoStockCtrl;
  var healthUnits;
  late AllHealthUnitsController healthUnitCtrl;
  bool value = false;
  final _quantityController = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;

  @override
  void initState() {
    ngoStockCtrl = Get.put(NgoStockController());
    NgoApiCalling().getAvailableStock();
    // healthUnitCtrl = Get.put(AllHealthUnitsController());
    // NgoApiCalling().getAllHealthUnits();
    // _sink.add(initValue);
    // _stream.listen((event) => _quantityController.text = event.toString());
    super.initState();
  }

  DateTime dateConversion(date) {
    return DateTime.parse(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Stock'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, indexMed) {
                  availableMedicines =
                      ngoStockCtrl.availableMedicines[indexMed];
                  var date = dateConversion(availableMedicines.expiryDate);
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.medication_sharp),
                      title: Text(availableMedicines.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Text('Quantity: ${availableMedicines.quantity}'),

                          Text(
                              'Expiry: ${date.day}-${date.month}-${date.year}'),
                        ],
                      ),
                      // trailing: ElevatedButton(
                      //   child: Text('Donate To'),
                      //   onPressed: () {
                      //     //DonateMed2(index);
                      //     showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) {
                      //           return Dialog(
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(20.0),
                      //             ), //this right here
                      //             child: Container(
                      //               height: 500,
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(12.0),
                      //                 child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       'Choose Health Unit to donate medicine to:',
                      //                       style: TextStyle(
                      //                         fontSize: 20,
                      //                       ),
                      //                       textAlign: TextAlign.center,
                      //                     ),
                      //                     Expanded(
                      //                       child: ListView.builder(
                      //                         shrinkWrap: true,
                      //                         itemBuilder:
                      //                             (context, indexHospital) {
                      //                           healthUnits = healthUnitCtrl
                      //                               .healthUnits[indexHospital];

                      //                           return GestureDetector(
                      //                             onTap: () {
                      //                               showDialog(
                      //                                   context: context,
                      //                                   builder: (BuildContext
                      //                                       context) {
                      //                                     return Dialog(
                      //                                       shape:
                      //                                           RoundedRectangleBorder(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(
                      //                                                     20.0),
                      //                                       ), //this right here
                      //                                       child: Container(
                      //                                         height: 150,
                      //                                         child: Padding(
                      //                                           padding:
                      //                                               const EdgeInsets
                      //                                                       .all(
                      //                                                   12.0),
                      //                                           child: Column(
                      //                                             mainAxisAlignment:
                      //                                                 MainAxisAlignment
                      //                                                     .center,
                      //                                             crossAxisAlignment:
                      //                                                 CrossAxisAlignment
                      //                                                     .center,
                      //                                             children: [
                      //                                               Text(
                      //                                                 'Set quantity to donate:',
                      //                                                 style: TextStyle(
                      //                                                     fontSize:
                      //                                                         17),
                      //                                               ),
                      //                                               Row(
                      //                                                 crossAxisAlignment:
                      //                                                     CrossAxisAlignment
                      //                                                         .center,
                      //                                                 mainAxisAlignment:
                      //                                                     MainAxisAlignment
                      //                                                         .center,
                      //                                                 children: [
                      //                                                   TextButton(
                      //                                                       onPressed:
                      //                                                           () {
                      //                                                         _sink.add(--initValue);
                      //                                                       },
                      //                                                       child:
                      //                                                           Icon(Icons.remove)),
                      //                                                   Container(
                      //                                                     width:
                      //                                                         35,
                      //                                                     child:
                      //                                                         TextField(
                      //                                                       controller:
                      //                                                           _quantityController,
                      //                                                     ),
                      //                                                   ),
                      //                                                   TextButton(
                      //                                                       onPressed:
                      //                                                           () {
                      //                                                         _sink.add(++initValue);
                      //                                                       },
                      //                                                       child:
                      //                                                           Icon(Icons.add)),
                      //                                                 ],
                      //                                               ),
                      //                                               ElevatedButton(
                      //                                                 onPressed:
                      //                                                     () {
                      //                                                   NgoApiCalling().donateToHealthUnit(
                      //                                                       globals.id,
                      //                                                       //ngoStockCtrl.availableMedicines[indexMed].id,
                      //                                                       ngoStockCtrl.availableMedicines[indexMed].name,
                      //                                                       ngoStockCtrl.availableMedicines[indexMed].quantity,
                      //                                                       ngoStockCtrl.availableMedicines[indexMed].type,
                      //                                                       ngoStockCtrl.availableMedicines[indexMed].expiryDate,
                      //                                                       healthUnitCtrl.healthUnits[indexHospital].id,
                      //                                                       _quantityController.text);
                      //                                                 },
                      //                                                 child: Text(
                      //                                                     'Donate'),
                      //                                               )
                      //                                             ],
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     );
                      //                                   });
                      //                             },
                      //                             child: Card(
                      //                               elevation: 5,
                      //                               child: ListTile(
                      //                                 title: Text(
                      //                                     healthUnits.name),
                      //                                 subtitle: Column(
                      //                                   crossAxisAlignment:
                      //                                       CrossAxisAlignment
                      //                                           .end,
                      //                                   children: [
                      //                                     // SizedBox(
                      //                                     //   height: 15,
                      //                                     // ),
                      //                                     Text(
                      //                                         'Address: ${healthUnits.address}'),
                      //                                     Text(
                      //                                         'Date: ${healthUnits.type}'),
                      //                                   ],
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           );
                      //                         },
                      //                         itemCount: healthUnitCtrl
                      //                             .healthUnits.length,
                      //                       ),
                      //                     ),
                      //                     SizedBox(
                      //                       width: 320.0,
                      //                       child: ElevatedButton(
                      //                         onPressed: () {},
                      //                         child: Text(
                      //                           "Save",
                      //                           style: TextStyle(
                      //                               color: Colors.white),
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           );
                      //         });
                      //   },
                      // ),
                    ),
                  );
                },
                itemCount: ngoStockCtrl.availableMedicines.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
