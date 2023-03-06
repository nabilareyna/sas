import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:sas/component/widget/toast_widget.dart';

class CHistory extends GetxController {
  late Rx<TabController> tabController;
  RxString _nis = ''.obs;

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
    initUniqueIdentifierState();
    getNis();
    getJmlHistori();
    getHistori();
  }

  Future<void> initUniqueIdentifierState() async {
    String identifier;

    try {
      identifier = (await UniqueIdentifier.serial)!;
      _imei = identifier;
      print(identifier);
    } on PlatformException {
      identifier = 'failed';
    }
    if (!isClosed) return;
    _imei = identifier;
  }

  Future<void> getNis() async {
    String uri = "https://sasapi.000webhostapp.com/api/jmlhistori/" + _imei;
    var res = await http.get(Uri.parse(uri));

    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];

    try {
      if (response["success"] == true) {
        _nis = data[0]['IMEI'].obs;
      } else {
        ToastWidget.showToast(
            type: ToastWidgetType.ERROR,
            message: 'Periksa koneksi jaringan anda');
        print('Tidak ditemukan');
      }
    } catch (e) {
      ToastWidget.showToast(
          type: ToastWidgetType.ERROR,
          message: 'Periksa koneksi jaringan anda');
      print(e);
    }
  }

  Future<void> getHistori() async {
    loadingHistori = true.obs;

    String uri = "https://sasapi.000webhostapp.com/api/histori/";
    var res = await http.post(Uri.parse(uri), body: {
      'NIS': _nis,
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

    String uri = "https://sasapi.000webhostapp.com/api/jmlhistori/";
    var res = await http.post(Uri.parse(uri), body: {
      'NIS': _nis,
      'STATUS': nilaiStatus.hashCode.toString(),
      'BULAN': nilaiBulans.hashCode.toString()
    });
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
