import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/module/absen_datang/controller/c_absen_datang.dart';
import 'package:sas/module/absen_datang/widget/w_card_absen_datang.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class UIAbsenDatang extends GetView<CAbsenDatang> {
  const UIAbsenDatang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Absen Datang', style: Styles.appBarTitle),
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
              mapController: controller.mapController,
              options: MapOptions(
                center: LatLng(controller.loc.value.latitude, controller.loc.value.longitude),
                zoom: 16.50,
                maxZoom: 19.0,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: '© OpenStreetMap contributors',
                  onSourceTapped: () {},
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.sas.app',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(controller.loc.value.latitude, controller.loc.value.longitude),
                        builder: (ctx) => Icon(
                              Icons.location_on,
                              color: Colors.red,
                            )),
                  ],
                ),
                CircleLayer(
                  circles: [
                    CircleMarker(
                        point: LatLng(-7.9898333, 112.62731),
                        radius: 35,
                        borderColor: const Color(0xFFB71C1C),
                        color: Colors.redAccent.withOpacity(0.2),
                        borderStrokeWidth: 1,
                        useRadiusInMeter: true)
                  ],
                ),
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
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(Const.parentMargin(x: 1.5)), topRight: Radius.circular(Const.parentMargin(x: 1.5)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal dan Jam',
                        style: Styles.absenPageHeading,
                      ),
                      Gap(4),
                      Row(
                        children: [
                          Text(
                            DateFormat("d-M-yyyy" + ", ").format(DateTime.now()),
                            style: Styles.absenPageSubHeading,
                          ),
                          Text(
                            DateFormat.Hm().format(DateTime.now()),
                            style: Styles.absenPageSubHeading,
                          )
                        ],
                      ),
                      Gap(6),
                      Text(
                        'Lokasi',
                        style: Styles.absenPageHeading,
                      ),
                      Gap(4),
                      Text(
                        'SMKN 4 Malang',
                        style: Styles.absenPageSubHeading,
                      ),
                      Gap(6),
                      Text(
                        'Radius',
                        style: Styles.absenPageHeading,
                      ),
                      Gap(4),
                      Text(
                        '${controller.loc.value.distance}',
                        style: Styles.absenPageSubHeading,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => controller.getCurrentPosition(),
                  child: Container(
                    color: Styles.primaryColor,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: Const.parentMargin(x: 0.7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SUBMIT',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 2))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
