import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/src/map/flutter_map_state.dart';
import 'dart:convert';
import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/component/widget/toast_widget.dart';
import 'package:sas/model/location.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sas/routes/routes.dart';
import 'package:sas/utils/utils.dart';

class CAbsenDatang extends GetxController {
  final store = GetStorage();
  final loc = Location().obs;
  final mapController = MapController();
  DateTime date = DateTime.now();

  Future<void> getLivePosition() async {
    bool serviceEnabled;
    LocationPermission permission = await Geolocator.checkPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print("Logitude: " + currentPosition.longitude.toString());
      print("Latitude: " + currentPosition.latitude.toString());
      loc.update((val) {
        loc.value.latitude = currentPosition.latitude;
        loc.value.longitude = currentPosition.longitude;
        mapController.move(LatLng(loc.value.latitude, loc.value.longitude), mapController.zoom);
      });
      getDistanceRadius();
    }
  }

  Future<void> insertHadir() async {
    bool onSchoolArea = await Utils.onSchoolArea(loc.value.latitude, loc.value.longitude);
    bool canAbsen = true;
    String status = 'H';
    if (onSchoolArea) {
      Utils.onTimeHadir(DateTime.now()) ? status = 'H' : status = 'HT';
      try {
        String uri = "https://sasapi.000webhostapp.com/api/kehadirans/";
        var res = await http.post(Uri.parse(uri), body: {
          'NIS': '065',
          'WAKTU': DateFormat("y-MM-d H:m:s").format(date),
          'LOKASI': '${loc.value.latitude}, ${loc.value.longitude}',
          'STATUS': 'H',
          // 'ID_KETERANGAN': 'null'
        });
        var response = jsonDecode(res.body);
        if (response["success"] == true) {
          print('terkirim ${response}');
          Get.defaultDialog(
              backgroundColor: Colors.white,
              buttonColor: Colors.white,
              title: 'Success!',
              middleText: 'Presensi anda berhasil terkirim! Lihat Histori untuk lebih lengkapnya.',
              middleTextStyle: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 14),
              textConfirm: 'OK',
              onConfirm: () {
                Get.toNamed(Routes.dashboard);
              },
              radius: 15);
        } else if (response["success"] == false) {
          Get.defaultDialog(
              backgroundColor: Colors.white,
              buttonColor: Colors.white,
              title: 'Error',
              titleStyle: const TextStyle(color: Colors.red, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 20),
              middleText: 'Anda telah melakukan absensi',
              middleTextStyle: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 14),
              textConfirm: 'OK',
              onConfirm: () {
                Get.toNamed(Routes.dashboard);
              },
              radius: 15);
        } else {
          ToastWidget.showToast(type: ToastWidgetType.ERROR, message: 'Error');
          print('false ${e}');
        }
      } catch (e) {
        ToastWidget.showToast(type: ToastWidgetType.ERROR, message: 'Periksa Jaringan Internet Anda. ${e}');
      }
    } else {
      canAbsen = false;
      Get.defaultDialog(
          backgroundColor: Colors.white,
          buttonColor: Colors.white,
          title: 'Error',
          titleStyle: const TextStyle(color: Colors.red, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 20),
          middleText: 'Anda berada di luar area',
          middleTextStyle: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 14),
          textConfirm: 'OK',
          onConfirm: () {
            Get.toNamed(Routes.dashboard);
          },
          radius: 15);
    }
  }

  Future<void> getDistanceRadius() async {
    double distanceInMeters = Geolocator.distanceBetween(-7.9899, 112.6273, loc.value.latitude, loc.value.longitude);
    loc.update((val) {
      loc.value.distance = distanceInMeters;
    });
    print(distanceInMeters);
  }

  @override
  void onInit() async {
    getLivePosition();
    super.onInit();
  }
}
