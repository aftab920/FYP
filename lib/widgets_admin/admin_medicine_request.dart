import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/date_time_picker.dart';
import 'package:fyp_real/controller/dose_type.dart';
import 'package:get/get.dart';

final _titleController = TextEditingController();
final _quantityController = TextEditingController();

// ignore: must_be_immutable
class AdminMedicineRequest extends StatelessWidget {
  DateTimePicker dateController = Get.put(DateTimePicker());
  static final GlobalKey<FormState> _formKey = GlobalKey();
  final doseTypeController = Get.put(DoseType());

  @override

  //DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (!_formKey.currentState!.validate()) {
      print('Incomplete');
      return;
    } else
      print('Complete');
    AdminApiCalling().medicineRequest(
      _titleController.text,
      _quantityController.text,
      doseTypeController.dropdownValue.value,
    );
    Get.snackbar('Successful', 'Requested successfully!');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Medicine Name'),
                  controller: _titleController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return ('Please Enter Medicine Name:');
                    }
                    return null;
                  },

                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   enteredTitle = val;
                  // },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Enter Required Quantity'),
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return ('Please Enter Medicine Quantity:');
                    }
                    return null;
                  },

                  //onSubmitted: (_) => _submitData(),
                  //onChanged: (val) => amountInput = val,
                ),
                Obx(
                  () => DropdownButton(
                    hint: Text('${doseTypeController.dropdownValue}'),
                    items: doseTypeController.doseType.map((newVal) {
                      return DropdownMenuItem(
                        value: newVal,
                        child: Text(newVal),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(
                          "previous ${this.doseTypeController.dropdownValue}");
                      print("selected $value");
                      //this.doseType = value;

                      doseTypeController.setSelected(value);
                    },
                  ),
                ),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                  child: Text('Post Request'),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Theme.of(context).textTheme.button!.color,
                  //   //onPrimary: Theme.of(context).textTheme.bodyText1,
                  // ),

                  //onPressed: _submitData,
                  onPressed: _submitData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
