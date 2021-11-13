import 'package:flutter/material.dart';
import 'package:fyp_real/controller/date_time_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

final _titleController = TextEditingController();
final _quantityController = TextEditingController();

// ignore: must_be_immutable
class AdminMedicineRequest extends StatelessWidget {
  DateTimePicker dateController = Get.put(DateTimePicker());
  static final GlobalKey<FormState> _formKey2 = GlobalKey();

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
            key: _formKey2,
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
                Container(
                  height: 70,
                ),
                ElevatedButton(
                    child: Text('Post Request'),
                    // style: ElevatedButton.styleFrom(
                    //   primary: Theme.of(context).textTheme.button!.color,
                    //   //onPrimary: Theme.of(context).textTheme.bodyText1,
                    // ),

                    //onPressed: _submitData,
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
                        Get.snackbar(
                            'Medicine Request', 'Data is in processing.');
                      } else
                        Get.snackbar('Medicine Request', 'Incomplete fields.');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
