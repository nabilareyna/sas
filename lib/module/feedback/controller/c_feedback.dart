import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sas/routes/routes.dart';

class CFeedback extends GetxController {
  Future<void> insertFeedBack() async {
    try {
      String uri = "http://127.0.0.1:8000/api/feedback";
      var res = await http.post(Uri.parse(uri),
          body: {'NIS': 'niss', 'EMAIL': 'email', 'FEEDBACK': 'feedback ee'});
      var response = jsonDecode(res.body);

      if (response["success"] == true) {
        print('aman');
      } else {
        print('ga aman');
      }
    } catch (e) {
      print(e);
    }
  }
}
