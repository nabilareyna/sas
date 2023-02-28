import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CHistory extends GetxController {
  late Rx<TabController> tabController;

  RxInt nilaiBulans = 0.obs;
  RxInt nilaiStatus = 0.obs;
  RxInt jmlHadir = 0.obs;
  RxInt jmlIzin = 0.obs;

  List<String> bulans =
      ['Pilih..', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'].obs;
  RxList<String> status = <String>['Pilih..', 'Hadir & Pulang', 'Sakit & Izin'].obs;
  RxBool loadingHistori = true.obs;
  List histori = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getJmlHistori();
    getHistori();
  }

  Future<void> getHistori() async {
    loadingHistori = true.obs;

    String uri = "https://sasapi.000webhostapp.com/api/histori/";
    var res = await http.post(Uri.parse(uri), body: {'NIS': '212999', 'STATUS': nilaiStatus.hashCode.toString(), 'BULAN': nilaiBulans.hashCode.toString()});
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

    String uri = "https://sasapi.000webhostapp.com/api/jmlhistori/";
    var res = await http.post(Uri.parse(uri), body: {'NIS': '212999', 'STATUS': nilaiStatus.hashCode.toString(), 'BULAN': nilaiBulans.hashCode.toString()});
    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];
    try {
      if (response["success"] == true) {
        jmlIzin = data[0]['jmlIzin'].hashCode.obs;
        jmlHadir = data[0]['jmlHadir'].hashCode.obs;
        // jmlhadir = int.parse(data[0]['jmlHadir'].toString()).obs;
        print(jmlIzin);
        print(jmlHadir);
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