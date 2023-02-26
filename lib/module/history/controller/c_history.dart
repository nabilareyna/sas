import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CHistory extends GetxController {
  late Rx<TabController> tabController;

  // Rxn<String> selectedValueBulan = Rxn<String>();
  // Rxn<String> selectedValueStatus = Rxn<String>();
  RxInt nilaiBulans = 0.obs;
  RxInt nilaiStatus = 0.obs;
  RxInt jmlhadir = 0.obs;
  RxInt jmlIzin = 0.obs;
  String jmlH = '';
  int jmlI = 0;

  List<String> bulans = [
    'Pilih..',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ].obs;
  RxList<String> status =
      <String>['Pilih..', 'Hadir & Pulang', 'Sakit & Izin'].obs;
  RxBool loadingHistori = true.obs;
  List histori = [];

  void onSelectBulan(String value) {}
  void onSelectSat(String value) {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getJmlHistori();
    getHistori();
  }

  Future<void> getHistori() async {
    loadingHistori = true.obs;

    String uri = "http://127.0.0.1:8000/api/histori/";
    var res = await http.post(Uri.parse(uri), body: {
      'NIS': '212',
      'STATUS': nilaiStatus.hashCode.toString(),
      'BULAN': nilaiBulans.hashCode.toString()
    });
    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];
    try {
      if (response["success"] == true) {
        loadingHistori = false.obs;
        histori = data;
        // print(nilaiStatus);
        // print(histori);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getJmlHistori() async {
    loadingHistori = true.obs;

    String uri = "http://127.0.0.1:8000/api/jmlhistori/";
    var res = await http.post(Uri.parse(uri), body: {
      'NIS': '212',
      'STATUS': nilaiStatus.hashCode.toString(),
      'BULAN': nilaiBulans.hashCode.toString()
    });
    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];
    try {
      if (response["success"] == true) {
        jmlIzin = data['jmlIzin'].obs;
        jmlH = data['jmlHadir'];
        // jmlhadir = int.parse(data[0]['jmlHadir'].toString()).obs;
        print(jmlH);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      print(e);
    }
  }
}

// changeItems(String? selectedItems) {
//   switch (selectedItems) {
//     case 'Laporan Semester':
//       print('changed to 1');
//       break;
//     case 'Laporan Bulanan':
//       print('changed to 2');
//       break;
//     default:
//       print('changed to 1');
//   }
// }
