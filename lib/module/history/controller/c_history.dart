import 'package:get/get.dart';

class CHistory extends GetxController {
  Rxn<String> selectedValue = Rxn<String>();

  RxList<String> items = <String>['Laporan Semester', 'Laporan Bulanan'].obs;

  // void onSelected(String value) {
  //   selectedValue = value;

  //   update();

  //   print(selectedValue);
  //   changeItems(selectedValue);
  // }
}

changeItems(String? selectedItems) {
  switch (selectedItems) {
    case 'Laporan Semester':
      print('changed to 1');
      break;
    case 'Laporan Bulanan':
      print('changed to 2');
      break;
    default:
      print('changed to 1');
  }
}
