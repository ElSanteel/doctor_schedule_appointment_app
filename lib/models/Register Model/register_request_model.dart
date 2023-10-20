class RegisterRequestModel {
  String name;
  String email;
  String phone;
  String gender;
  String password;
  String pasword_confirmation;

  RegisterRequestModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.password,
      required this.pasword_confirmation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "password": password,
      "password_conformation": pasword_confirmation
    };
  }
}
