import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIPanduanSAS extends StatelessWidget {
  const UIPanduanSAS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Panduan', style: Styles.appBarTitle),
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
                height: 90.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF61A2BE),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Panduan Aplikasi SAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Sistem Absensi Sekolah',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: Text(
                      'Absen',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text('Panduan Absen'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                      title: Text(
                    'Izin',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  children: [
                      ListTile(
                        title: Text('Panduan Izin', style: TextStyle(
                          
                        ),),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
