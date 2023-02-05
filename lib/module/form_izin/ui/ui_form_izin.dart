import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sas/module/form_izin/controller/c_form_izin.dart';
import 'package:sas/module/form_izin/widget/w_button_form_izin.dart';
import 'package:sas/module/form_izin/widget/w_datepicker_mulai.dart';
import 'package:sas/module/form_izin/widget/w_datepicker_selesai.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';

class UIFormIzin extends GetView<CFormIzin> {
  const UIFormIzin({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 5),
            child: Text(
              'Pilih Jenis Izin :',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
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
                      value: controller.selectedValue.value,
                      isDense: true,
                      isExpanded: true,
                      onChanged: (String? value) =>
                          controller.selectedValue.value = value,
                      items: controller.items
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          letterSpacing: 1),
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
          const Padding(
            padding: EdgeInsets.only(top: 95),
            child: WDatePickerMulai(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 145),
            child: WDatePickerSelesai(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 195),
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
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: Row(
                  children: const [
                    ImageIcon(
                      AssetImage('../assets/icons/upload.png'),
                    ),
                    Gap(10),
                    Text(
                      'Upload Surat Izin',
                      style: TextStyle(
                        color: Color(0xFFA3A3A3),
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 390),
            child: InkWell(
              child: const WButtonFormIzin(),
              onTap: () {
                Get.toNamed(Routes.getDashboardRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
