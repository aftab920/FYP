import 'package:flutter/material.dart';
import 'package:fyp_real/http_service.dart';
import 'package:dio/dio.dart';
import 'package:fyp_real/model/single_user_response.dart';
import 'package:fyp_real/model/user.dart';
// import 'package:get/get.dart' hide Response;
// import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SingleUserScreen extends StatefulWidget {
  @override
  State<SingleUserScreen> createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  late HttpService http;
  late SingleUserResponse singleUserResponse;
  late User user;

  bool isLoading = false;

  @override
  void initState() {
    http = HttpService();
    getUser();
    super.initState();
  }

  Future getUser() async {
    Response response;
    try {
      //isLoading = true;
      response =
          await Dio().get('http://192.168.0.112/WebAPIDemo/api/users/allusers');
      //  isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          singleUserResponse = SingleUserResponse.fromJson(response.data);
          user = response.data;
        });
      } else {
        print('There is some problem status code not 200');
      }
    } on Exception catch (e) {
      //isLoading = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Single User get'),
        ),
        body: //isLoading
            // Center(
            //     child: CircularProgressIndicator(),
            //   )
            Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 16),
              Text('Hello ${user.email}'),
            ],
          ),
        )
        // : Center(
        //     child: Text('No user object'),
        //   ),
        );
  }
}
