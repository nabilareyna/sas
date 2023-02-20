import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CHistory extends GetxController {
  Rxn<String> selectedValue = Rxn<String>();

  RxList<String> items = <String>['Laporan Semester', 'Laporan Bulanan'].obs;
  RxBool loadingHistori = false.obs;
  List histori = [];
  // void onSelected(String value) {
  //   selectedValue = value;

  //   update();

  //   print(selectedValue);
  //   changeItems(selectedValue);
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHistori();
  }

  Future<void> getHistori() async {
    String uri = "http://127.0.0.1:8000/api/histori/";
    var res = await http.get(Uri.parse(uri));
    final response = jsonDecode(res.body);
    var tes = jsonDecode(res.body)['data']['data'];
    try {
      if (response["success"] == true) {
        // loadingHistori(!loadingHistori.isFalse);
        // loadingHistori = false.obs;
        loadingHistori.value = false;
        histori = tes;
        print(loadingHistori);
        print(histori);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      print(e);
      print(tes);
    }
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
