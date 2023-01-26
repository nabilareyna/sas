import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIKebijakanPrivasi extends StatelessWidget {
  const UIKebijakanPrivasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kebijakan Privasi', style: Styles.appBarTitle),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Kebijakan Privasi SAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the of the printing and\n\ntypesetting industry.',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
