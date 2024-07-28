class AuthParamModel {
  String? phoneNumber;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  AuthParamModel({
    this.phoneNumber = "",
    this.name = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });

  AuthParamModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    confirmPassword = json['confirm_password'] ?? "";
  }

  Map<String, dynamic> registerToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    return data;
  }

  Map<String, dynamic> loginToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
