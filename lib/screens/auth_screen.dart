import 'package:flutter/material.dart';
import 'package:fyp_real/controller/pharmacy_controller/pharmacy_api_calling.dart';

import 'package:fyp_real/http_service.dart';
import '../controller/donar_controller/member_api_calling.dart';
import '../controller/ngo_controller/ngo_api_calling.dart';
import '../controller/admin_controller/admin_api_calling.dart';

enum AuthMode { signin, signup }
enum AuthType {
  admin,
  ngo,
  member,
}

const String homeBoxName = 'home';

class AuthScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donations'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(215, 117, 255, 0).withAlpha(200),
                  const Color.fromRGBO(255, 188, 117, 1).withGreen(155),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                //stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: deviceSize.width,
              height: deviceSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    width: deviceSize.width * 0.2,
                    child: Image.asset('assets/images/abc.jpg'),
                  ),
                  Flexible(
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  AuthMode _authMode = AuthMode.signin;
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _ngoRegController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  late HttpService http;

  final Map<String, String> _authData = {
    'name': "",
    'email': "",
    'password': "",
    //'address': "",
    //'id': ""
  };
  String dropdownValue = 'Donor';
  final List _loginType = ['NGO', 'Donor', 'Pharmacy'];

  void submit() {
    if (!_formKey.currentState!.validate()) {
      print('1');
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.signin) {
      print(_authMode);

      AdminApiCalling()
          .LoginAdmin(_emailController.text, _passwordController.text);
    }
    if (_authMode == AuthMode.signup) {
      if (dropdownValue == 'Pharmacy') {
        PharmacyApiCalling().RegisterPharmacy(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _addressController.text,
          dropdownValue,
        );
      }

      if (dropdownValue == 'Donar') {
        MemberApiCalling().RegisterUser(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneController.text,
          _addressController.text,
          dropdownValue,
        );
      }

      if (dropdownValue == 'NGO') {
        NgoApiCalling().RegisterNGO(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _ngoRegController.text,
          _addressController.text,
          dropdownValue,
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  void toggleAuth() {
    if (_authMode == AuthMode.signin) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.signin;
      });
    }
  }

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      //shadowColor: Colors.blue,
      shadowColor: Colors.black,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),

        // side: BorderSide(width: 8),
      ),
      child: Container(
        height: _authMode == AuthMode.signin ? 285 : 340,
        width: deviceSize.width * 0.9,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_authMode == AuthMode.signup)
                  TextFormField(
                    decoration: const InputDecoration(label: Text('Name')),
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['name'] = value!;
                    },
                  ),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Email')),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty
                        // || value != null && !value.contains('@')
                        ) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(label: Text('Password')),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value != null && value.isEmpty
                        // ||    value != null && value.length < 5
                        ) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                if (_authMode == AuthMode.signup)
                  DropdownButton(
                    hint: const Text('Select User Type'),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    value: dropdownValue,
                    items: _loginType.map((newVal) {
                      return DropdownMenuItem(
                        value: newVal,
                        child: Text(newVal),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        dropdownValue = newVal.toString();
                      });
                    },
                  ),

                // if (_authMode == AuthMode.signup)
                //   TextFormField(
                //     enabled: _authMode == AuthMode.signup,
                //     decoration:
                //         InputDecoration(label: Text('Confirm Password')),
                //     obscureText: true,
                //     validator: _authMode == AuthMode.signup
                //         ? (value) {
                //             if (value != _passwordController.text) {
                //               return 'Passwords dont match';
                //             }
                //             return null;
                //           }
                //         : null,
                //   ),

                if (_authMode == AuthMode.signup && dropdownValue == 'NGO' ||
                    _authMode == AuthMode.signup &&
                        dropdownValue == 'Pharmacy' ||
                    _authMode == AuthMode.signup && dropdownValue == 'Donor')
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text('Enter Address')),
                    controller: _addressController,
                    validator: _authMode == AuthMode.signup
                        ? (value) {
                            if (value != null && value.isEmpty) {
                              return 'Please Enter Address';
                            }
                          }
                        : null,
                  ),
                if (_authMode == AuthMode.signup && dropdownValue == 'NGO')
                  TextFormField(
                    decoration:
                        const InputDecoration(label: Text('NGO Reg No.')),
                    controller: _ngoRegController,
                    validator: _authMode == AuthMode.signup
                        ? (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Reg Number';
                            }
                          }
                        : null,
                  ),
                if (_authMode == AuthMode.signup && dropdownValue == 'Donor' ||
                    _authMode == AuthMode.signup &&
                        dropdownValue == 'HealthCare')
                  Column(
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Phone No.')),
                        controller: _phoneController,
                        validator: _authMode == AuthMode.signup
                            ? (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Phone No.';
                                }
                              }
                            : null,
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: submit,
                        child: Text(
                          _authMode == AuthMode.signin ? 'LOGIN' : 'SIGN UP',
                        ),
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: toggleAuth,
                        child: Text(
                          _authMode == AuthMode.signin
                              ? 'SignUp Instead'
                              : 'SignIn Instead',
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
