import 'package:flutter/material.dart';
import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';

class WButtonFeedback extends StatelessWidget {
  const WButtonFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 180),
      child: Column(
        children: [
          Container(
            height: 40,
            width: size.width,
            decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                'Kirim',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}