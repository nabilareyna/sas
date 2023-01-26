import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CLoginPage extends GetxController {
  late Rx<TabController> tabController;

  RxBool setlog = false.obs;
  String _nama = '';
  String _pass = '';
  String _identifier = 'Unknown';
  RxString deviceId = ''.obs;

  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> initUniqueIdentifierState() async {
    String identifier;

    try {
      identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      identifier = 'failed';
    }
    if (!isClosed) return;
    _identifier = identifier;
  }

  Future<void> setLogin() async {
    try {
      String uri = "http://192.168.90.110/sas_api/api/login";

      var res = await http.post(Uri.parse(uri), body: {"username": _nama, "password": _pass});
      var response = jsonDecode(res.body);

      if (response["respon"] == true) {
        if (response["responPass"] == false) {
          print('Password salah');
        } else if (!(response['imei'] == _identifier)) {
          print('Perangkat tidak sesuai dengan Akun');
        } else {
          print('Selamat datang ' + _nama);
          Get.toNamed(Routes.dashboard);
        }
      } else {
        print('Username tidak ditemukan');
        print('salah');
      }
    } catch (e) {
      print(e);
    }
  }
}
