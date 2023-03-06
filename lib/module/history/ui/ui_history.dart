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
        return SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Const.parentMargin(), vertical: Const.parentMargin(x: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Styles.secondaryGreyColor),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: Const.siblingMargin(x: 4), vertical: Const.siblingMargin(x: 3.5)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bulan',
                            style: TextStyle(color: Styles.secondaryColor, fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1),
                          ),
                          DropdownButton(
                            elevation: 10,
                            // onTap: (() {
                            //   print(controller.nilaiBulans);
                            // }),
                            value: controller.bulans[controller.nilaiBulans.hashCode],
                            onChanged: (String? value) {
                              controller.nilaiBulans = controller.bulans.indexOf(value ?? "").obs;
                              print(controller.nilaiBulans);
                              controller.getJmlHistori();
                              controller.getHistori();
                            },
                            items: controller.bulans.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                            style: const TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 1),
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
                          Text('Status',
                              style:
                                  TextStyle(color: Styles.secondaryColor, fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1)),
                          DropdownButton(
                            elevation: 10,
                            // value: controller.selectedValueStatus.value,
                            // onChanged: (String? value) =>
                            //     controller.selectedValueStatus.value = value,
                            value: controller.status[controller.nilaiStatus.hashCode],
                            onChanged: (String? value) {
                              controller.nilaiStatus = controller.status.indexOf(value ?? "").obs;
                              print(controller.nilaiStatus.hashCode);
                              controller.getHistori();
                            },
                            items: controller.status.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                            style: const TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 1),
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
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AbsentSummary(
                        title: 'Jumlah Hadir',
                        jumlah: controller.jmlHadir.value,
                      ),
                      AbsentSummary(
                        title: 'Jumlah Izin',
                        // jumlah: int.parse(controller.jmlIzin.toString()),
                        jumlah: controller.jmlIzin.value,
                      )
                    ],
                  ),
                ),
                const Gap(30),
                Container(
                  child: controller.loadingHistori.isTrue
                      ? Column(
                          children: const [
                            CircularProgressIndicator(),
                            Gap(15),
                            Text(
                              'Memuat history....',
                              style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w100),
                            )
                          ],
                        )
                      : Expanded(
                           child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.histori.length,
                              itemBuilder: (context, index) {
                                DateTime jsonWaktu = DateTime.parse(controller.histori[index]['WAKTU'] + '.000');
                                int noBulan = int.parse(controller.histori[index]['WAKTU'].substring(5, 7));
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: Const.siblingMargin(x: 2)),
                                  child: HistoryCard(
                                    controller.histori[index]['STATUS'],
                                    controller.histori[index]['LOKASI'],
                                    jsonWaktu,
                                    controller.bulans[noBulan],
                                    // controller.bulans[]
                                  ),
                                );
                              }),
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
