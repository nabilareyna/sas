import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sas/module/history/controller/c_history.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:sas/routes/routes.dart';

import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class HistoryCard extends StatelessWidget {
  String status, lokasi, bulan;
  DateTime waktu;
  // bulan;
  HistoryCard(this.status, this.lokasi, this.waktu, this.bulan);
  // const HistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Styles.secondaryGreyColor),
          borderRadius: BorderRadius.circular(
            Const.siblingMargin(x: 1.5),
          ),
        ),
        height: 108,
        width: size.width,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: Const.siblingMargin(x: 5),
                  horizontal: Const.siblingMargin(x: 1.5)),
              decoration: BoxDecoration(
                  color:
                      // status == 'H' && int.parse(waktu.substring(11, 13)) > 07.00
                      status == 'H'
                          ? Styles.yellowColor
                          : status == 'P' || status == 'H'
                              ? Styles.greenColor
                              : status == 'I' || status == 'S'
                                  ? Styles.primaryColor
                                  : Styles.redColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Const.siblingMargin(x: 1.5)),
                      bottomLeft:
                          Radius.circular(Const.siblingMargin(x: 1.5)))),
            ),
            Gap(25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bulan,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                        color: Styles.secondaryColor)),
                Gap(5),
                Text(DateFormat('d').format(waktu),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                        color: Colors.black))
              ],
            ),
            Gap(18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat('EEEE').format(waktu),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                        color: Colors.black)),
                Gap(3),
                Text(
                  DateFormat.Hm().format(waktu) + ' WIB',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                      color: Colors.black),
                ),
                Gap(3),
                Text(
                  'Dalam Kawasan Sekolah',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Gap(3),
                Text(
                  // status == 'H' && int.parse(waktu.substring(11, 13)) > 07.00
                  status == 'H'
                      ? 'Terlambat'
                      : status == 'P'
                          ? 'Absen pulang'
                          : status == 'H'
                              ? 'Absen datang'
                              : status == 'I'
                                  ? 'Izin'
                                  : status == 'S'
                                      ? 'Sakit'
                                      : '',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Styles.greenColor),
                ),
              ],
            )
          ],
        ));
  }
}
