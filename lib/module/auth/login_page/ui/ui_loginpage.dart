import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/auth/login_page/controller/c_login_page.dart';
import 'package:sas/module/auth/login_page/widget/w_button_login.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';
import 'package:sas/component/widget/toast_widget.dart';

class UILoginPage extends GetView<CLoginPage> {
  const UILoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Const.parentMargin()),
                child: Column(
                  children: [
                    // const Gap(80),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    Center(
                      child: SizedBox(
                          width: size.width,
                          child: Image.asset(
                            'assets/images/logotulisan.png',
                          )),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Styles.secondaryColor),
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Styles.secondaryColor.withOpacity(0.50),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset.fromDirection(0.5, 1.0),
                                )
                              ]),
                          width: size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: Const.siblingMargin(x: 4)),
                          margin: const EdgeInsets.symmetric(vertical: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Username',
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Const.siblingMargin(x: 2)),
                                  child: TextField(
                                    controller: controller.namaController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      hintText: 'Masukkan NIS',
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Password',
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: TextField(
                                    controller: controller.passController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        hintText: 'Masukkan password'),
                                  ),
                                ),
                              ]),
                        ),
                        // const Gap(65),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        InkWell(
                          child: const WButtonLogin(),
                          onTap: () {
                            if (controller.namaController.text.isEmpty) {
                              ToastWidget.showToast(
                                  type: ToastWidgetType.ERROR,
                                  message: 'Username tidak boleh kosong');
                            } else if (controller.passController.text.isEmpty) {
                              ToastWidget.showToast(
                                  type: ToastWidgetType.ERROR,
                                  message: 'Password tidak boleh kosong');
                            } else {
                              controller.setLogin(
                                  controller.namaController.text,
                                  controller.passController.text);
                            }
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
