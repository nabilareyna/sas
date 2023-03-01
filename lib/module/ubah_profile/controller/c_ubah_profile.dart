import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CUbahProfile extends GetxController {
  RxString nis = '212621537065'.obs;
  RxString nama = ''.obs;
  RxString kelasJurusan = ''.obs;
  RxString noHp = ''.obs;
  RxString email = ''.obs;
  RxString pass = ''.obs;
  RxBool loadingProfil = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    String uri =
        "https://sasapi.000webhostapp.com/api/siswas/" + nis.toString();
    var res = await http.get(Uri.parse(uri));
    var body = jsonDecode(res.body)['data'][0];
    try {
      nama = body['NAMA'].toString().obs;
      noHp = body['NO_HP'].toString().obs;
      email = body['EMAIL'].toString().obs;
      pass = body['PASSWORD'].toString().obs;
      loadingProfil = false.obs;
      print(body);
    } catch (e) {
      print('turu');
      print(e);
    }
  }
}
