class RegisterResponseModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  RegisterResponseModel({this.message, this.data, this.status, this.code});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? name;
  List<String>? email;
  List<String>? phone;
  List<String>? gender;
  List<String>? password;

  Data({this.name, this.email, this.phone, this.gender, this.password});

  Data.fromJson(Map<String, dynamic> json) {
    name = json["name"] == null ? null : List<String>.from(json["name"]);
    email = json["email"] == null ? null : List<String>.from(json["email"]);
    phone = json["phone"] == null ? null : List<String>.from(json["phone"]);
    gender = json["gender"] == null ? null : List<String>.from(json["gender"]);
    password =
        json["password"] == null ? null : List<String>.from(json["password"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (name != null) {
      _data["name"] = name;
    }
    if (email != null) {
      _data["email"] = email;
    }
    if (phone != null) {
      _data["phone"] = phone;
    }
    if (gender != null) {
      _data["gender"] = gender;
    }
    if (password != null) {
      _data["password"] = password;
    }
    return _data;
  }
}
