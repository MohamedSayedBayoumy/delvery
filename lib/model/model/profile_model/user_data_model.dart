class UserDataModel {
  String? message;
  bool? status;
  Data? data;

  UserDataModel({this.message, this.status, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  int? itemNumber;
  String? name;
  String? email;
  String? carType;
  String? carNumber;
  String? licenseNumber;
  String? phoneNumber;
  String? firebaseToken;
  String? currentLanguage;
  String? personalPhoto;
  String? idImage;
  String? licenseImage;
  int? status;
  int? onlineStatus;
  String? createdAt;

  Data(
      {this.id,
      this.itemNumber,
      this.name,
      this.email,
      this.carType,
      this.carNumber,
      this.licenseNumber,
      this.phoneNumber,
      this.firebaseToken,
      this.currentLanguage,
      this.personalPhoto,
      this.idImage,
      this.licenseImage,
      this.status,
      this.onlineStatus,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemNumber = json['item_number'];
    name = json['name'];
    email = json['email'];
    carType = json['car_type'];
    carNumber = json['car_number'];
    licenseNumber = json['license_number'];
    phoneNumber = json['phone_number'];
    firebaseToken = json['firebase_token'];
    currentLanguage = json['current_language'];
    personalPhoto = json['personal_photo'];
    idImage = json['id_image'];
    licenseImage = json['license_image'];
    status = json['status'];
    onlineStatus = json['online_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item_number'] = itemNumber;
    data['name'] = name;
    data['email'] = email;
    data['car_type'] = carType;
    data['car_number'] = carNumber;
    data['license_number'] = licenseNumber;
    data['phone_number'] = phoneNumber;
    data['firebase_token'] = firebaseToken;
    data['current_language'] = currentLanguage;
    data['personal_photo'] = personalPhoto;
    data['id_image'] = idImage;
    data['license_image'] = licenseImage;
    data['status'] = status;
    data['online_status'] = onlineStatus;
    data['created_at'] = createdAt;
    return data;
  }
}
