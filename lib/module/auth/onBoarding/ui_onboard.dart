import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sas/module/auth/core/authentication_manager.dart';
import 'package:sas/module/auth/login_page/ui/ui_loginpage.dart';
import 'package:sas/module/dashboard/ui/ui_dashboard.dart';

class UIOnBoarding extends StatelessWidget {
  const UIOnBoarding({key});

  @override
  Widget build(BuildContext context) {
    AuthenticationManager authManager = Get.find();

    return Obx(() {
      return authManager.isLogged.value ? UIDashboard() : UILoginPage();
    });
  }
}
