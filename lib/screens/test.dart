import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fyp_real/screens/list_user_screen.dart';
// import 'package:http/http.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Map<String, dynamic> data;
  void getData() async {
    Response response;
    response =
        await Dio().get('http://192.168.0.112/WebAPIDemo/api/NGOes/allngo');
    // setState(() {
    //   data = new Map<String, dynamic>.from(json.decode(response.data));
    // });

    print(response.data);
    // return data;
  }

  Future postData() async {
    try {
      String uri = 'http://192.168.0.113/WebAPIDemo/api/users/RegisterUser';

      var response = await http.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
            <String, String>{"name": "Khbkhba", "email": "khbkhba@gmail.com"}),
      );

      print(response.body);
      if (response.statusCode == 200)
        print('inserted');
      else
        print('insertion failed');
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('View users'),
                onPressed: () => getData(),
              ),
              ElevatedButton(
                child: Text('View All user'),
                onPressed: () => Get.to(() => ListUserScreen()),
              ),
              Image.asset(
                'assets/images/sample3.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

// void main() {
//   runApp(Test2());
// }

// class Test2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Demo'),
//         ),
//         body: Container(
//           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//           child: ImageSlideshow(
//             / Width of the [ImageSlideshow].
//             width: double.infinity,

//             / Height of the [ImageSlideshow].
//             height: 200,

//             / The page to show when first creating the [ImageSlideshow].
//             initialPage: 0,

//             / The color to paint the indicator.
//             indicatorColor: Colors.blue,

//             / The color to paint behind th indicator.
//             indicatorBackgroundColor: Colors.grey,

//             / The widgets to display in the [ImageSlideshow].
//             / Add the sample image file into the images folder
//             children: [
//               Image.asset(
//                 'assets/images/sample.jpg',
//                 fit: BoxFit.cover,
//               ),
//               Image.asset(
//                 'assets/images/sample2.jpg',
//                 fit: BoxFit.cover,
//               ),
//               Image.asset(
//                 'assets/images/sample3.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ],

//             / Called whenever the page in the center of the viewport changes.
//             onPageChanged: (value) {
//               print('Page changed: $value');
//             },

//             / Auto scroll interval.
//             / Do not auto scroll with null or 0.
//             autoPlayInterval: 3000,

//             / Loops back to first slide.
//             isLoop: true,
//           ),
//         ),
//       ),
//     );
//   }
// }
