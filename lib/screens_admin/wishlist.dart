import 'package:flutter/material.dart';
import 'package:fyp_real/controller/admin_controller/admin_api_calling.dart';
import 'package:fyp_real/controller/admin_controller/wishlist_controller.dart';
import 'package:fyp_real/screens_admin/pharmacies_list.dart';
import 'package:get/get.dart';

class Wishlist extends StatefulWidget {
  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  var med;
  late WishlistController wishCtrl;
  @override
  void initState() {
    wishCtrl = Get.put(WishlistController());
    AdminApiCalling().getWishlist();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            med = wishCtrl.wishlist[index];
            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.medical_services),
                title: Text(med.name),
                subtitle: Column(
                  children: [
                    Text(med.type),
                    Text('Quantity: ${med.qty}'),
                  ],
                ),
                trailing: ElevatedButton(
                  child: Text('Get Medicine'),
                  onPressed: () {
                    var wishid = wishCtrl.wishlist[index].id;
                    print(wishCtrl.wishlist[index].id);
                    Get.to(() => PharmaciesList(), arguments: [wishid]);
                  },
                ),
              ),
            );
          },
          itemCount: wishCtrl.wishlist.length,
        ),
      ),
    );
  }
}
