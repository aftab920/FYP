import 'package:flutter/material.dart';
import 'package:fyp_real/controller/date_time_picker.dart';
import 'package:fyp_real/controller/donar_controller/dose_type_donar.dart';
import 'package:fyp_real/controller/donar_controller/member_api_calling.dart';
import '../controller/variables.dart' as globals;
import 'package:get/get.dart';

final _titleController = TextEditingController();
final _quantityController = TextEditingController();

// ignore: must_be_immutable
class MemberMedicineRequest extends StatelessWidget {
  DateTimePicker dateController = Get.put(DateTimePicker());

  final doseTypeController = Get.put(DoseTypeDonar());
  DoseTypeDonar inst = Get.find<DoseTypeDonar>();

  // final List _donationType = [
  //   'Individual',
  //   'Pharmacy',
  //   'NGO',
  // ];

  @override

  //DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_quantityController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredQuantity = double.parse(_quantityController.text);

    if (enteredTitle.isEmpty ||
        enteredQuantity <= 0 ||
        dateController.selectedDate == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), //this right here
      child: Container(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Upon clicking Donate Now, a collecting agent will reach out to your address within few hours. Are you sure you want to donate now?',
                style: TextStyle(fontSize: 17),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  onPressed: () {
                    MemberApiCalling().DonateMed(
                      globals.id,
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Donate Now'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
                                                                
    
    

    
    // SingleChildScrollView(
    //   child: Card(
    //     elevation: 5,
    //     child: Container(
    //       padding: EdgeInsets.only(
    //         top: 10,
    //         left: 10,
    //         right: 10,
    //         bottom: MediaQuery.of(context).viewInsets.bottom + 10,
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: <Widget>[
    //           TextField(
    //             decoration: InputDecoration(labelText: 'Enter Medicine Name'),
    //             controller: _titleController,
    //             onSubmitted: (_) => _submitData(),
    //             // onChanged: (val) {
    //             //   enteredTitle = val;
    //             // },
    //           ),
    //           TextField(
    //             decoration: InputDecoration(labelText: 'Enter Quantity'),
    //             controller: _quantityController,
    //             keyboardType: TextInputType.number,
    //             onSubmitted: (_) => _submitData(),
    //             //onChanged: (val) => amountInput = val,
    //           ),
    //           TextField(
    //             decoration: InputDecoration(labelText: 'Pickup Address'),
    //             controller: _quantityController,
    //             keyboardType: TextInputType.number,
    //             onSubmitted: (_) => _submitData(),
    //             //onChanged: (val) => amountInput = val,
    //           ),
    //           Obx(
    //             () => DropdownButton(
    //               hint: Text('${doseTypeController.dropdownValue}'),
    //               items: doseTypeController.doseType.map((newVal) {
    //                 return DropdownMenuItem(
    //                   value: newVal,
    //                   child: Text(newVal),
    //                 );
    //               }).toList(),
    //               onChanged: (value) {
    //                 print("previous ${this.doseTypeController.dropdownValue}");
    //                 print("selected $value");
    //                 //this.doseType = value;

    //                 doseTypeController.setSelected(value);
    //               },
    //             ),
    //           ),
    //           Container(
    //             height: 70,
    //             child: Row(
    //               children: <Widget>[
    //                 Expanded(
    //                   child: Obx(
    //                     () => Text(
    //                         'Expiry Date: ${DateTime.parse(dateController.selectedDate.toString())}'),
    //                   ),
    //                 ),
    //                 ElevatedButton(
    //                   onPressed: () =>
    //                       dateController.presentDatePicker(context),
    //                   child: Text(
    //                     'Select Expiry Date',
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           ElevatedButton(
    //             child: Text('Donate'),
    //             style: ElevatedButton.styleFrom(
    //               primary: Colors.green,

    //               //onPrimary: Theme.of(context).textTheme.bodyText1,
    //             ),
    //             onPressed: _submitData,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
