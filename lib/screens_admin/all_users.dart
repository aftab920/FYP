import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/all_users_controller.dart';
import 'package:fyp_real/screens_admin/filter_users.dart';
import 'package:get/get.dart';

class AllUsers extends StatefulWidget {
  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  var users;
  late AllUsersController allUsersCtrl;
  List<String> sortFilter = [
    'Users',
    'NGO',
    'Admin',
  ];

  void openDialog() {
    FilterUsers(sortFilter);
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('List'),
            actions: <Widget>[Text('OK'), Text('Cancel')],
            content: Container(
                width: 300, height: 400, child: FilterUsers(sortFilter)),
          );
        });
  }

  @override
  void initState() {
    allUsersCtrl = Get.put(AllUsersController());
    AdminApiCalling().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            users = allUsersCtrl.allUsers[index];

            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(users.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: ${users.email}'),
                    Text('Type: ${users.type}')
                  ],
                ),
              ),
            );
          },
          itemCount: allUsersCtrl.allUsers.length,
        ),
      ),
    );
  }
}
