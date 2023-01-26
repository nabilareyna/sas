import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/ubah_profile/controller/c_ubah_profile.dart';
import 'package:sas/module/ubah_profile/widget/w_button_ubah_profile.dart';
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
          onPressed: () => Get.toNamed(Routes.profile),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF61A2BE),
                ),
                child: Column(
                  children: [
                    const Gap(130),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xFFD9D9D9),
                thickness: 10,
              ),
              const Gap(80),
              InkWell(
                child: const WButtonUbahProfile(),
                onTap: () {
                  Get.toNamed(Routes.getProfileRoute());
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
