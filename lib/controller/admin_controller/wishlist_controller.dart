import 'dart:convert';
import 'package:fyp_real/model/model_admin/wishlist_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = [].obs;

  void allItems(res) {
    Iterable it = jsonDecode(res.body);
    it = it.toList();
    wishlist.value = it.map((e) => WishlistModel.fromMap(e)).toList();
  }
}
