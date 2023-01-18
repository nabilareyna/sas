import 'package:flutter/material.dart';
import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';

class WButtonLogin extends StatelessWidget {
  const WButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(color: Styles.primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'LOGIN',
          style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
