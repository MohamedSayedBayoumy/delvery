class RegisterParamModel {
  String? phoneNumber;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  RegisterParamModel({
    this.phoneNumber = "",
    this.name = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
  });

  RegisterParamModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    confirmPassword = json['confirm_password'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    return data;
  }
}
