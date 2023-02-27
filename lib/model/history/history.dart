class History {
  String? nis;
  int? status;
  int? bulan;

  History({
    required this.nis,
    required this.status,
    required this.bulan,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nis': nis,
      'status': status,
      'bulan': bulan,
    };
  }

  static History fromJson(Map<String, dynamic> json) {
    return History(
      nis: json['nis'],
      status: json['status'],
      bulan: json['bulan'],
    );
  }
}
