import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CHistory extends GetxController {
  Rxn<String> selectedValue = Rxn<String>();

  RxInt nilaiBulans = 0.obs;
  RxInt nilaiStatus = 0.obs;

  RxBool loadingHistori = true.obs;

  List histori = [];

  List<String> bulans =
      ['Pilih..', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'].obs;

  RxList<String> items = <String>['Laporan Semester', 'Laporan Bulanan'].obs;

  // void onSelected(String value) {
  //   selectedValue = value;

  //   update();

  //   print(selectedValue);
  //   changeItems(selectedValue);
  // }

  @override
  void onInit() {
    super.onInit();
    getHistori();
  }

  Future<void> getHistori() async {
    loadingHistori = true.obs;

    String uri = "http://10.0.2.2:8000/api/histori/";
    var res = await http.post(Uri.parse(uri), body: {'NIS': '212', 'STATUS': nilaiStatus.hashCode.toString(), 'BULAN': nilaiBulans.hashCode.toString()});
    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];
    try {
      if (response["success"] == true) {
        loadingHistori = false.obs;
        histori = data;
        // print(nilaiStatus);
        print(histori);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      print(e);
    }
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
}
