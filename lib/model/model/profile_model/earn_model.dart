class EarnTimeModel {
  String? message;
  bool? status;
  List<Data>? data;

  EarnTimeModel({this.message, this.status, this.data});

  EarnTimeModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Id? iId;
  double? totalAmount;

  Data({this.iId, this.totalAmount});

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['totalAmount'] = totalAmount;
    return data;
  }
}

class Id {
  int? day;
  int? month;
  int? year;

  Id({this.day, this.month, this.year});

  Id.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['month'] = month;
    data['year'] = year;
    return data;
  }
}
