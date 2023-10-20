class LoginResponseModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  LoginResponseModel({this.message, this.data, this.status, this.code});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    status = json["status"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["status"] = status;
    _data["code"] = code;
    return _data;
  }
}

class Data {
  String? token;
  String? username;

  Data({this.token, this.username});

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["username"] = username;
    return _data;
  }
}
