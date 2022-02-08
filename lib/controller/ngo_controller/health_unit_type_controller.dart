import 'package:get/get.dart';

class HealthUnitTypeContoller extends GetxController {
  var dropdownValue = 'Health Unit Type'.obs;
  List healthUnitType = [
    'Health Care',
    'Free Meds',
    'Nursing Care',
  ].obs;

  setSelected(val) {
    dropdownValue.value = val;
  }
}
