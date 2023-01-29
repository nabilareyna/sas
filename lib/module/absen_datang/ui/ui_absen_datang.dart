import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/module/absen_datang/controller/c_absen_datang.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppThemes.dart';
import 'package:sas/utils/const.dart';

class UIAbsenDatang extends GetView<CAbsenDatang> {
  const UIAbsenDatang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            options: MapOptions(center: LatLng(49.5, -0.09), zoom: 10.0),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      width: 100.0,
                      height: 100.0,
                      point: LatLng(49.5, -0.09),
                      builder: (ctx) => Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ))
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
                    Text('Tanggal dan Jam'),
                    Text(
                      DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
