import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:intl/intl.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:sas/component/widget/toast_widget.dart';

class CIzinPulang extends GetxController {
  final store = GetStorage();
  String _imei = 'Unk';
  String _nis = '';
  DateTime dateizin = DateTime.now();
  Rxn<String> selectedValue = Rxn<String>();
  RxInt jmlIzin = 1.obs;

  RxList<String> items = <String>['Sakit', 'Izin'].obs;
  TextEditingController tanggalIzin = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  Map<String, String> hari = {
    'Sunday': 'Minggu',
    'Monday': 'Senin',
    'Tuesday': 'Selasa',
    'Wednesday': 'Rabu',
    'Thursday': 'Kamis',
    'Friday': 'Jumat',
    'Saturday': 'Sabtu'
  };
  Map<String, String> bulan = {
    '1': 'Januari',
    '2': 'Februari',
    '3': 'Maret',
    '4': 'April',
    '5': 'Mei',
    '6': 'Juni',
    '7': 'Juli',
    '8': 'Agustus',
    '9': 'September',
    '10': 'Oktober',
    '11': 'November',
    '12': 'Desember',
  };

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readNis();
    tanggalIzin.text = hari[DateFormat('EEEE').format(dateizin)].toString() +
        ', ' +
        DateFormat('d').format(dateizin) +
        ' ' +
        bulan[DateFormat('M').format(dateizin)].toString() +
        ' ' +
        DateFormat('y').format(dateizin);
    // tanggalIzin.text =
    // int.parse(DateFormat('M').format(dateizin)) - 1);
  }

  String readNis() {
    _nis = store.read('nis');
    print(_nis);
    return _nis;
  }

  Future<void> insertIzinPulang(String textKeterangan) async {
    try {
      String uri = "https://sasapi.000webhostapp.com/api/kehadirans/";
      var resb = await http.post(Uri.parse(uri), body: {
        'NIS': _nis,
        'WAKTU': DateFormat("y-MM-d H:m:s").format(dateizin),
        'LOKASI': 'lokasi',
        'KETERANGAN': textKeterangan,
        'STATUS': 'IP',
        // 'FOTO_SURAT': ,
      });
      var body = jsonDecode(resb.body);
      if (body["success"] == true) {
        print('amann');
        ToastWidget.showToast(
            type: ToastWidgetType.SUCCESS, message: 'Perizinan telah dikirim');
        Get.toNamed(Routes.history);
      } else {
        ToastWidget.showToast(
            type: ToastWidgetType.ERROR,
            message: 'Anda telah melakukan presensi hari ini');
        Get.toNamed(Routes.dashboard);
        // print('duplikat');
      }
      // print(body);
    } catch (e) {
      ToastWidget.showToast(
          type: ToastWidgetType.ERROR, message: 'Periksa Koneksi Jaringan');
      print(e);
    }
  }
}
