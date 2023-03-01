import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/izin_pulang/controller/c_izin_pulang.dart';
import 'package:sas/module/izin_pulang/widget/w_button_izin_pulang.dart';
import 'package:sas/module/izin_pulang/controller/c_izin_pulang.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/component/widget/toast_widget.dart';


class UIIzinPulang extends GetView<CIzinPulang> {
  final _formKey = GlobalKey<FormState>();
  UIIzinPulang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pengajuan Izin Pulang', style: Styles.appBarTitle),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Styles.secondaryColor,
          ),
          onPressed: () => Get.toNamed(Routes.absenpulang),
        ),
      ),
      body: Stack(
        // key: _fromkey,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 15, right: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tanggal Izin',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7EFF1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextField(
                              controller: controller.tanggalIzin,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xFFA3A3A3),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const ImageIcon(
                          AssetImage('assets/icons/datepicker.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keterangan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE7EFF1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              controller: controller.keterangan,
                              maxLines: 4,
                              keyboardType: TextInputType.multiline,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: 'Keterangan',
                                hintStyle: TextStyle(
                                  color: Color(0xFFA3A3A3),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(330),
              InkWell(
                child: const WButtonFormIzin(),
                onTap: () {
                  if (controller.keterangan.text.isEmpty) {
                    ToastWidget.showToast(
                        type: ToastWidgetType.ERROR,
                        message: 'Keterangan tidak boleh kosong');
                  } else {
                    controller.insertIzinPulang(controller.keterangan.text);
                  }
                  // Get.toNamed(Routes.getDashboardRoute());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
