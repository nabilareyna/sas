import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CProfile extends GetxController {
  final store = GetStorage();
  String _nis = '';
  final RxString nama = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readNis();
    getProfile();
  }

  String readNis() {
    _nis = store.read('nis');
    print(_nis);
    return _nis;
  }

  Future<void> getProfile() async {
    try {
      String uri = "https://sasapi.000webhostapp.com/api/siswas/" + _nis.toString();
      var res = await http.get(Uri.parse(uri));
      var body = jsonDecode(res.body)['data'][0];
      nama.value = body['NAMA'];
    } catch (e) {
      print('turu');
      print(e);
    }
  }
}
