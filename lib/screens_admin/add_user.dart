import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:get/get.dart';

final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

// ignore: must_be_immutable
class AddUser extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey();

  void _submitData() {
    if (!_formKey.currentState!.validate()) {
      print('Incomplete');
      return;
    } else
      print('Complete');
    AdminApiCalling().addCollector(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );
    Get.snackbar('Successful', 'Requested successfully!');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
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
                  decoration:
                      InputDecoration(labelText: 'Enter Collector Name'),
                  controller: _nameController,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Collector name is required';
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
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) => amountInput = val,
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Password'),
                  controller: _passwordController,
                  validator: (val) {
                    if (val != null && val.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  // onSubmitted: (_) => _submitData(),
                  // onChanged: (val) => amountInput = val,
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
                  child: Text('Post Request'),
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
