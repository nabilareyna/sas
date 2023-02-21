import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CAbsenDatang extends GetxController {
  DateTime date = DateTime.now();
  RxString _lokasi = ''.obs;

  Future<void> insertHadir() async {
    try {
      String uri = "http://127.0.0.1:8000/api/kehadirans/";
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': 'nis',
        'WAKTU': date,
        'LOKASI': 'lokasi',
        'STATUS': 'h',
        'ID_KETERANGAN': ' '
      });
      var response = jsonDecode(res.body);
      if (response["success"] == true) {
        print('terkirim');
      } else {
        print('false');
      }
    } catch (e) {
      print(e);
    }
  }
}
