import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_stock_controller.dart';
import 'package:fyp_real/screens_ngo/health_unit.dart';
import 'package:get/get.dart';
import 'controller/variables.dart' as globals;
import 'package:number_inc_dec/number_inc_dec.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var med;
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
    healthUnitCtrl = Get.put(AllHealthUnitsController());
    NgoApiCalling().getAllHealthUnits();
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
        title: Text('Available Stock'),
      ),
      body: Column(children: [
        Obx(
          () => Expanded(
            child: ListView.builder(
              itemCount: ngoStockCtrl.availableMedicines.length,
              itemBuilder: (BuildContext context, int index) {
                med = ngoStockCtrl.availableMedicines[index];

                return Card(
                  elevation: 5,
                  child: ListTile(
                      onTap: () =>
                          print(ngoStockCtrl.availableMedicines[index].id),
                      title: Text(med.name),
                      subtitle: Column(
                        children: [
                          Text(med.type),
                          Text(med.expiryDate),
                        ],
                      )),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
