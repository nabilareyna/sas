import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/form_izin/controller/c_form_izin.dart';
import 'package:sas/module/form_izin/widget/w_button_form_izin.dart';
import 'package:sas/module/form_izin/widget/w_datepicker_mulai.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIFormIzin extends GetView<CFormIzin> {
  final _formKey = GlobalKey<FormState>();
  UIFormIzin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pengajuan Izin', style: Styles.appBarTitle),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Styles.secondaryColor,
            ),
            onPressed: () => Get.toNamed(Routes.dashboard),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            controller: ScrollController(),
            child: Stack(
              // key: _fromkey,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pilih Jenis Izin :',
                          style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
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
                            children: [
                              Expanded(
                                  child: DropdownButton(
                                // elevation: 10,
                                value: controller.ketIzin[controller.noKetIzin.hashCode],
                                isDense: true,
                                isExpanded: true,
                                onChanged: (String? value) {
                                  controller.noKetIzin = controller.ketIzin.indexOf(value ?? "").obs;
                                },
                                items: controller.ketIzin.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                style: const TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 1),
                                dropdownColor: const Color(0xFFE7EFF1),
                                hint: const Text(
                                  'Pilih...',
                                  style: TextStyle(
                                    color: Color(0xFFA3A3A3),
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                underline: const SizedBox(),
                                icon: const Icon(Icons.expand_more),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tanggal Izin',
                          style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
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
                                  padding: const EdgeInsets.only(bottom: 8),
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
                    const Gap(15),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jangka Waktu Izin',
                          style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  '* Dihitung tanpa hari Sabtu dan Minggu',
                                  style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
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
                                padding: const EdgeInsets.only(left: 0, right: 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SpinBox(
                                        min: 1,
                                        max: 14,
                                        value: 1,
                                        onChanged: (value) {
                                          controller.jmlIzin = value.toInt().obs;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Keterangan',
                          style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
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
                    // const Gap(160),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                    ),
                    InkWell(
                      child: const WButtonFormIzin(),
                      onTap: () {
                        if (controller.keterangan.text.isEmpty) {
                          print('Keterangan is required');
                        } else {
                          controller.insertIzin(controller.keterangan.text);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
