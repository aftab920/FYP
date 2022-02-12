import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/health_unit_type_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final _titleController = TextEditingController();
final _addressController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

// ignore: must_be_immutable
class AddHealthUnit extends StatelessWidget {
  final healthUnitTypeController = Get.put(HealthUnitTypeContoller());
  HealthUnitTypeContoller inst = Get.find<HealthUnitTypeContoller>();

  GlobalKey<FormState> _formKey = GlobalKey();

  void _submitData() {
    if (!_formKey.currentState!.validate()) {
      print('Incomplete');
      return;
    } else
      print('Complete');
    NgoApiCalling().addHealthUnit(
      _emailController.text,
      _passwordController.text,
      _titleController.text,
      _addressController.text,
      healthUnitTypeController.dropdownValue.value,
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
                  decoration: InputDecoration(labelText: 'Enter Name'),
                  controller: _titleController,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Name is required!';
                    }
                    return null;
                  },
                  //onSubmitted: (_) => _submitData(),
                  // onChanged: (val) {
                  //   enteredTitle = val;
                  // },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Email'),
                  controller: _emailController,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Password'),
                  controller: _passwordController,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Health Unit Address'),
                  controller: _addressController,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) => amountInput = val,
                ),
                Obx(
                  () => DropdownButton(
                    hint: Text('${healthUnitTypeController.dropdownValue}'),
                    items:
                        healthUnitTypeController.healthUnitType.map((newVal) {
                      return DropdownMenuItem(
                        value: newVal,
                        child: Text(newVal),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(
                          "previous ${this.healthUnitTypeController.dropdownValue}");
                      print("selected $value");
                      //this.doseType = value;

                      healthUnitTypeController.setSelected(value);
                    },
                  ),
                ),

                ///--------------------------///

                // Container(
                //   height: 70,
                //   child: Row(
                //     children: <Widget>[
                //       Expanded(
                //         child: Obx(
                //           () => Text(
                //               '${DateTime.parse(dateController.selectedDate.toString())}'),
                //         ),
                //       ),
                //       ElevatedButton(
                //         onPressed: () =>
                //             dateController.presentDatePicker(context),
                //         child: Text(
                //           'Choose Date',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ElevatedButton(
                  child: Text('Add Now'),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Theme.of(context).textTheme.button!.color,
                  //   //onPrimary: Theme.of(context).textTheme.bodyText1,
                  // ),
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
