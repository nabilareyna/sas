import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class AbsentSummary extends StatelessWidget {
  final String title;
  const AbsentSummary({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 195,
      padding: EdgeInsets.symmetric(vertical: Const.siblingMargin(x: 3)),
      decoration: BoxDecoration(
          border: Border.all(color: Styles.secondaryGreyColor), borderRadius: BorderRadius.circular(Const.siblingMargin(x: 2)), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(Const.siblingMargin(x: 2)),
            child: Image.asset(
              '../assets/icons/notes.png',
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0', style: TextStyle(fontFamily: 'Inter', fontSize: 26, fontWeight: FontWeight.w700)),
              Text(title, style: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w400))
            ],
          )
        ],
      ),
    );
  }
}
