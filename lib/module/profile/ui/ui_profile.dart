import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sas/component/widget/scaffold_widget.dart';
import 'package:sas/module/dashboard/controller/c_page_view.dart';
import 'package:sas/module/history/controller/c_history.dart';
import 'package:sas/routes/routes.dart';

class UIProfile extends GetView<CHistory> {
  UIProfile({Key? key}) : super(key: key);

  final pageC = Get.find<CPgeView>();

  @override
  Widget build(BuildContext context) {
    return WScaffold(
      body: (context, orientation, platform) {
        return Stack(
          children: [
            Container(
              height: 225.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF61A2BE),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: ImageIcon(
                                AssetImage('assets/icons/personedit.png'),
                                color: Color(0xFF777777),
                                size: 70.33,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Fajar Ainur Roziqin',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 225),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.getEditProfileRoute());
                },
                child: SizedBox(
                    child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const <Widget>[
                        ImageIcon(
                          AssetImage('assets/icons/pencil.png'),
                          size: 25.0,
                          color: Color(0xFF777777),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            'Detail Profil',
                            style: TextStyle(
                                color: Color(0xFF777777),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 275),
              child: SizedBox(
                  child: Container(
                color: const Color.fromRGBO(196, 196, 196, 0.12),
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Text(
                          'Tentang',
                          style: TextStyle(
                              color: Color(0xFF777777),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 305),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.panduansas);
                },
                child: SizedBox(
                    child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const <Widget>[
                        ImageIcon(
                          AssetImage('assets/icons/lamp.png'),
                          size: 25.0,
                          color: Color(0xFF777777),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            'Panduan SAS',
                            style: TextStyle(
                                color: Color(0xFF777777),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 355),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.privacypolicy);
                },
                child: SizedBox(
                    child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const <Widget>[
                        ImageIcon(
                          AssetImage('assets/icons/privacy.png'),
                          size: 25.0,
                          color: Color(0xFF777777),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            'Kebijakan Privasi',
                            style: TextStyle(
                                color: Color(0xFF777777),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 405),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.feedback);
                },
                child: SizedBox(
                    child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: const <Widget>[
                        ImageIcon(
                          AssetImage('assets/icons/chat.png'),
                          size: 25.0,
                          color: Color(0xFF777777),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            'Feedback',
                            style: TextStyle(
                                color: Color(0xFF777777),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 455),
              child: SizedBox(
                  child: Container(
                color: const Color.fromRGBO(196, 196, 196, 0.12),
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: Text(
                          'Lainnya',
                          style: TextStyle(
                              color: Color(0xFF777777),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 485),
              child: SizedBox(
                  child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: const <Widget>[
                      ImageIcon(
                        AssetImage('assets/icons/out.png'),
                        size: 25.0,
                        color: Color(0xFFD90000),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                              color: Color(0xFFD90000),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ],
        );
      },
    );
  }
}
