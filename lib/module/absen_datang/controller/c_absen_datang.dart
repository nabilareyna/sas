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
import 'package:sas/model/location.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sas/routes/routes.dart';

class CAbsenDatang extends GetxController {
  final store = GetStorage();
  double recentLat = 0;
  double recentLong = 0;
  double recentDistanceInMeters = 0;
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

        getDistanceRadius();
      });
    }
  }

  Future<void> insertHadir() async {
    getLivePosition();
    try {
      String uri = "http://10.0.2.2:8000/api/kehadirans/";
      var res = await http.post(Uri.parse(uri), body: {
        'NIS': '065',
        'WAKTU': DateFormat("y-MM-d H:m:s").format(date),
        'LOKASI': '${loc.value.latitude}, ${loc.value.longitude}',
        'STATUS': 'h',
        'ID_KETERANGAN': 'null'
      });
      var response = jsonDecode(res.body);
      if (response["success"] == true) {
        print('terkirim ${response}');
        Get.defaultDialog(
            backgroundColor: Colors.white,
            buttonColor: Colors.white,
            title: 'Success!',
            middleText: 'Presensi anda berhasil terkirim! Lihat Histori untuk lebih lengkapnya.',
            textConfirm: 'OK',
            onConfirm: () {
              Get.toNamed(Routes.dashboard);
            },
            radius: 15);
      } else {
        print('false ${e}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDistanceRadius() async {
    double distanceInMeters = Geolocator.distanceBetween(-7.9889465, 112.62731, loc.value.latitude, loc.value.longitude);
    loc.update((val) {
      loc.value.distance = distanceInMeters;
    });
    print(distanceInMeters);
  }

  Future<double> getRecentDistanceRadius() async {
    recentDistanceInMeters = Geolocator.distanceBetween(-7.9889465, 112.62731, recentLat, recentLong);
    return recentDistanceInMeters;
  }

  double readRecentStoreLat() {
    recentLat = store.read('latitude');
    return recentLat;
  }

  double readRecentStoreLong() {
    recentLong = store.read('longitude');
    return recentLong;
  }

  @override
  void onInit() async {
    readRecentStoreLat();
    readRecentStoreLong();
    getRecentDistanceRadius();
    super.onInit();
  }
}
