import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CUbahProfile extends GetxController {
  final store = GetStorage();
  String nis = '';
  RxString nama = ''.obs;
  RxString kelasJurusan = ''.obs;
  RxString noHp = ''.obs;
  RxString email = ''.obs;
  RxString pass = ''.obs;
  RxBool loadingProfil = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readNis();
    getProfile();
  }

  String readNis() {
    nis = store.read('nis');
    print(nis);
    return nis;
  }

  Future<void> getProfile() async {
    loadingProfil.value = true;
    String uri = "https://sasapi.000webhostapp.com/api/siswas/" + nis.toString();
    var res = await http.get(Uri.parse(uri));
    var body = jsonDecode(res.body)['data'][0];
    try {
      nama.value = body['NAMA'].toString();
      noHp.value = body['NO_HP'].toString();
      email.value = body['EMAIL'].toString();
      pass.value = body['PASSWORD'].toString();
      loadingProfil.value = false;
      print(body);
    } catch (e) {
      print('turu');
      print(e);
    }
  }
}
