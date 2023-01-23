import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sas/module/dashboard/controller/c_dashboard.dart';
import 'package:sas/module/dashboard/controller/c_page_view.dart';
import 'package:sas/utils/AppLayout.dart';
import 'package:sas/utils/AppThemes.dart';

class UIDashboard extends GetView<CDashboard> {
  UIDashboard({Key? key}) : super(key: key);

  final pageC = Get.find<CPgeView>();

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              height: 227.0,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF61A2BE),
              ),
              child: Image.asset(
                '../assets/images/logosastul.png',
                alignment: Alignment.topCenter,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 40.0),
            child: SizedBox(
                height: 225.0,
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
                      Text(
                        DateFormat("EEEE, d MMMM yyyy").format(DateTime.now()),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 4.5,
                        ),
                      ),
                      Text(
                        DateFormat.Hm().format(DateTime.now()),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          height: 0.0,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 34, left: 34, top: 280),
            child: SizedBox(
              height: 120,
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
                  children: const [
                    Text(
                      'Waktu Presensi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        height: 2.3,
                      ),
                    ),
                    Text(
                      'Jam masuk 05.30 - 07.00 WIB',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 0.0,
                      ),
                    ),
                    Text(
                      'Jam pulang 15.15 - 17.00 WIB',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 15, left: 15, top: 370, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 0),
                  child:
                      Text("Anda berada dalam jangkauan lokasi titik absensi"),
                )
              ],
            ),
          ),
        ],
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
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
