class ChangeStatusModel {
  String? message;
  bool? status;
  Data? data;

  ChangeStatusModel({this.message, this.status, this.data});

  ChangeStatusModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? providerId;
  String? waitedProviderId;
  String? userId;
  List<UserAddress>? userAddress;
  String? userLongitude;
  String? userLatitude;
  int? itemNumber;
  List<Products>? products;
  double? subTotalPrice;
  double? shippingCharges;
  int? vatValue;
  int? appFees;
  double? totalPrice;
  double? totalRequiredPrice;
  int? usedWalletPrice;
  bool? hasDiscount;
  int? discountValue;
  int? discountFinalValue;
  int? status;
  int? orderType;
  int? dinnerType;
  int? serviceType;
  String? orderedDate;
  String? paymentMethod;
  List<dynamic>? messages;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? bookedDeliveryManId;

  Data(
      {this.sId,
      this.providerId,
      this.waitedProviderId,
      this.userId,
      this.userAddress,
      this.userLongitude,
      this.userLatitude,
      this.itemNumber,
      this.products,
      this.subTotalPrice,
      this.shippingCharges,
      this.vatValue,
      this.appFees,
      this.totalPrice,
      this.totalRequiredPrice,
      this.usedWalletPrice,
      this.hasDiscount,
      this.discountValue,
      this.discountFinalValue,
      this.status,
      this.orderType,
      this.dinnerType,
      this.serviceType,
      this.orderedDate,
      this.paymentMethod,
      this.messages,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.bookedDeliveryManId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    providerId = json['provider_id'];
    waitedProviderId = json['waited_provider_id'];
    userId = json['user_id'];
    if (json['user_address'] != null) {
      userAddress = <UserAddress>[];
      json['user_address'].forEach((v) {
        userAddress!.add(UserAddress.fromJson(v));
      });
    }
    userLongitude = json['user_longitude'];
    userLatitude = json['user_latitude'];
    itemNumber = json['item_number'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    subTotalPrice = json['sub_total_price'];
    shippingCharges = json['shipping_charges'];
    vatValue = json['vat_value'];
    appFees = json['app_fees'];
    totalPrice = json['total_price'];
    totalRequiredPrice = json['total_required_price'];
    usedWalletPrice = json['used_wallet_price'];
    hasDiscount = json['has_discount'];
    discountValue = json['discount_value'];
    discountFinalValue = json['discount_final_value'];
    status = json['status'];
    orderType = json['order_type'];
    dinnerType = json['dinner_type'];
    serviceType = json['service_type'];
    orderedDate = json['ordered_date'];
    paymentMethod = json['payment_method'];
    if (json['messages'] != null) {
      messages = <Null>[];
      json['messages'].forEach((v) {
        messages!.add(v.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
    bookedDeliveryManId = json['booked_delivery_man_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['provider_id'] = providerId;
    data['waited_provider_id'] = waitedProviderId;
    data['user_id'] = userId;
    if (userAddress != null) {
      data['user_address'] = userAddress!.map((v) => v.toJson()).toList();
    }
    data['user_longitude'] = userLongitude;
    data['user_latitude'] = userLatitude;
    data['item_number'] = itemNumber;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['sub_total_price'] = subTotalPrice;
    data['shipping_charges'] = shippingCharges;
    data['vat_value'] = vatValue;
    data['app_fees'] = appFees;
    data['total_price'] = totalPrice;
    data['total_required_price'] = totalRequiredPrice;
    data['used_wallet_price'] = usedWalletPrice;
    data['has_discount'] = hasDiscount;
    data['discount_value'] = discountValue;
    data['discount_final_value'] = discountFinalValue;
    data['status'] = status;
    data['order_type'] = orderType;
    data['dinner_type'] = dinnerType;
    data['service_type'] = serviceType;
    data['ordered_date'] = orderedDate;
    data['payment_method'] = paymentMethod;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    data['booked_delivery_man_id'] = bookedDeliveryManId;
    return data;
  }
}

class UserAddress {
  Title? title;
  String? sId;

  UserAddress({this.title, this.sId});

  UserAddress.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['_id'] = sId;
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ar'] = ar;
    return data;
  }
}

class Products {
  String? productId;
  int? quantity;
  String? selectedSize;
  String? selectedSizePriceBeforeDiscount;
  String? selectedSizePriceAfterDiscount;
  List<dynamic>? types;
  List<dynamic>? extras;
  double? buyingPrice;
  String? sId;

  Products(
      {this.productId,
      this.quantity,
      this.selectedSize,
      this.selectedSizePriceBeforeDiscount,
      this.selectedSizePriceAfterDiscount,
      this.types,
      this.extras,
      this.buyingPrice,
      this.sId});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    selectedSize = json['selected_size'];
    selectedSizePriceBeforeDiscount =
        json['selected_size_price_before_discount'];
    selectedSizePriceAfterDiscount = json['selected_size_price_after_discount'];
    if (json['types'] != null) {
      types = <Null>[];
      json['types'].forEach((v) {
        types!.add(v.fromJson(v));
      });
    }
    if (json['extras'] != null) {
      extras = <Null>[];
      json['extras'].forEach((v) {
        extras!.add(v.fromJson(v));
      });
    }
    buyingPrice = json['buying_price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['selected_size'] = selectedSize;
    data['selected_size_price_before_discount'] =
        selectedSizePriceBeforeDiscount;
    data['selected_size_price_after_discount'] = selectedSizePriceAfterDiscount;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (extras != null) {
      data['extras'] = extras!.map((v) => v.toJson()).toList();
    }
    data['buying_price'] = buyingPrice;
    data['_id'] = sId;
    return data;
  }
}
