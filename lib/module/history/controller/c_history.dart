import 'dart:convert';
import 'dart:async';

import 'package:sas/component/widget/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:sas/component/widget/toast_widget.dart';

class CHistory extends GetxController {
  final store = GetStorage();
  late Rx<TabController> tabController;
  String _nis = '';

  RxInt nilaiBulans = 0.obs;
  RxInt nilaiStatus = 0.obs;
  RxInt jmlHadir = 0.obs;
  RxInt jmlIzin = 0.obs;

  String _imei = 'Unk';

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readNis();
    getJmlHistori();
    getHistori();
  }

  String readNis() {
    _nis = store.read('nis');
    print(_nis);
    return _nis;
  }

  Future<void> getHistori() async {
    loadingHistori.value = true;

    String uri = "https://sasapi.000webhostapp.com/api/histori/";
    var res = await http.post(Uri.parse(uri), body: {
      'NIS': _nis.toString(),
      'STATUS': nilaiStatus.hashCode.toString(),
      'BULAN': nilaiBulans.hashCode.toString()
    });
    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];
    try {
      if (response["success"] == true) {
        loadingHistori.value = false;
        histori = data;
        // print(nilaiStatus);
        // print(histori);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      ToastWidget.showToast(
          type: ToastWidgetType.ERROR, message: 'Periksa Koneksi Jaringan');
      print(e);
    }
  }

  Future<void> getJmlHistori() async {
    loadingHistori.value = true;

    String uri = "https://sasapi.000webhostapp.com/api/jmlhistori/";
    var res = await http.post(Uri.parse(uri), body: {
      'NIS': _nis.toString(),
      'STATUS': nilaiStatus.hashCode.toString(),
      'BULAN': nilaiBulans.hashCode.toString()
    });
    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];
    try {
      if (response["success"] == true) {
        jmlIzin.value = data[0]['jmlIzin'].hashCode;
        jmlHadir.value = data[0]['jmlHadir'].hashCode;
        loadingHistori.value = false;
        print(jmlIzin);
        print(jmlHadir);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      // ToastWidget.showToast(
      //     type: ToastWidgetType.ERROR, message: 'Periksa Koneksi Jaringan');
      print(e);
    }
  }
}
