import 'package:get/get.dart';

class DoseType extends GetxController {
  var dropdownValue = 'Select Dose Type'.obs;
  List doseType = [
    'Inhaler',
    'Syrup',
    'Tablet',
  ].obs;

  setSelected(val) {
    dropdownValue.value = val;
  }
}
