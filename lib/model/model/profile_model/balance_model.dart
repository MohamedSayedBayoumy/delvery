class TotalBalanceModel {
  String? message;
  bool? status;
  TotalBalanceData? data;

  TotalBalanceModel({this.message, this.status, this.data});

  TotalBalanceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? TotalBalanceData.fromJson(json['data']) : null;
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

class TotalBalanceData {
  int? totalPrice;

  TotalBalanceData({this.totalPrice});

  TotalBalanceData.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_price'] = totalPrice;
    return data;
  }
}
