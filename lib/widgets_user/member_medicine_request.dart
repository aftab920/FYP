import 'package:flutter/material.dart';
import 'package:fyp_real/controller/date_time_picker.dart';
import 'package:fyp_real/controller/dose_type.dart';
import 'package:get/get.dart';

final _titleController = TextEditingController();
final _quantityController = TextEditingController();

// ignore: must_be_immutable
class MemberMedicineRequest extends StatelessWidget {
  DateTimePicker dateController = Get.put(DateTimePicker());

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Enter Medicine Name'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   enteredTitle = val;
                // },
              ),

              TextField(
                decoration:
                    InputDecoration(labelText: 'Enter Required Quantity'),
                controller: _quantityController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                //onChanged: (val) => amountInput = val,
              ),

              // DropdownButton(
              //   hint: const Text('Donation Type'),
              //   icon: const Icon(Icons.keyboard_arrow_down),
              //    value: doseTypeController.dropdownValue,
              //   items: _donationType.map((newVal) {
              //     return DropdownMenuItem(
              //       value: newVal,
              //       child: Text(newVal),
              //     );
              //   }).toList(),
              //   onChanged: (newVal) {
              //     doseTypeController.setSelected(newVal.toString());
              //   },
              // ),

              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Obx(
                        () => Text(
                            'Expiry Date: ${DateTime.parse(dateController.selectedDate.toString())}'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          dateController.presentDatePicker(context),
                      child: Text(
                        'Select Expiry Date',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Post Request'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).textTheme.button!.color,
                  //onPrimary: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
