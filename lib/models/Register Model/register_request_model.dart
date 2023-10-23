class RegisterRequestModel {
  String name;
  String email;
  String phone;
  int gender;
  String password;
  String passwordConfirmation;

  RegisterRequestModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      required this.password,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "password": password,
      "password_confirmation": passwordConfirmation
    };
  }
}
