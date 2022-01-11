import 'package:get/get.dart';

class HealthUnitTypeContoller extends GetxController {
  var dropdownValue = 'Select Health Unit Type'.obs;
  List doseType = [
    'Health Care',
    'Hospital',
    'Nursing Care',
  ].obs;

  setSelected(val) {
    dropdownValue.value = val;
  }
}
