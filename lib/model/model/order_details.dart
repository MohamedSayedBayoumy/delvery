class OrderById {
  final String message;
  final bool status;
  final OrderDataDetails data;

  OrderById({required this.message, required this.status, required this.data});

  factory OrderById.fromJson(Map<String, dynamic> json) {
    return OrderById(
      message: json['message'],
      status: json['status'],
      data: OrderDataDetails.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data.toJson(),
    };
  }
}

class OrderDataDetails {
  final String id;
  final int itemNumber;
  final int dinnerType;
  final int status;
  final int serviceType;
  final String userName;
  final String userPhone;
  final String userLatitude;
  final String userLongitude;
  final String providerLatitude;
  final String providerLongitude;
  final String providerName;
  final String providerPhone;
  final String providerImage;
  final double discountValue;
  final double discountFinalValue;
  final bool hasDiscount;
  final List<Product> products;
  final Map<String, dynamic> giftProduct; // Empty object in your JSON
  final List<dynamic> orderChat; // Empty array in your JSON
  final String appFees;
  final String vatValue;
  final String subTotalPrice;
  final String shippingCharges;
  final String totalPrice;
  final String totalRequiredPrice;
  final String usedWalletPrice;
  final String orderedDate;
  final String createdAt;

  OrderDataDetails({
    required this.id,
    required this.itemNumber,
    required this.dinnerType,
    required this.status,
    required this.serviceType,
    required this.userName,
    required this.userPhone,
    required this.userLatitude,
    required this.userLongitude,
    required this.providerLatitude,
    required this.providerLongitude,
    required this.providerName,
    required this.providerPhone,
    required this.providerImage,
    required this.discountValue,
    required this.discountFinalValue,
    required this.hasDiscount,
    required this.products,
    required this.giftProduct,
    required this.orderChat,
    required this.appFees,
    required this.vatValue,
    required this.subTotalPrice,
    required this.shippingCharges,
    required this.totalPrice,
    required this.totalRequiredPrice,
    required this.usedWalletPrice,
    required this.orderedDate,
    required this.createdAt,
  });

  factory OrderDataDetails.fromJson(Map<String, dynamic> json) {
    return OrderDataDetails(
      id: json['_id'] ?? "",
      itemNumber: json['item_number'] ?? 999999,
      dinnerType: json['dinner_type'] ?? 9999999,
      status: json['status'] ?? 99999999,
      serviceType: json['service_type'] ?? 99999999,
      userName: json['user_name'] ?? "",
      userPhone: json['user_phone'] ?? "",
      userLatitude: json['user_latitude'],
      userLongitude: json['user_longitude'],
      providerLatitude: json['provider_latitude'] ?? "",
      providerLongitude: json['provider_longitude'] ?? "",
      providerName: json['provider_name'] ?? "",
      providerPhone: json['provider_phone'] ?? "",
      providerImage: json['provider_image'] ?? "",
      discountValue: json['discount_value'].toDouble() ?? 0.0,
      discountFinalValue: json['discount_final_value'].toDouble() ?? 0.0,
      hasDiscount: json['has_discount'] ?? false,
      products: (json['products'] as List<dynamic>)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList(),
      giftProduct: json['gift_product'] ?? {},
      orderChat: json['order_chat'] ?? [],
      appFees: json['app_fees'] ?? "",
      vatValue: json['vat_value'] ?? "",
      subTotalPrice: json['sub_total_price'] ?? "",
      shippingCharges: json['shipping_charges'] ?? "",
      totalPrice: json['total_price'] ?? "",
      totalRequiredPrice: json['total_required_price'] ?? "",
      usedWalletPrice: json['used_wallet_price'] ?? "",
      orderedDate: json['ordered_date'] ?? "",
      createdAt: json['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_number': itemNumber,
      'dinner_type': dinnerType,
      'status': status,
      'service_type': serviceType,
      'user_name': userName,
      'user_phone': userPhone,
      'user_latitude': userLatitude,
      'user_longitude': userLongitude,
      'provider_latitude': providerLatitude,
      'provider_longitude': providerLongitude,
      'provider_name': providerName,
      'provider_phone': providerPhone,
      'provider_image': providerImage,
      'discount_value': discountValue,
      'discount_final_value': discountFinalValue,
      'has_discount': hasDiscount,
      'products': products.map((product) => product.toJson()).toList(),
      'gift_product': giftProduct,
      'order_chat': orderChat,
      'app_fees': appFees,
      'vat_value': vatValue,
      'sub_total_price': subTotalPrice,
      'shipping_charges': shippingCharges,
      'total_price': totalPrice,
      'total_required_price': totalRequiredPrice,
      'used_wallet_price': usedWalletPrice,
      'ordered_date': orderedDate,
      'created_at': createdAt,
    };
  }
}

class Product {
  final String id;
  final String title;
  final String image;
  final double totalRate;
  final String selectedSize;
  final String selectedSizePriceBeforeDiscount;
  final String selectedSizePriceAfterDiscount;
  final String priceAfterDiscount;
  final int orderedQuantity;
  final List<dynamic> extras;
  final List<dynamic> types;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.totalRate,
    required this.selectedSize,
    required this.selectedSizePriceBeforeDiscount,
    required this.selectedSizePriceAfterDiscount,
    required this.priceAfterDiscount,
    required this.orderedQuantity,
    required this.extras,
    required this.types,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      totalRate: json['total_rate'].toDouble(),
      selectedSize: json['selected_size'],
      selectedSizePriceBeforeDiscount:
          json['selected_size_price_before_discount'],
      selectedSizePriceAfterDiscount:
          json['selected_size_price_after_discount'],
      priceAfterDiscount: json['price_after_discount'],
      orderedQuantity: json['ordered_quantity'],
      extras: json['extras'],
      types: json['types'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'total_rate': totalRate,
      'selected_size': selectedSize,
      'selected_size_price_before_discount': selectedSizePriceBeforeDiscount,
      'selected_size_price_after_discount': selectedSizePriceAfterDiscount,
      'price_after_discount': priceAfterDiscount,
      'ordered_quantity': orderedQuantity,
      'extras': extras,
      'types': types,
    };
  }
}
