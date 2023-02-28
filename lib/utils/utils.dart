class Utils {
  static bool onTimeHadir(DateTime time) {
    final startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      6,
      00,
    );
    final endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      7,
      00,
    );
    if (time.isAfter(startTime) && time.isBefore(endTime)) return true;
    return false;
  }

  static bool onTimePulang(DateTime time) {
    final startTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      15,
      15,
    );
    final endTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      18,
      0,
    );
    if (time.isAfter(startTime) && time.isBefore(endTime)) return true;
    return false;
  }
}
