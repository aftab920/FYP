// import 'package:flutter/material.dart';
// import 'package:fyp_real/controller/collector_controller/collector_api_calling.dart';
// import 'package:fyp_real/controller/date_time_picker.dart';
// import 'package:fyp_real/controller/dose_type.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../controller/variables.dart' as globals;

// final _titleController = TextEditingController();
// final _quantityController = TextEditingController();

// // ignore: must_be_immutable
// class AddMedicineForm extends StatefulWidget {
//   var dId;
//   late int collectorId;
//   AddMedicineForm(id) {
//     dId = id;
//     collectorId = globals.id;
//   }

//   @override
//   State<AddMedicineForm> createState() => _AddMedicineFormState();
// }

// class _AddMedicineFormState extends State<AddMedicineForm> {
//   DateTimePicker dateController = Get.put(DateTimePicker());
//   final doseTypeController = Get.put(DoseType());
//   DoseType inst = Get.find<DoseType>();
//   GlobalKey<FormState> _formKey = GlobalKey();

//   @override
//   void _submitData() {
//     if (!_formKey.currentState!.validate()) {
//       print('Incomplete');
//       return;
//     } else
//       print('Complete');
//     CollectorApiCalling().addMedicine(
//       _titleController.text,
//       _quantityController.text,
//       doseTypeController.dropdownValue.value,
//       dateController.selectedDate.toString(),
//       widget.collectorId,
//       widget.dId,
//     );
//     Get.snackbar('Successful', 'Requested successfully!');

//     // if (_quantityController.text.isEmpty) {
//     //   return;
//     // }
//     // final enteredTitle = _titleController.text;
//     // final enteredQuantity = double.parse(_quantityController.text);

//     // if (enteredTitle.isEmpty ||
//     //     enteredQuantity <= 0 ||
//     //     dateController.selectedDate == null) {
//     //   return;
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Card(
//         elevation: 5,
//         child: Container(
//           padding: EdgeInsets.only(
//             top: 10,
//             left: 10,
//             right: 10,
//             bottom: MediaQuery.of(context).viewInsets.bottom + 10,
//           ),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Enter Medicine Name'),
//                   controller: _titleController,
//                   validator: (val) {
//                     if (val != null && val.isEmpty) {
//                       return 'Medicine name is required';
//                     }
//                     return null;
//                   },
//                   //onSubmitted: (_) => _submitData(),
//                   // onChanged: (val) {
//                   //   enteredTitle = val;
//                   // },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Enter Quantity'),
//                   controller: _quantityController,
//                   keyboardType: TextInputType.number,
//                   validator: (val) {
//                     if (val != null && val.isEmpty) {
//                       return 'Quantity is required';
//                     }
//                     return null;
//                   },
//                   // onSubmitted: (_) => _submitData(),
//                   // onChanged: (val) => amountInput = val,
//                 ),
//                 // DropdownButton(
//                 //   hint: const Text('Select Dose Type'),
//                 //   icon: const Icon(Icons.keyboard_arrow_down),
//                 //   value: doseTypeController.dropdownValue,
//                 //   items: _doseType.map((newVal) {
//                 //     return DropdownMenuItem(
//                 //       value: newVal,
//                 //       child: Text(newVal),
//                 //     );
//                 //   }).toList(),
//                 //   onChanged: (newVal) {
//                 //     doseTypeController.setSelected(newVal.toString());
//                 //   },
//                 // ),

//                 Obx(
//                   () => DropdownButton(
//                     hint: Text('${doseTypeController.dropdownValue}'),
//                     items: doseTypeController.doseType.map((newVal) {
//                       return DropdownMenuItem(
//                         value: newVal,
//                         child: Text(newVal),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       print(
//                           "previous ${this.doseTypeController.dropdownValue}");
//                       print("selected $value");
//                       //this.doseType = value;

//                       doseTypeController.setSelected(value);
//                     },
//                   ),
//                 ),

//                 ///--------------------------///

//                 Container(
//                   height: 70,
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Obx(
//                           () => Text(
//                               '${DateTime.parse(dateController.selectedDate.toString())}'),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () =>
//                             dateController.presentDatePicker(context),
//                         child: Text(
//                           'Select Expiry Date',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   child: Text('Add Medicine'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.green,
//                     //onPrimary: Theme.of(context).textTheme.bodyText1,
//                   ),
//                   onPressed: _submitData,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
