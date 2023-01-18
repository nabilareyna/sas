import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sas/utils/AppThemes.dart';

import 'dart:convert';
import 'HomePage.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'SAS',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
      theme: ThemeData(primaryColor: primary),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  bool setlog = false;
  String nama = '';
  String pass = '';
  TextEditingController namaController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> setLogin(String nama, String pass) async {
    String uri = "192.168.152.110/sas_api/api/login";

    var res = await http.post(Uri.parse(uri), body: {"usernameInput": nama, "passInput": pass});
    var response = jsonDecode(res.body);

    if (response["respon"] == true) {
      // Tanpa argument
      // Navigator.of(context).pushNamedAndRemoveUntil(link, (Route<dynamic> route) => false);
      // Dengan argument
      // Navigator.of(context).pushNamedAndRemoveUntil(link, (Route<dynamic> route) => false, arguments: arguments);

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(nama)));
    } else {
      print('salah');
    }

    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
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
                            controller: namaController,
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
                            controller: passController,
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
                    String nama = namaController.text;
                    String pass = passController.text;
                    setLogin(nama, pass);
                    super.initState();
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
      ),
    );
  }
}
