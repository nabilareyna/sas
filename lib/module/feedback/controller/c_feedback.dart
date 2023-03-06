import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:sas/component/widget/toast_widget.dart';

class CFeedback extends GetxController {
  String _imei = 'Unk';
  String _nis = '';

  TextEditingController nisControllerFeedBack = TextEditingController();
  TextEditingController emailControllerFeedback = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

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
      getNis();

      print(identifier);
    } on PlatformException {
      identifier = 'failed';
    }
    if (!isClosed) return;
    _imei = identifier;
  }

  Future<void> getNis() async {
    String uri = "https://sasapi.000webhostapp.com/api/jmlhistori/" + _imei;
    var res = await http.get(Uri.parse(uri));

    final response = jsonDecode(res.body);
    var data = jsonDecode(res.body)['data'];

    try {
      if (response["success"] == true) {
        _nis = data[0]['IMEI'].obs;
      } else {
        ToastWidget.showToast(
            type: ToastWidgetType.ERROR,
            message: 'Periksa koneksi jaringan anda');
        print('Tidak ditemukan');
      }
    } catch (e) {
      ToastWidget.showToast(
          type: ToastWidgetType.ERROR,
          message: 'Periksa koneksi jaringan anda');
      print(e);
    }
  }

  Future<void> insertFeedBack(String _email, String _feedback) async {
    try {
      String uri = "https://sasapi.000webhostapp.com/api/feedback";
      var res = await http.post(Uri.parse(uri),
          body: {'NIS': _nis, 'EMAIL': _email, 'FEEDBACK': _feedback});
      var response = jsonDecode(res.body);

      if (response["success"] == true) {
        print('aman');
        Get.toNamed(Routes.getProfileRoute());
      } else {
        print('ga aman');
      }
    } catch (e) {
      print(e);
    }
  }
}
