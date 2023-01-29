import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/component/widget/scaffold_widget.dart';
import 'package:sas/module/dashboard/controller/c_page_view.dart';
import 'package:sas/module/history/controller/c_history.dart';
import 'package:sas/module/history/widget/absent_summary.dart';
import 'package:sas/module/history/widget/history_card.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class UIHistory extends GetView<CHistory> {
  UIHistory({Key? key}) : super(key: key);

  final pageC = Get.find<CPgeView>();

  @override
  Widget build(BuildContext context) {
    return WScaffold(
      title: 'History Presensi',
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Styles.secondaryColor,
        ),
        onPressed: () => Get.toNamed(Routes.dashboard),
      ),
      body: (context, orientation, platform) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Const.parentMargin(), vertical: Const.parentMargin(x: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Styles.secondaryGreyColor),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: Const.siblingMargin(x: 4), vertical: Const.siblingMargin(x: 3.5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jumlah',
                          style: TextStyle(color: Styles.secondaryColor, fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1),
                        ),
                        DropdownButton(
                          elevation: 10,
                          value: controller.selectedValue.value,
                          onChanged: (String? value) => controller.selectedValue.value = value,
                          items: controller.items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 1),
                          isDense: true,
                          hint: Text('Pilih...'),
                          underline: SizedBox(),
                          icon: Icon(Icons.expand_more),
                        )
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Periode',
                            style: TextStyle(color: Styles.secondaryColor, fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1)),
                        DropdownButton(
                          elevation: 10,
                          value: controller.selectedValue.value,
                          onChanged: (String? value) => controller.selectedValue.value = value,
                          items: controller.items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 1),
                          isDense: true,
                          hint: Text('Pilih...'),
                          underline: SizedBox(),
                          icon: Icon(Icons.expand_more),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(30),
              SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AbsentSummary(
                      title: 'Jumlah Izin',
                    ),
                    AbsentSummary(
                      title: 'Tanpa Keterangan',
                    )
                  ],
                ),
              ),
              Gap(30),
              HistoryCard()
            ],
          ),
        );
      },
    );
  }
}
