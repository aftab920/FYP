import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/all_users_controller.dart';
import 'package:get/get.dart';

class BlockedUsers extends StatefulWidget {
  @override
  State<BlockedUsers> createState() => _BlockedUsersState();
}

class _BlockedUsersState extends State<BlockedUsers> {
  var users;

  late AllUsersController allUsersCtrl;

  @override
  void initState() {
    allUsersCtrl = Get.put(AllUsersController());
    AdminApiCalling().getBlockedUsers();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Users'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            users = allUsersCtrl.allUsers[index];

            return Card(
              color: Colors.yellow,
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
                trailing: ElevatedButton(
                  child: Text('Unblock'),
                  onPressed: () => AdminApiCalling().blockUnblockUser(users.id),
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
