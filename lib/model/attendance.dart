import 'package:geolocator/geolocator.dart';

class Attendance {
  int? id;
  String nis;
  DateTime waktu;
  Geolocator geolocator;
  int status;
  Attendance({this.id, required this.nis, required this.waktu, required this.status, required this.geolocator});
}
