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
    return Obx(
      () => Scaffold(
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
                    color: Color.fromRGBO(97, 162, 190, 1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5.0, 4.0),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              ImageIcon(
                                AssetImage('assets/icons/person.png'),
                                color: Color(0xFF777777),
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(25),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, bottom: 10, top: 14),
                              child: Row(
                                children: const [
                                  Text(
                                    'Nama Lengkap',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: Container(
                                height: 42,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEFEFEF),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: Text(
                                    controller.nama.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xFFC7C7C7E5),
                  thickness: 10,
                ),
              ],
            ),
            SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  Gap(10),
                  Padding(
                    padding: EdgeInsets.only(top: 250, left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kelas & Jurusan',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  Gap(10),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.kelasJurusan.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFC7C7C7),
                    thickness: 1,
                    indent: 16,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'No Hp',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  Gap(10),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.noHp.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFC7C7C7),
                    thickness: 1,
                    indent: 16,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  Gap(10),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.email.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFC7C7C7),
                    thickness: 1,
                    indent: 16,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  Gap(10),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.pass.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFC7C7C7),
                    thickness: 1,
                    indent: 16,
                    endIndent: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
