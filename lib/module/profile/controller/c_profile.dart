import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CProfile extends GetxController {
  RxString nisA = '212621537065'.obs;
  RxString namaA = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    String uri =
        "https://sasapi.000webhostapp.com/api/siswas/" + nisA.toString();
    var res = await http.get(Uri.parse(uri));
    var body = jsonDecode(res.body)['data'][0];
    try {
      namaA = body['NAMA'].toString().obs;
    } catch (e) {
      print('turu');
      print(e);
    }
  }
}
