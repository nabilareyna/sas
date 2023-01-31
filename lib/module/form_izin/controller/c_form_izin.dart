import 'package:get/get.dart';

class CFormIzin extends GetxController {
  Rxn<String> selectedValue = Rxn<String>();

  RxList<String> items = <String>['Sakit', 'Izin'].obs;

  // void onSelected(String value) {
  //   selectedValue = value;

  //   update();

  //   print(selectedValue);
  //   changeItems(selectedValue);
  // }
}

changeItems(String? selectedItems) {
  switch (selectedItems) {
    case 'Sakit':
      print('changed to 1');
      break;
    case 'Izin':
      print('changed to 2');
      break;
    default:
      print('changed to 1');
  }
}
