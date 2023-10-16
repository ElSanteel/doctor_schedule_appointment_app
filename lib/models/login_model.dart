class LoginModel {
  String? message;
  List<dynamic>? data;
  bool? status;
  int? code;

  LoginModel({this.message, this.data, this.status, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <dynamic>[];
      json['data'].forEach((v) {
        data!.add(v);
      });
    }
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}
