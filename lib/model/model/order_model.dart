class OrderModel {
  String? message;
  bool? status;
  OrderData? data;

  OrderModel({this.message, this.status, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? OrderData.fromJson(json['data']) : null;
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

class OrderData {
  int? currentPage;
  int? pages;
  int? count;
  List<OrderData>? data;

  OrderData(
      {this.currentPage = 99999999,
      this.pages = 99999999,
      this.count = 99999999,
      this.data = const []});

  OrderData.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    pages = json['pages'];
    count = json['count'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(OrderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['pages'] = pages;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  int? status;
  int? itemNumber;
  int? dinnerType;
  String? providerId;
  String? providerImage;
  String? parentProviderImage;
  List<UserAddress>? userAddress;
  List<Products>? products;
  int? serviceType;
  String? appFees;
  String? vatValue;
  String? subTotalPrice;
  String? shippingCharges;
  String? totalPrice;
  String? createdAt;

  Data({
    this.id = "",
    this.status = 9999999999999,
    this.itemNumber = 9999999999999,
    this.dinnerType = 9999999999999,
    this.providerId = "",
    this.providerImage = "",
    this.parentProviderImage = "",
    this.userAddress = const [],
    this.products = const [],
    this.serviceType = 999999999,
    this.appFees = "",
    this.vatValue = "",
    this.subTotalPrice = "",
    this.shippingCharges = "",
    this.totalPrice = "",
    this.createdAt = "",
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    itemNumber = json['item_number'];
    dinnerType = json['dinner_type'];
    providerId = json['provider_id'];
    providerImage = json['provider_image'];
    parentProviderImage = json['parent_provider_image'];
    if (json['user_address'] != null) {
      userAddress = <UserAddress>[];
      json['user_address'].forEach((v) {
        userAddress!.add(UserAddress.fromJson(v));
      });
    }
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
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['item_number'] = itemNumber;
    data['dinner_type'] = dinnerType;
    data['provider_id'] = providerId;
    data['provider_image'] = providerImage;
    data['parent_provider_image'] = parentProviderImage;
    if (userAddress != null) {
      data['user_address'] = userAddress!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['service_type'] = serviceType;
    data['app_fees'] = appFees;
    data['vat_value'] = vatValue;
    data['sub_total_price'] = subTotalPrice;
    data['shipping_charges'] = shippingCharges;
    data['total_price'] = totalPrice;
    data['created_at'] = createdAt;
    return data;
  }
}

class UserAddress {
  String? id;
  String? title;

  UserAddress({this.id, this.title});

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class Products {
  String? id;
  String? image;
  String? selectedSize;
  String? selectedSizePriceBeforeDiscount;
  String? selectedSizePriceAfterDiscount;
  String? priceAfterDiscount;
  int? orderedQuantity;
  List<dynamic>? extras;
  List<dynamic>? types;

  Products({
    this.id = "",
    this.image = "",
    this.selectedSize = "",
    this.selectedSizePriceBeforeDiscount = "",
    this.selectedSizePriceAfterDiscount = "",
    this.priceAfterDiscount = "",
    this.orderedQuantity = 9999999999,
    this.extras = const [],
    this.types = const [],
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
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
    data['image'] = image;
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
