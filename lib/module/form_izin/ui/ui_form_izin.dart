import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sas/module/form_izin/controller/c_form_izin.dart';
import 'package:sas/module/form_izin/widget/w_button_form_izin.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Column(
              children: const [
                Text(
                  'Pilih Jenis Izin :',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFE7EFF1),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              // child: Row(
              //   children: [
              //     DropdownButton(
              //       elevation: 10,
              //       value: controller.selectedValue.value,
              //       onChanged: (String? value) =>
              //           controller.selectedValue.value = value,
              //       items: controller.items
              //           .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              //           .toList(),
              //       style: const TextStyle(
              //           fontFamily: 'Roboto',
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.black,
              //           letterSpacing: 1),
              //       isDense: true,
              //       hint: const Text('Pilih...'),
              //       underline: const SizedBox(),
              //       icon: const Icon(Icons.expand_more),
              //     )
              //   ],
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 300),
            child: GestureDetector(
              onTap: () {
                showDatePicker(
                    context: context,
                    locale: const Locale("id", "ID"),
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFE7EFF1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: InkWell(
          //     child: const WButtonFormIzin(),
          //     onTap: () {
          //       Get.toNamed(Routes.getDashboardRoute());
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
