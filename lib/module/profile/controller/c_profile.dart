import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';
import 'package:get/get.dart';

class CProfile extends GetxController {
  RxString nis = '21237'.obs;
  RxString nama = '21237'.obs;
  RxString kelasJurusan = '21237'.obs;
  RxString email = '21237'.obs;
  RxString kodePer = '21237'.obs;
  RxString pass = '21237'.obs;
  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {}
}
