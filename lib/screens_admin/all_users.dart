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
  bool value = false;
  var allUsers;
  List<String> sortFilter = [
    'Users',
    'NGO',
    'Admin',
  ];

  //late AllUsersController allUsersCtrl;

  @override
  // void initState() {
  //   allUsersCtrl = Get.put(AllUsersController());
  //   AdminApiCalling().getAllUsers();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body:
          //Obx( () =>

          //  ListView.builder(
          //   itemBuilder: (context, index) {
          //     allUsers = allUsersCtrl.allUsers[index];

          //     return Card(
          //       elevation: 5,
          //       child: ListTile(
          //         title: Text(allUsers.name),
          //         subtitle: Column(
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           children: [
          //             // SizedBox(
          //             //   height: 15,
          //             // ),
          //             Text('Email: ${allUsers.email}'),
          //             Text('Phone: ${allUsers.phone}'),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          //   itemCount: allUsersCtrl.allUsers.length,
          // ),

          Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50, right: 20),
                child: Text(
                  "Sort Data",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  openDialog();
                },
                child: Icon(
                  Icons.filter_alt_rounded,
                ),
              ),
            ],
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              title: Text('De-Watson'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@dewatson.com'),
                  Text('Phone: 0302690'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              title: Text('Edhi'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: info@edhi.com'),
                  Text('Phone: 0302661'),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Checkbox(
                value: this.value,
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                  });
                },
              ),
              title: Text('Ahmad'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text('Email: ahmad@gmail.com'),
                  Text('Phone: 0302600009'),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Block user',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

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
}
