import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/module/absen_pulang/controller/c_absen_pulang.dart';
import 'package:sas/module/izin_pulang/controller/c_izin_pulang.dart';
import 'package:sas/module/izin_pulang/ui/ui_izin_pulang.dart';
import 'package:sas/module/absen_pulang/widget/w_button_izinpulang.dart';
import 'package:sas/module/absen_pulang/widget/w_card_absen_pulang.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class UIAbsenPulang extends GetView<CAbsenPulang> {
  const UIAbsenPulang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Absen Pulang', style: Styles.appBarTitle),
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
          FlutterMap(
            options: MapOptions(center: LatLng(49.5, -0.09), zoom: 10.0),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      width: 100.0,
                      height: 100.0,
                      point: LatLng(49.5, -0.09),
                      builder: (ctx) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ))
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(Const.parentMargin()),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Const.parentMargin(x: 1.5)),
                        topRight: Radius.circular(Const.parentMargin(x: 1.5)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal dan Jam',
                      style: Styles.absenPageHeading,
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        Text(
                          DateFormat("y-MM-d H:m:s")
                              .format(controller.datePulang),
                          style: Styles.absenPageSubHeading,
                        ),
                      ],
                    ),
                    const Gap(6),
                    Text(
                      'Lokasi',
                      style: Styles.absenPageHeading,
                    ),
                    const Gap(4),
                    Text(
                      'SMKN 4 Malang',
                      style: Styles.absenPageSubHeading,
                    ),
                    const Gap(6),
                    Text(
                      'Radius',
                      style: Styles.absenPageHeading,
                    ),
                    const Gap(4),
                    Text(
                      '0 - 172.77 m (566.84 ft)',
                      style: Styles.absenPageSubHeading,
                    ),
                    const Gap(6),
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  color: DateFormat.H().format(DateTime.now()).hashCode < 15
                      ? Styles.yellowColor
                      : Styles.primaryColor,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                      vertical: Const.parentMargin(x: 0.7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          DateFormat.H().format(DateTime.now()).hashCode < 15
                              ? "Izin Pulang"
                              : "Submit",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 2))
                    ],
                  ),
                ),
                onTap: () {
                  // if()
                  // Get.toNamed(Routes.izinpulang);
                  DateFormat.H().format(DateTime.now()).hashCode < 15
                      ? Get.toNamed(Routes.izinpulang)
                      : controller.insertPulang();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
