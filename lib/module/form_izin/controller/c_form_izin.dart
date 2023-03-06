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

class CFormIzin extends GetxController {
  final store = GetStorage();
  DateTime dateizin = DateTime.now();
  Rxn<String> selectedValue = Rxn<String>();
  RxInt jmlIzin = 1.obs;
  String _imei = 'Unk';
  String _nis = '';

  RxList<String> ketIzin = ['Sakit', 'Izin'].obs;
  List<String> iniIzin = ['S', 'I'];
  RxInt noKetIzin = 0.obs;
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
    // initUniqueIdentifierState();
  }

  String readNis() {
    _nis = store.read('nis');
    print(_nis);
    return _nis;
  }

  Future<void> insertIzin(String textKeterangan) async {
    try {
      String uri = "https://sasapi.000webhostapp.com/api/kehadirans/";
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': _nis.toString(),
        'WAKTU': DateFormat("y-MM-d H:m:s").format(dateizin),
        'LOKASI': 'lokasi',
        'KETERANGAN': textKeterangan,
        'STATUS': iniIzin[noKetIzin.hashCode],
        'JUMLAH_HARI': jmlIzin.toString()
        // 'FOTO_SURAT': ,
      });
      var response = jsonDecode(res.body);
      if (response["success"] == true) {
        print(response);
        print('amann');
      } else {
        print(response);
        print('ga');
      }
      // print(response);
    } catch (e) {
      print(e);
    }
  }
}
