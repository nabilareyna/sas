import 'package:get/get.dart';
import 'package:sas/module/dashboard/controller/c_dashboard.dart';
import 'package:sas/module/dashboard/ui/ui_dashboard.dart';
import 'package:sas/module/login_page/controller/c_login_page.dart';
import 'package:sas/module/login_page/ui/ui_loginpage.dart';

class Routes {
  static const String login = "/";
  static const String dashboard = "/dashboard";

  static String getLoginRoute() => login;
  static String getDashboardRoute() => dashboard;

  static List<GetPage> routes = [
    GetPage(
        name: login,
        page: () => const UILoginPage(),
        binding: BindingsBuilder(() {
          Get.put(CLoginPage());
        })),
    GetPage(
        name: dashboard,
        page: () => const UIDashboard(),
        binding: BindingsBuilder(() {
          Get.put(CDashboard());
        }))
  ];
}
