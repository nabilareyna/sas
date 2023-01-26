import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/module/dashboard/controller/c_page_view.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final pageC = Get.put(CPgeView(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primary),
      initialRoute: Routes.getLoginRoute(),
      getPages: Routes.routes,
    );
  }
}
