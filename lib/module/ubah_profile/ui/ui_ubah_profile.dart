import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/module/ubah_profile/controller/c_ubah_profile.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIUbahProfile extends GetView<CUbahProfile> {
  const UIUbahProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profil', style: Styles.appBarTitle),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Styles.secondaryColor,
          ),
          onPressed: () => Get.toNamed(Routes.dashboard),
        ),
      ),
    );
  }
}
