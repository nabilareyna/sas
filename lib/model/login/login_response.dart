class LoginResponseModel {
  String? token;
  String? body;

  LoginResponseModel({this.token, this.body});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    body = json['body'];
  }
}
