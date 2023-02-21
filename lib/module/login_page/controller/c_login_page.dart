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

  // RxBool setlog = false.obs;
  String _nama = '';
  String _pass = '';
  RxString _identifier = 'Unknown'.obs;
  String _imei = 'Unk';
  RxString deviceId = ''.obs;

  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> initUniqueIdentifierState() async {
    String identifier;

    try {
      identifier = (await UniqueIdentifier.serial)!;
      print(identifier);
    } on PlatformException {
      identifier = 'failed';
    }
    if (!isClosed) return;
    _imei = identifier;
  }

  Future<void> setLogin(String _nama, String _pass) async {
    String uri = "http://127.0.0.1:8000/api/siswas/" + _nama;
    try {
      var res = await http.get(Uri.parse(uri));
      final response = jsonDecode(res.body);
      var tes = jsonDecode(res.body)['data'];
      if (response["success"] == true) {
        if (!(response["data"][0]["PASSWORD"] == 'SIP')) {
          print('password salah');
        } else if (!(response["data"]["IMEI"] == _nama)) {
          print('perangkat tidak sesuai');
        } else {
          print('selamat datang');
          // Get.toNamed(Routes.dashboard);
        }
        // print(tes[0]['PASSWORD']);
      } else {
        print('Tidak ditemukan');
      }
    } catch (e) {
      print('turu');
    }
  }
}

void _showToast(BuildContext context, String _pass) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(_pass),
      // action: SnackBarAction(
      //     label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
