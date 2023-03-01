import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/model/location.dart';
import 'package:sas/utils/utils.dart';

class CDashboard extends GetxController {
  final store = GetStorage();
  final loc = Location().obs;
  final mapController = MapController();

  Future<void> getCurrentPosition() async {
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
      loc.update((val) async {
        loc.value.latitude = currentPosition.latitude;
        loc.value.longitude = currentPosition.longitude;
        loc.value.isOnArea = await Utils.onSchoolArea(currentPosition.latitude, currentPosition.longitude);
        mapController.move(LatLng(loc.value.latitude, loc.value.longitude), mapController.zoom);
      });
    }
  }

  @override
  void onInit() async {
    getCurrentPosition();
    super.onInit();
  }
}
