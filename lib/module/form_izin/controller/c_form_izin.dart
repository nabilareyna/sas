import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CFormIzin extends GetxController {
  Rxn<String> selectedValue = Rxn<String>();

  RxList<String> items = <String>['Sakit', 'Izin'].obs;
  DateTime date = DateTime.now();

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

  Future<void> insertIzin() async {
    try {
      String uri = "http://127.0.0.1:8000/api/izin/";
      var res = await http.post(Uri.parse(uri), body: {
        '': CFormIzin().selectedValue,
        'NIS': 'nis',
        'WAKTU': CFormIzin().date,
        'LOKASI': 'lokasi',
        'ID_KETERANGAN': 'namaGambar'
      });
      var response = jsonDecode(res.body);
      if (response["success"] == true) {
        print('amann');
      } else {
        print('ga');
      }
    } catch (e) {
      print('kesalahan');
    }
  }
}
