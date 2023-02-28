import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sas/component/widget/toast_widget.dart';
import 'package:sas/model/login/login_request.dart';
import 'package:sas/model/login/login_response.dart';
import 'package:sas/module/auth/core/authentication_manager.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CLoginPage extends GetxController {
  late Rx<TabController> tabController;

  // RxBool setlog = false.obs;

  String nama = '';
  // comment salah satu apinya
  //if using android emulator
  // final String loginUrl = 'http://10.0.2.2:8000/api/siswas/';
  //if using web browser
  final String loginUrl = 'http://127.0.0.1:8000/api/siswas/';
  String pass = '';
  RxString identifier = 'Unknown'.obs;
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

  // Future<void> setLogin(String nama, String pass) async {
  //   final response = await loginService.fetchLogin(LoginRequestModel(nama: nama, pass: pass));

  //   if (response != null) {
  //     /// Set isLogin to true
  //     authManager.login(response.token);
  //   } else {
  //     /// Show user a dialog about the error response
  //     ToastWidget.showToast(type: ToastWidgetType.ERROR, message: 'user not found');
  //   }
  // }

  Future<LoginResponseModel?> setLogin(String nama, String pass) async {
    String uri = loginUrl + nama;
    try {
      var res = await http.get(Uri.parse(uri));
      print("RES: ${res.body}");
      final response = jsonDecode(res.body);
      var tes = jsonDecode(res.body)['data'];
      if (response["success"] == true) {
        if (!(response["data"][0]["PASSWORD"] == pass)) {
          print('password salah');
        }
        // else if (!(response["data"][0]["IMEI"] == imei ee)) {
        //   print('perangkat tidak sesuai');
        // }
        else {
          Get.toNamed(Routes.dashboard);
          print('selamat datang');
        }
      } else {
        ToastWidget.showToast(type: ToastWidgetType.ERROR, message: 'User Not Found');
        print('Tidak ditemukan');
      }
    } catch (e) {
      ToastWidget.showToast(type: ToastWidgetType.ERROR, message: '${e}');
      print('turu ${e}');
      return null;
    }
  }
}
