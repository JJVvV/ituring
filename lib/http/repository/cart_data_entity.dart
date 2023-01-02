import 'dart:convert';

import 'package:ituring/generated/json/base/json_field.dart';
import 'package:ituring/generated/json/cart_data_entity.g.dart';

@JsonSerializable()
class CartDataEntity {
  int? addressId;
  bool? addressIsValid;
  int? couponId;
  String? couponCode;
  dynamic couponMessage;
  bool? couponCodeIsValid;
  bool? redeemIsValid;
  int? redeemPoints;
  int? maxRedeemPoints;
  List<dynamic>? validCartItems;
  List<CartDataInvalidCartItems>? invalidCartItems;
  double? totalPrice;
  double? totalBestPrice;
  double? orderDiscountedPrice;
  double? totalCouponDiscountedPrice;
  double? totalDiscountedPrice;
  double? freight;
  double? totalToPay;
  int? totalReturnedPoints;
  bool? agreed;
  bool? agreeInvalid;
  double? freightValidPrice;
  String? digest;

  CartDataEntity();

  factory CartDataEntity.fromJson(Map<String, dynamic> json) =>
      $CartDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $CartDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CartDataInvalidCartItems {
  int? bookId;
  String? bookName;
  String? bookIsbn;
  int? edition;
  double? bestPrice;
  double? price;
  int? quantity;
  String? cover;
  int? bookSaleType;
  int? bookSaleTypeId;

  CartDataInvalidCartItems();

  factory CartDataInvalidCartItems.fromJson(Map<String, dynamic> json) =>
      $CartDataInvalidCartItemsFromJson(json);

  Map<String, dynamic> toJson() => $CartDataInvalidCartItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
