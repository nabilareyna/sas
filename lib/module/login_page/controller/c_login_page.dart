import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sas/HomePage.dart';

class CLoginPage extends GetxController {
  late Rx<TabController> tabController;

  RxBool setlog = false.obs;
  RxString nama = ''.obs;
  RxString pass = ''.obs;
  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> setLogin(String nama, String pass) async {
    String uri = "192.168.152.110/sas_api/api/login";

    var res = await http.post(Uri.parse(uri), body: {"usernameInput": nama, "passInput": pass});
    var response = jsonDecode(res.body);

    if (response["respon"] == true) {
      // Tanpa argument
      // Navigator.of(context).pushNamedAndRemoveUntil(link, (Route<dynamic> route) => false);
      // Dengan argument
      // Navigator.of(context).pushNamedAndRemoveUntil(link, (Route<dynamic> route) => false, arguments: arguments);

      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(nama)));
    } else {
      print('salah');
    }

    try {} catch (e) {
      print(e);
    }
  }
}
