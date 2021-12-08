import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_real/screens/screens_pharmacy/pharmacy_overview.dart';
import 'package:fyp_real/screens_admin/all_users.dart';
import 'package:fyp_real/screens_admin/blocked_users.dart';
import 'package:fyp_real/screens_admin/profile_edit.dart';
import 'package:fyp_real/screens_admin/wishlist.dart';
import 'package:fyp_real/screens_ngo/ngo_overview.dart';
import 'package:fyp_real/screens_ngo/ngo_profile_edit.dart';
import 'package:fyp_real/screens_donar/member_overview.dart';
import './screens_admin/medicine_requests.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:fyp_real/screens_admin/admin_overview.dart';
import 'package:fyp_real/screens/auth_screen.dart';

const String homeBoxName = 'home';

void main() {
  runApp(MyApp());
}

@override
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                subtitle1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
                //button: TextStyle(color: Colors.black),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      //home: AdminOverview(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => AuthScreen(),
        AdminOverview.routeName: (context) => AdminOverview(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => AuthScreen(),
        );
      },
      debugShowCheckedModeBanner: true,
    );
  }
}
