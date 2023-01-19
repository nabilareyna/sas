import 'package:get/get.dart';
import 'package:sas/module/dashboard/controller/c_dashboard.dart';
import 'package:sas/module/dashboard/ui/ui_dashboard.dart';
import 'package:sas/module/history/controller/c_history.dart';
import 'package:sas/module/history/ui/ui_history.dart';
import 'package:sas/module/login_page/controller/c_login_page.dart';
import 'package:sas/module/login_page/ui/ui_loginpage.dart';
import 'package:sas/module/profile/controller/c_profile.dart';
import 'package:sas/module/profile/ui/ui_profile.dart';

class Routes {
  static const String login = "/";
  static const String dashboard = "/dashboard";
  static const String history = "/history";
  static const String profile = "/profile";

  static String getLoginRoute() => login;
  static String getDashboardRoute() => dashboard;
  static String getHistoryRoute() => history;
  static String getProfileRoute() => profile;

  static List<GetPage> routes = [
    GetPage(
        name: login,
        page: () => const UILoginPage(),
        binding: BindingsBuilder(() {
          Get.put(CLoginPage());
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: dashboard,
        page: () => UIDashboard(),
        binding: BindingsBuilder(() {
          Get.put(CDashboard());
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: history,
        page: () => UIHistory(),
        binding: BindingsBuilder(() {
          Get.put(CHistory());
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: profile,
        page: () => UIProfile(),
        binding: BindingsBuilder(() {
          Get.put(CProfile());
        }),
        transition: Transition.fadeIn)
  ];
}
