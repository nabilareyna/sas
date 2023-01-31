import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/component/widget/scaffold_widget.dart';
import 'package:sas/module/dashboard/controller/c_dashboard.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';

class UIDashboard extends GetView<CDashboard> {
  const UIDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return WScaffold(
      body: (context, orientation, platform) {
        return Stack(
          children: [
            Container(
                height: 227.0,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFF61A2BE),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/images/logosastul.png',
                    alignment: Alignment.topCenter,
                  ),
                )),
            Padding(
              padding:
                  const EdgeInsets.only(right: 15.0, left: 15.0, top: 80.0),
              child: SizedBox(
                height: 227.0,
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          DateFormat("EEEE, d MMMM yyyy")
                              .format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      Text(
                        DateFormat.Hm().format(DateTime.now()),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF978F8F),
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.absendatang);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 58,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1CC16B),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        ImageIcon(
                                          AssetImage('assets/icons/enter.png'),
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 9),
                                    child: Column(
                                      children: const [
                                        Text(
                                          'Absen Datang',
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.absenpulang);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 63,
                                      height: 58,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFE85C5C),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 6),
                                            child: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/logout.png'),
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 9),
                                      child: Column(
                                        children: const [
                                          Text('Absen Pulang',
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.pengajuanizin);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 63,
                                    height: 58,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF327EF0),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 1),
                                          child: ImageIcon(
                                            AssetImage('assets/icons/clip.png'),
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 9),
                                    child: Column(
                                      children: const [
                                        Text('Izin',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 34, left: 34, top: 320),
              child: SizedBox(
                height: 96,
                width: size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF61A2BE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 11),
                        child: Text(
                          'Waktu Presensi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      Text(
                        'Jam masuk 05.30 - 07.00 WIB',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        'Jam pulang 15.15 - 17.00 WIB',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 430),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ImageIcon(
                    AssetImage('assets/icons/greencircle.png'),
                    size: 13.0,
                    color: Color(0xFF1CC16B),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Anda berada dalam jangkauan lokasi titik absensi',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 455),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: const BoxDecoration(),
                child: FlutterMap(
                  options: MapOptions(center: LatLng(49.5, -0.09), zoom: 10.0),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
              ),
            ),
          ],
        );
      },
    );
  }
}
