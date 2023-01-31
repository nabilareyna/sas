// import 'dart:html';

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
import 'package:sas/module/history/widget/history_card.dart';
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
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Const.parentMargin(),
                  vertical: Const.parentMargin(x: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Styles.secondaryGreyColor),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: Const.siblingMargin(x: 4),
                        vertical: Const.siblingMargin(x: 3.5)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jumlah',
                              style: TextStyle(
                                  color: Styles.secondaryColor,
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1),
                            ),
                            DropdownButton(
                              elevation: 10,
                              value: controller.selectedValue.value,
                              onChanged: (String? value) =>
                                  controller.selectedValue.value = value,
                              items: controller.items
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: 1),
                              isDense: true,
                              hint: const Text('Pilih...'),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.expand_more),
                            )
                          ],
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Periode',
                                style: TextStyle(
                                    color: Styles.secondaryColor,
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1)),
                            DropdownButton(
                              elevation: 10,
                              value: controller.selectedValue.value,
                              onChanged: (String? value) =>
                                  controller.selectedValue.value = value,
                              items: controller.items
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text(e)))
                                  .toList(),
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  letterSpacing: 1),
                              isDense: true,
                              hint: const Text('Pilih...'),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.expand_more),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AbsentSummary(
                        title: 'Jumlah Izin',
                      ),
                      AbsentSummary(
                        title: 'Tanpa Keterangan',
                      )
                    ],
                  ),
                  const Gap(30),
                  HistoryCard()
                ],
              ),
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
