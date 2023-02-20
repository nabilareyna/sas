class LoginRequestModel {
  String? nama;
  String? pass;

  LoginRequestModel({this.nama, this.pass});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = nama;
    data['pass'] = pass;
    return data;
  }
}
