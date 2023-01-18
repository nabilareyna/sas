import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/login_page/controller/c_login_page.dart';
import 'package:sas/utils/AppThemes.dart';

class UILoginPage extends GetView<CLoginPage> {
  const UILoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/LogoSas.png',
                  )),
            ),
          ),
          Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Styles.secondaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Styles.secondaryColor.withOpacity(0.50),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset.fromDirection(0.5, 1.0),
                          )
                        ]),
                    width: 400,
                    height: 190,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        'Username',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: TextField(
                          controller: controller.namaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                            hintText: 'Masukkan NIS',
                          ),
                        ),
                      ),
                      Text(
                        'Password',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: controller.passController,
                          obscureText: true,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)), hintText: 'Masukkan password'),
                        ),
                      ),
                    ]),
                  )
                ],
              )),
          const Gap(65),
          Container(
            height: 50,
            width: 450,
            decoration: BoxDecoration(color: Styles.primaryColor, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => HomePage('aldi')));
                @override
                void initState() {
                  // TODO: implement initState
                  String nama = controller.namaController.text;
                  String pass = controller.passController.text;
                  controller.setLogin(nama, pass);
                  //super.initState();
                }
              },
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Montserrat'),
              ),
            ),
          ),
          SizedBox(
            height: 130,
          ),
          // Text('New User? Create Account')
        ],
      ),
    );
  }
}
