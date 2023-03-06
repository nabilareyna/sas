import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:sas/component/widget/toast_widget.dart';

class CFeedback extends GetxController {
  final store = GetStorage();
  String _imei = 'Unk';
  String _nis = '';

  TextEditingController nisControllerFeedBack = TextEditingController();
  TextEditingController emailControllerFeedback = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    readNis();
    super.onInit();
  }

  String readNis() {
    _nis = store.read('nis');
    print(_nis);
    return _nis;
  }

  Future<void> insertFeedBack(String _email, String _feedback) async {
    try {
      String uri = "https://sasapi.000webhostapp.com/api/feedback";
      var res = await http.post(Uri.parse(uri), body: {'NIS': _nis, 'EMAIL': _email, 'FEEDBACK': _feedback});
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
