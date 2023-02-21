import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

enum ToastWidgetType {
  SUCCESS(backgroundColor: Color(0xFFF1F8E9), borderColor: Color(0xFF2E7D32)),
  WARNING(backgroundColor: Color(0xFFFFECB3), borderColor: Colors.amber),
  ERROR(backgroundColor: Color(0xFFFFCDD2), borderColor: Colors.red);

  final Color backgroundColor;
  final Color borderColor;
  const ToastWidgetType({required this.backgroundColor, required this.borderColor});
}

class ToastWidget {
  static showToast({required ToastWidgetType type, required String message, Color textColor = Colors.black}) {
    Get.showSnackbar(GetSnackBar(
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              style: Styles.absenPageSubHeading,
            ),
          ),
        ],
      ),
      backgroundColor: type.backgroundColor,
      isDismissible: true,
      borderWidth: 1,
      borderColor: type.borderColor,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: Const.siblingMargin(),
      margin: EdgeInsets.symmetric(horizontal: Const.parentMargin(), vertical: Const.parentMargin()),
      barBlur: 0.0,
      padding: EdgeInsets.symmetric(
        horizontal: Const.siblingMargin(x: 2.5),
        vertical: Const.siblingMargin(x: 2),
      ),
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 3),
      maxWidth: 600,
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: false,
    ));
  }
}
