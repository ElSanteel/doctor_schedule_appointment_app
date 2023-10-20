class RegisterRequestModel {
  String name;
  String email;
  String phone;
  String gender;
  String password;
  String pasword_confirmation;

  RegisterRequestModel(this.name, this.email, this.phone, this.gender,
      this.password, this.pasword_confirmation);

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
