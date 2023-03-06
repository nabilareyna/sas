import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sas/component/widget/toast_widget.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CLoginPage extends GetxController {
  late Rx<TabController> tabController;

  // RxBool setlog = false.obs;
  String _nama = '';
  String _pass = '';
  // RxString _identifier = 'Unknown'.obs;
  String _imei = 'Unk';
  // RxString deviceId = ''.obs;

  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initUniqueIdentifierState();
  }

  Future<void> initUniqueIdentifierState() async {
    String identifier;

    try {
      identifier = (await UniqueIdentifier.serial)!;
      _imei = identifier;
      print(identifier);
    } on PlatformException {
      identifier = 'failed';
    }
    if (!isClosed) return;
    _imei = identifier;
  }

  Future<void> setLogin(String _nama, String _pass) async {
    String uri = "https://sasapi.000webhostapp.com/api/siswas/";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': _nama,
        'IMEI': _imei.toString(),
        'PASSWORD': _pass,
      });
      // var res = await http.get(Uri.parse(uri));
      final response = jsonDecode(res.body);
      final message = jsonDecode(res.body)['message'];
      if (response["success"] == true) {
        ToastWidget.showToast(type: ToastWidgetType.SUCCESS, message: message);
        Get.toNamed(Routes.dashboard);
      } else {
        ToastWidget.showToast(type: ToastWidgetType.ERROR, message: message);
      }
    } catch (e) {
      // ToastWidget.showToast(type: ToastWidgetType.ERROR, message: '${e}')
      ToastWidget.showToast(
          type: ToastWidgetType.ERROR, message: 'Periksa Koneksi Jaringan');
      print(e);
    }
  }
}
