import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sas/routes/routes.dart';

class CAbsenPulang extends GetxController {
  DateTime datePulang = DateTime.now();

  Future<void> insertPulang() async {
    try {
      String uri = "http://127.0.0.1:8000/api/kehadirans/";
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': '065',
        'WAKTU': DateFormat("y-MM-d H:m:s").format(datePulang),
        'LOKASI': 'lokasi',
        'STATUS': 'h',
        'ID_KETERANGAN': 'null'
      });
      var response = jsonDecode(res.body);
      if (response["success"] == true) {
        print('terkirim');
        Get.toNamed(Routes.dashboard);
      } else {
        print('false');
      }
    } catch (e) {
      print(e);
    }
  }
}
