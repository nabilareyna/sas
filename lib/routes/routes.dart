import 'package:get/get.dart';
import 'package:sas/module/absen_datang/controller/c_absen_datang.dart';
import 'package:sas/module/absen_datang/ui/ui_absen_datang.dart';
import 'package:sas/module/absen_pulang/controller/c_absen_pulang.dart';
import 'package:sas/module/absen_pulang/ui/ui_absen_pulang.dart';
import 'package:sas/module/dashboard/controller/c_dashboard.dart';
import 'package:sas/module/dashboard/ui/ui_dashboard.dart';
import 'package:sas/module/feedback/controller/c_feedback.dart';
import 'package:sas/module/feedback/ui/ui_feedback.dart';
import 'package:sas/module/form_izin/controller/c_form_izin.dart';
import 'package:sas/module/form_izin/ui/ui_form_izin.dart';
import 'package:sas/module/history/controller/c_history.dart';
import 'package:sas/module/history/ui/ui_history.dart';
import 'package:sas/module/kebijakan_privasi/ui/ui_kebijakan_privasi.dart';
import 'package:sas/module/login_page/controller/c_login_page.dart';
import 'package:sas/module/login_page/ui/ui_loginpage.dart';
import 'package:sas/module/panduan_sas/ui/ui_panduan_sas.dart';
import 'package:sas/module/profile/controller/c_profile.dart';
import 'package:sas/module/profile/ui/ui_profile.dart';
import 'package:sas/module/ubah_profile/controller/c_ubah_profile.dart';
import 'package:sas/module/ubah_profile/ui/ui_ubah_profile.dart';

class Routes {
  static const String login = "/";
  static const String dashboard = "/dashboard";
  static const String history = "/history";
  static const String profile = "/profile";
  static const String feedback = "/feedback";
  static const String privacypolicy = "/privacypolicy";
  static const String editprofile = "/edit-profile";
  static const String panduansas = "/panduan-sas";
  static const String absendatang = "/absen-datang";
  static const String absenpulang = "/absen-pulang";
  static const String pengajuanizin = "/pengajuan-izin";

  static String getLoginRoute() => login;
  static String getDashboardRoute() => dashboard;
  static String getHistoryRoute() => history;
  static String getProfileRoute() => profile;
  static String getFeedbackRoute() => feedback;
  static String getEditProfileRoute() => editprofile;
  static String getPrivacyPolicyRoute() => privacypolicy;
  static String getPanduanSasRoute() => panduansas;
  static String getAbsenDatangRoute() => absendatang;
  static String getAbsenPulangRoute() => absenpulang;
  static String getPengajuanIzinRoute() => pengajuanizin;

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
        transition: Transition.fadeIn),
    GetPage(
        name: feedback,
        page: () => const UIFeedback(),
        binding: BindingsBuilder(() {
          Get.put(CFeedback());
        }),
        transition: Transition.fadeIn),
    GetPage(name: panduansas, page: () => const UIPanduanSAS(), transition: Transition.fadeIn),
    GetPage(name: privacypolicy, page: () => const UIKebijakanPrivasi(), transition: Transition.fadeIn),
    GetPage(
        name: editprofile,
        page: () => const UIUbahProfile(),
        binding: BindingsBuilder(() {
          Get.put(CUbahProfile());
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: absendatang,
        page: () => const UIAbsenDatang(),
        binding: BindingsBuilder(() {
          Get.put(CAbsenDatang());
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: absenpulang,
        page: () => const UIAbsenPulang(),
        binding: BindingsBuilder(() {
          Get.put(CAbsenPulang());
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: pengajuanizin,
        page: () => const UIFormIzin(),
        binding: BindingsBuilder(() {
          Get.put(CFormIzin());
        }),
        transition: Transition.fadeIn),
  ];
}
