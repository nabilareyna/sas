import 'dart:html';

import 'package:get/get.dart';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/model/location.dart';

class CAbsenDatang extends GetxController {
  late double latitude = -7.9889465;
  late double longitude = 112.6278706;
  final loc = Location().obs;

  void getCurrentPosition() async {
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
        val!.latitude = currentPosition.latitude;
        val.longitude = currentPosition.longitude;
      });
    }
  }
}
