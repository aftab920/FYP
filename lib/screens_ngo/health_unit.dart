import 'package:flutter/material.dart';
import 'package:fyp_real/controller/ngo_controller/all_health_units_controller.dart';
import 'package:fyp_real/controller/ngo_controller/ngo_api_calling.dart';
import 'package:fyp_real/widgets_ngo/add_health_unit.dart';
import 'package:get/get.dart';

class HealthUnit extends StatefulWidget {
  @override
  State<HealthUnit> createState() => _HealthUnitState();
}

class _HealthUnitState extends State<HealthUnit> {
  var healthUnits;
  late AllHealthUnitsController healthUnitCtrl;
  bool value = false;

  @override
  void initState() {
    healthUnitCtrl = Get.put(AllHealthUnitsController());
    NgoApiCalling().getAllHealthUnits();
    super.initState();
  }

  void _addHealthUnit(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddHealthUnit(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Units'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  healthUnits = healthUnitCtrl.healthUnits[index];

                  return Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(healthUnits.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Text('Address: ${healthUnits.address}'),
                          Text('Health Unit Type: ${healthUnits.type}'),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: healthUnitCtrl.healthUnits.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _addHealthUnit(context),
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HealthUnits'),
//       ),
//       body: Column(
//         children: [
//           Card(
//             elevation: 5,
//             child: ListTile(
//               leading: Checkbox(
//                 value: this.value,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     this.value = value!;
//                   });
//                 },
//               ),
//               title: Text('PIMS'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   Text('Email: info@pims.com'),
//                   Text('Phone: 0302690'),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             elevation: 5,
//             child: ListTile(
//               leading: Checkbox(
//                 value: this.value,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     this.value = value!;
//                   });
//                 },
//               ),
//               title: Text('Childrens Hospital'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   Text('Email: info@ch.com'),
//                   Text('Phone: 0302661'),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             elevation: 5,
//             child: ListTile(
//               leading: Checkbox(
//                 value: this.value,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     this.value = value!;
//                   });
//                 },
//               ),
//               title: Text('Shokat Khanum'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   Text('Email: info@SKM.com'),
//                   Text('Phone: 0302600009'),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 3,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 15,
//                   right: 20,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Remove',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
