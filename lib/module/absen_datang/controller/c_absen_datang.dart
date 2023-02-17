import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sas/module/absen_pulang/widget/w_card_absen_pulang.dart';
import 'package:sas/routes/routes.dart';

class CAbsenDatang extends GetxController {
  DateTime date = DateTime.now();

  Future<void> insertHadir() async {
    try {
      String uri = "http://127.0.0.1:8000/api/kehadirans/";
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': '065',
        'WAKTU': DateFormat("y-MM-d H:m:s").format(date),
        'LOKASI': 'lokasi',
        'STATUS': 'h',
        'ID_KETERANGAN': 'null'
      });
      var response = jsonDecode(res.body);
      if (response["success"] == true) {
        print('terkirim');
        // WCardAbsenPulang();
        Get.toNamed(Routes.dashboard);
      } else {
        print('false');
      }
    } catch (e) {
      print(e);
    }
  }
}
