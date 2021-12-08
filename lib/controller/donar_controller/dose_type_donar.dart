import 'package:get/get.dart';

class DoseTypeDonar extends GetxController {
  var dropdownValue = 'Tablet'.obs;
  List doseType = [
    'Inhaler',
    'Syrup',
    'Tablet',
  ].obs;

  setSelected(val) {
    dropdownValue.value = val;
  }
}
