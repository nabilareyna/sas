import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:sas/model/location.dart';

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
      print("Logitude: " + currentPosition.longitude.toString());
      print("Latitude: " + currentPosition.latitude.toString());
      store.write('latitude', currentPosition.latitude);
      store.write('longitude', currentPosition.latitude);
      loc.update((val) {
        loc.value.latitude = currentPosition.latitude;
        loc.value.longitude = currentPosition.longitude;
        mapController.move(LatLng(loc.value.latitude, loc.value.longitude), mapController.zoom);
      });
    }
  }

  void setStore() {
    store.write('latitude', loc.value.latitude);
    store.write('longitude', loc.value.longitude);
  }

  @override
  void onInit() async {
    getCurrentPosition();
    super.onInit();
  }
}
