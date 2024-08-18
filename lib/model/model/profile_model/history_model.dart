class HistoryModel {
  String? message;
  bool? status;
  HistoryDataModel? historyDataModel;

  HistoryModel({this.message, this.status, this.historyDataModel});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    historyDataModel =
        json['data'] != null ? HistoryDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (historyDataModel != null) {
      data['data'] = historyDataModel!.toJson();
    }
    return data;
  }
}

class HistoryDataModel {
  int? currentPage;
  int? pages;
  int? count;
  List<DataDetails>? dataDetails;

  HistoryDataModel(
      {this.currentPage, this.pages, this.count, this.dataDetails});

  HistoryDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    pages = json['pages'];
    count = json['count'];
    if (json['data'] != null) {
      dataDetails = <DataDetails>[];
      json['data'].forEach((v) {
        dataDetails!.add(DataDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['pages'] = pages;
    data['count'] = count;
    if (dataDetails != null) {
      data['data'] = dataDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDetails {
  String? id;
  int? status;
  String? userName;
  String? userPhone;
  int? itemNumber;
  int? dinnerType;
  String? providerId;
  String? providerName;
  String? providerPhone;
  String? providerLatitude;
  String? providerLongitude;
  String? providerImage;
  String? parentProviderImage;
  String? userLatitude;
  String? userLongitude;
  List<Products>? products;
  int? serviceType;
  String? appFees;
  String? vatValue;
  String? subTotalPrice;
  String? shippingCharges;
  String? totalPrice;
  String? totalRequiredPrice;
  String? usedWalletPrice;
  String? paymentMethod;
  List<UserAddress>? userAddress;
  String? orderedDate;
  String? createdAt;

  DataDetails({
    this.id = "",
    this.status = 9099999,
    this.userName = "",
    this.userPhone = "",
    this.itemNumber = 9999999999,
    this.dinnerType = 9999999999,
    this.providerId = "",
    this.providerName = "",
    this.providerPhone = "",
    this.providerLatitude = "",
    this.providerLongitude = "",
    this.providerImage = "",
    this.parentProviderImage = "",
    this.userLatitude = "",
    this.userLongitude = "",
    this.products = const [],
    this.serviceType = 9999999999,
    this.appFees = "",
    this.vatValue = "",
    this.subTotalPrice = "",
    this.shippingCharges = "",
    this.totalPrice = "",
    this.totalRequiredPrice = "",
    this.usedWalletPrice = "",
    this.paymentMethod = "",
    this.userAddress = const [],
    this.orderedDate = "",
    this.createdAt,
  });

  DataDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    itemNumber = json['item_number'];
    dinnerType = json['dinner_type'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    providerPhone = json['provider_phone'];
    providerLatitude = json['provider_latitude'];
    providerLongitude = json['provider_longitude'];
    providerImage = json['provider_image'];
    parentProviderImage = json['parent_provider_image'];
    userLatitude = json['user_latitude'];
    userLongitude = json['user_longitude'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    serviceType = json['service_type'];
    appFees = json['app_fees'];
    vatValue = json['vat_value'];
    subTotalPrice = json['sub_total_price'];
    shippingCharges = json['shipping_charges'];
    totalPrice = json['total_price'];
    totalRequiredPrice = json['total_required_price'];
    usedWalletPrice = json['used_wallet_price'];
    paymentMethod = json['payment_method'];
    if (json['user_address'] != null) {
      userAddress = <UserAddress>[];
      json['user_address'].forEach((v) {
        userAddress!.add(UserAddress.fromJson(v));
      });
    }
    orderedDate = json['ordered_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['user_name'] = userName;
    data['user_phone'] = userPhone;
    data['item_number'] = itemNumber;
    data['dinner_type'] = dinnerType;
    data['provider_id'] = providerId;
    data['provider_name'] = providerName;
    data['provider_phone'] = providerPhone;
    data['provider_latitude'] = providerLatitude;
    data['provider_longitude'] = providerLongitude;
    data['provider_image'] = providerImage;
    data['parent_provider_image'] = parentProviderImage;
    data['user_latitude'] = userLatitude;
    data['user_longitude'] = userLongitude;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }

    data['service_type'] = serviceType;
    data['app_fees'] = appFees;
    data['vat_value'] = vatValue;
    data['sub_total_price'] = subTotalPrice;
    data['shipping_charges'] = shippingCharges;
    data['total_price'] = totalPrice;
    data['total_required_price'] = totalRequiredPrice;
    data['used_wallet_price'] = usedWalletPrice;
    data['payment_method'] = paymentMethod;
    if (userAddress != null) {
      data['user_address'] = userAddress!.map((v) => v.toJson()).toList();
    }
    data['ordered_date'] = orderedDate;
    data['created_at'] = createdAt;
    return data;
  }
}

class Products {
  String? id;
  String? title;
  String? image;
  int? totalRate;
  String? selectedSize;
  String? selectedSizePriceBeforeDiscount;
  String? selectedSizePriceAfterDiscount;
  String? priceAfterDiscount;
  int? orderedQuantity;
  List<dynamic>? extras;
  List<dynamic>? types;

  Products(
      {this.id,
      this.title,
      this.image,
      this.totalRate,
      this.selectedSize,
      this.selectedSizePriceBeforeDiscount,
      this.selectedSizePriceAfterDiscount,
      this.priceAfterDiscount,
      this.orderedQuantity,
      this.extras,
      this.types});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    totalRate = json['total_rate'];
    selectedSize = json['selected_size'];
    selectedSizePriceBeforeDiscount =
        json['selected_size_price_before_discount'];
    selectedSizePriceAfterDiscount = json['selected_size_price_after_discount'];
    priceAfterDiscount = json['price_after_discount'];
    orderedQuantity = json['ordered_quantity'];
    if (json['extras'] != null) {
      extras = <Null>[];
      json['extras'].forEach((v) {
        extras!.add(v.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Null>[];
      json['types'].forEach((v) {
        types!.add(v.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['total_rate'] = totalRate;
    data['selected_size'] = selectedSize;
    data['selected_size_price_before_discount'] =
        selectedSizePriceBeforeDiscount;
    data['selected_size_price_after_discount'] = selectedSizePriceAfterDiscount;
    data['price_after_discount'] = priceAfterDiscount;
    data['ordered_quantity'] = orderedQuantity;
    if (extras != null) {
      data['extras'] = extras!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAddress {
  String? id;
  String? title;

  UserAddress({
    this.id = "",
    this.title = "",
  });

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    title = json['title'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
