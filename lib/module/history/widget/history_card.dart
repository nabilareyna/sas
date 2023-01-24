import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(vertical: Const.siblingMargin(x: 5), horizontal: Const.siblingMargin(x: 1.5)),
              decoration: BoxDecoration(
                  color: Styles.greenColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(Const.siblingMargin(x: 1.5)), bottomLeft: Radius.circular(Const.siblingMargin(x: 1.5)))),
            ),
            Gap(25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('JAN',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.3, color: Styles.secondaryColor)),
                Gap(5),
                Text('10', style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.3, color: Colors.black))
              ],
            ),
            Gap(18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Selasa', style: TextStyle(fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.3, color: Colors.black)),
                Gap(3),
                Text(
                  '06.45 WIB',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 2, color: Colors.black),
                ),
                Gap(3),
                Text(
                  'Dalam Kawasan Sekolah',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Gap(3),
                Text(
                  'Tepat Waktu',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 11, fontWeight: FontWeight.w500, color: Styles.greenColor),
                ),
              ],
            )
          ],
        ));
  }
}
