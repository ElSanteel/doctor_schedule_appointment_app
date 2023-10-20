class UserProfileModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  UserProfileModel({this.message, this.data, this.status, this.code});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    status = json["status"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["status"] = status;
    _data["code"] = code;
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  Data({this.id, this.name, this.email, this.phone, this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["gender"] = gender;
    return _data;
  }
}
