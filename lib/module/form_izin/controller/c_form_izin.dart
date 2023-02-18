import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:intl/intl.dart';

class CFormIzin extends GetxController {
  DateTime dateizin = DateTime.now();
  Rxn<String> selectedValue = Rxn<String>();

  RxList<String> items = <String>['Sakit', 'Izin'].obs;

  // void onSelected(String value) {
  //   selectedValue = value;

  //   update();

  //   print(selectedValue);
  //   changeItems(selectedValue);
  // }
  Future<void> insertIzin() async {
    try {
      String uri = "http://127.0.0.1:8000/api/kehadirans/";
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': '212',
        'WAKTU': DateFormat("y-MM-d H:m:s").format(dateizin),
        'LOKASI': 'lokasi',
        // 'STATUS': CFormIzin().selectedValue,
        'STATUS': 'I',
        'FOTO_SURAT': ''
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
