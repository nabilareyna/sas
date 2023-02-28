import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class AbsentSummary extends StatelessWidget {
  final String title;
  final int jumlah;
  const AbsentSummary({Key? key, this.title = '', this.jumlah = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Const.siblingMargin(x: 3), horizontal: Const.siblingMargin(x: 4)),
      decoration: BoxDecoration(
          border: Border.all(color: Styles.secondaryGreyColor),
          borderRadius: BorderRadius.circular(Const.siblingMargin(x: 2)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0, 0.1), blurRadius: 4, spreadRadius: 0)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(Const.siblingMargin(x: 2)),
            child: Image.asset(
              'assets/icons/notes.png',
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(jumlah.toString(), style: TextStyle(fontFamily: 'Inter', fontSize: 26, fontWeight: FontWeight.w700)),
              Text(
                title,
                style: TextStyle(fontFamily: 'Roboto', fontSize: 10, fontWeight: FontWeight.w400),
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
