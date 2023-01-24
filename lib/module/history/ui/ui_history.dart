import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/dashboard/controller/c_page_view.dart';
import 'package:sas/module/history/controller/c_history.dart';
import 'package:sas/module/history/widget/absent_summary.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class UIHistory extends GetView<CHistory> {
  UIHistory({Key? key}) : super(key: key);

  final pageC = Get.find<CPgeView>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Histori Presensi', style: Styles.appBarTitle),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Styles.secondaryColor,
              ),
              onPressed: () => Get.toNamed(Routes.dashboard),
            ),
          ),
          body: Padding(
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
                  width: Get.width,
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
                              value: controller.selectedValue,
                              onChanged: (newValue) {
                                controller.selectedValue = newValue.toString();
                                controller.update();
                                print(newValue);
                              },
                              items: controller.items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList())
                        ],
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Periode',
                              style:
                                  TextStyle(color: Styles.secondaryColor, fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1)),
                          DropdownButton(
                              elevation: 10,
                              value: controller.selectedValue,
                              onChanged: (newValue) {
                                controller.selectedValue = newValue.toString();
                                controller.update();
                                print(newValue);
                              },
                              items: controller.items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList())
                        ],
                      )
                    ],
                  ),
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [AbsentSummary(), AbsentSummary()],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: ('Home')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    size: 30,
                  ),
                  label: ('History')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    size: 30,
                  ),
                  label: ('Profile')),
            ],
            currentIndex: pageC.pageIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int i) => pageC.changePage(i),
          ),
        ));
  }
}
