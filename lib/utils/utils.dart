import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class Utils {
  static bool onTimeHadir(DateTime time) {
    final startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      5,
      30,
    );
    final endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      7,
      00,
    );
    if (time.isAfter(startTime) && time.isBefore(endTime)) return true;
    return false;
  }

  static bool onTimePulang(DateTime time) {
    final startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      15,
      15,
    );
    final endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      18,
      0,
    );
    if (time.isAfter(startTime) && time.isBefore(endTime)) return true;
    return false;
  }

  static Future<bool> onSchoolArea(lat, long) async {
    double distanceInMeter = Geolocator.distanceBetween(-7.9899, 112.6273, lat, long);
    return (distanceInMeter <= 34) ? true : false;
  }

  static BoxShadow shadow({double x = 1}) {
    return BoxShadow(color: Styles.shadowGrey, offset: const Offset(0, 0), blurRadius: Const.BLUR_RADIUS * x);
  }

  static BoxShadow shadow2({double x = 1}) {
    return BoxShadow(color: Styles.shadowGrey, offset: const Offset(0, 4), blurRadius: Const.BLUR_RADIUS * x);
  }
}
