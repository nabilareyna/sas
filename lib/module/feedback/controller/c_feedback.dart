import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CFeedback extends GetxController {
  TextEditingController nisControllerFeedBack = TextEditingController();
  TextEditingController emailControllerFeedback = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  Future<void> insertFeedBack(String _niss, String _email, String _feedback) async {
    try {
      String uri = "https://sasapi.000webhostapp.com/api/feedback";
      var res = await http.post(Uri.parse(uri), body: {'NIS': _niss, 'EMAIL': _email, 'FEEDBACK': _feedback});
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
