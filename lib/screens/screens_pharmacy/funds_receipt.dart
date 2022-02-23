import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';
import '../../controller/variables.dart' as globals;

final _amountController = TextEditingController();
final _idController = TextEditingController();
final _nameController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey();

class FundsReceipt extends StatelessWidget {
  void submit() {
    if (!_formKey.currentState!.validate()) {
      print('1');
      return;
    }
    _formKey.currentState!.save();

    PharmacyApiCalling().generateReceipt(globals.id, _amountController.text,
        _idController.text, _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 120,
            right: 100,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Assistant Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                  },
                  controller: _nameController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Donor ID',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Donor ID.';
                    }
                  },
                  controller: _idController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Donation Amount',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Amount.';
                    }
                  },
                  controller: _amountController,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: Text('Generate Receipt'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    submit();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
