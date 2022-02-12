import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/variables.dart' as globals;

class DonateRequestedMed extends StatefulWidget {
  @override
  State<DonateRequestedMed> createState() => _DonateRequestedMedState();
}

class _DonateRequestedMedState extends State<DonateRequestedMed> {
  var availableMedicines;
  late NgoStockController ngoStockCtrl;
  bool value = false;
  final _quantityController = TextEditingController();
  final _streamController = StreamController<int>();
  Stream<int> get _stream => _streamController.stream;
  Sink<int> get _sink => _streamController.sink;
  int initValue = 1;
  var arg = Get.arguments;
  var healthunitId;
  var huStockId;

  DonateRequestedMedState() {
    this.healthunitId = healthunitId;
    this.huStockId = huStockId;
  }

  @override
  void initState() {
    healthunitId = arg[0];
    huStockId = arg[1];
    ngoStockCtrl = Get.put(NgoStockController());
    NgoApiCalling().getAvailableStock();
    //NgoApiCalling().getAllHealthUnits();
    _sink.add(initValue);
    _stream.listen((event) => _quantityController.text = event.toString());
    super.initState();
  }

  DateTime dateConversion(date) {
    return DateTime.parse(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Medicines'),
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
                            DateFormat("dd-MM-yyyy").format(DateTime.now()),
                          ),

                          Text(
                              'Expiry: ${date.day}-${date.month}-${date.year}'),
                        ],
                      ),

                      //    )})}
                      trailing: ElevatedButton(
                        child: Text('Donate'),
                        onPressed: () {
                          //DonateMed2(index);
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
                                            'Set quantity to donate:',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    _sink.add(--initValue);
                                                  },
                                                  child: Icon(Icons.remove)),
                                              Container(
                                                width: 35,
                                                child: TextField(
                                                  controller:
                                                      _quantityController,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    _sink.add(++initValue);
                                                  },
                                                  child: Icon(Icons.add)),
                                            ],
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              NgoApiCalling()
                                                  .donateToHealthUnit(
                                                globals.id,
                                                //ngoStockCtrl.availableMedicines[indexMed].id,
                                                ngoStockCtrl
                                                    .availableMedicines[
                                                        indexMed]
                                                    .name,
                                                ngoStockCtrl
                                                    .availableMedicines[
                                                        indexMed]
                                                    .type,
                                                ngoStockCtrl
                                                    .availableMedicines[
                                                        indexMed]
                                                    .id,

                                                huStockId,
                                                healthunitId,
                                                _quantityController.text,
                                                ngoStockCtrl
                                                    .availableMedicines[
                                                        indexMed]
                                                    .quantity,
                                              );
                                            },
                                            child: Text('Donate'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  );
                },
                itemCount: ngoStockCtrl.availableMedicines.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
