import 'package:ituring/generated/json/base/json_convert_content.dart';
import 'package:ituring/http/repository/cart_data_entity.dart';

CartDataEntity $CartDataEntityFromJson(Map<String, dynamic> json) {
  final CartDataEntity cartDataEntity = CartDataEntity();
  final int? addressId = jsonConvert.convert<int>(json['addressId']);
  if (addressId != null) {
    cartDataEntity.addressId = addressId;
  }
  final bool? addressIsValid =
      jsonConvert.convert<bool>(json['addressIsValid']);
  if (addressIsValid != null) {
    cartDataEntity.addressIsValid = addressIsValid;
  }
  final int? couponId = jsonConvert.convert<int>(json['couponId']);
  if (couponId != null) {
    cartDataEntity.couponId = couponId;
  }
  final String? couponCode = jsonConvert.convert<String>(json['couponCode']);
  if (couponCode != null) {
    cartDataEntity.couponCode = couponCode;
  }
  final dynamic? couponMessage =
      jsonConvert.convert<dynamic>(json['couponMessage']);
  if (couponMessage != null) {
    cartDataEntity.couponMessage = couponMessage;
  }
  final bool? couponCodeIsValid =
      jsonConvert.convert<bool>(json['couponCodeIsValid']);
  if (couponCodeIsValid != null) {
    cartDataEntity.couponCodeIsValid = couponCodeIsValid;
  }
  final bool? redeemIsValid = jsonConvert.convert<bool>(json['redeemIsValid']);
  if (redeemIsValid != null) {
    cartDataEntity.redeemIsValid = redeemIsValid;
  }
  final int? redeemPoints = jsonConvert.convert<int>(json['redeemPoints']);
  if (redeemPoints != null) {
    cartDataEntity.redeemPoints = redeemPoints;
  }
  final int? maxRedeemPoints =
      jsonConvert.convert<int>(json['maxRedeemPoints']);
  if (maxRedeemPoints != null) {
    cartDataEntity.maxRedeemPoints = maxRedeemPoints;
  }
  final List<dynamic>? validCartItems =
      jsonConvert.convertListNotNull<dynamic>(json['validCartItems']);
  if (validCartItems != null) {
    cartDataEntity.validCartItems = validCartItems;
  }
  final List<CartDataInvalidCartItems>? invalidCartItems = jsonConvert
      .convertListNotNull<CartDataInvalidCartItems>(json['invalidCartItems']);
  if (invalidCartItems != null) {
    cartDataEntity.invalidCartItems = invalidCartItems;
  }
  final double? totalPrice = jsonConvert.convert<double>(json['totalPrice']);
  if (totalPrice != null) {
    cartDataEntity.totalPrice = totalPrice;
  }
  final double? totalBestPrice =
      jsonConvert.convert<double>(json['totalBestPrice']);
  if (totalBestPrice != null) {
    cartDataEntity.totalBestPrice = totalBestPrice;
  }
  final double? orderDiscountedPrice =
      jsonConvert.convert<double>(json['orderDiscountedPrice']);
  if (orderDiscountedPrice != null) {
    cartDataEntity.orderDiscountedPrice = orderDiscountedPrice;
  }
  final double? totalCouponDiscountedPrice =
      jsonConvert.convert<double>(json['totalCouponDiscountedPrice']);
  if (totalCouponDiscountedPrice != null) {
    cartDataEntity.totalCouponDiscountedPrice = totalCouponDiscountedPrice;
  }
  final double? totalDiscountedPrice =
      jsonConvert.convert<double>(json['totalDiscountedPrice']);
  if (totalDiscountedPrice != null) {
    cartDataEntity.totalDiscountedPrice = totalDiscountedPrice;
  }
  final double? freight = jsonConvert.convert<double>(json['freight']);
  if (freight != null) {
    cartDataEntity.freight = freight;
  }
  final double? totalToPay = jsonConvert.convert<double>(json['totalToPay']);
  if (totalToPay != null) {
    cartDataEntity.totalToPay = totalToPay;
  }
  final int? totalReturnedPoints =
      jsonConvert.convert<int>(json['totalReturnedPoints']);
  if (totalReturnedPoints != null) {
    cartDataEntity.totalReturnedPoints = totalReturnedPoints;
  }
  final bool? agreed = jsonConvert.convert<bool>(json['agreed']);
  if (agreed != null) {
    cartDataEntity.agreed = agreed;
  }
  final bool? agreeInvalid = jsonConvert.convert<bool>(json['agreeInvalid']);
  if (agreeInvalid != null) {
    cartDataEntity.agreeInvalid = agreeInvalid;
  }
  final double? freightValidPrice =
      jsonConvert.convert<double>(json['freightValidPrice']);
  if (freightValidPrice != null) {
    cartDataEntity.freightValidPrice = freightValidPrice;
  }
  final String? digest = jsonConvert.convert<String>(json['digest']);
  if (digest != null) {
    cartDataEntity.digest = digest;
  }
  return cartDataEntity;
}

Map<String, dynamic> $CartDataEntityToJson(CartDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addressId'] = entity.addressId;
  data['addressIsValid'] = entity.addressIsValid;
  data['couponId'] = entity.couponId;
  data['couponCode'] = entity.couponCode;
  data['couponMessage'] = entity.couponMessage;
  data['couponCodeIsValid'] = entity.couponCodeIsValid;
  data['redeemIsValid'] = entity.redeemIsValid;
  data['redeemPoints'] = entity.redeemPoints;
  data['maxRedeemPoints'] = entity.maxRedeemPoints;
  data['validCartItems'] = entity.validCartItems;
  data['invalidCartItems'] =
      entity.invalidCartItems?.map((v) => v.toJson()).toList();
  data['totalPrice'] = entity.totalPrice;
  data['totalBestPrice'] = entity.totalBestPrice;
  data['orderDiscountedPrice'] = entity.orderDiscountedPrice;
  data['totalCouponDiscountedPrice'] = entity.totalCouponDiscountedPrice;
  data['totalDiscountedPrice'] = entity.totalDiscountedPrice;
  data['freight'] = entity.freight;
  data['totalToPay'] = entity.totalToPay;
  data['totalReturnedPoints'] = entity.totalReturnedPoints;
  data['agreed'] = entity.agreed;
  data['agreeInvalid'] = entity.agreeInvalid;
  data['freightValidPrice'] = entity.freightValidPrice;
  data['digest'] = entity.digest;
  return data;
}

CartDataInvalidCartItems $CartDataInvalidCartItemsFromJson(
    Map<String, dynamic> json) {
  final CartDataInvalidCartItems cartDataInvalidCartItems =
      CartDataInvalidCartItems();
  final int? bookId = jsonConvert.convert<int>(json['bookId']);
  if (bookId != null) {
    cartDataInvalidCartItems.bookId = bookId;
  }
  final String? bookName = jsonConvert.convert<String>(json['bookName']);
  if (bookName != null) {
    cartDataInvalidCartItems.bookName = bookName;
  }
  final String? bookIsbn = jsonConvert.convert<String>(json['bookIsbn']);
  if (bookIsbn != null) {
    cartDataInvalidCartItems.bookIsbn = bookIsbn;
  }
  final int? edition = jsonConvert.convert<int>(json['edition']);
  if (edition != null) {
    cartDataInvalidCartItems.edition = edition;
  }
  final double? bestPrice = jsonConvert.convert<double>(json['bestPrice']);
  if (bestPrice != null) {
    cartDataInvalidCartItems.bestPrice = bestPrice;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    cartDataInvalidCartItems.price = price;
  }
  final int? quantity = jsonConvert.convert<int>(json['quantity']);
  if (quantity != null) {
    cartDataInvalidCartItems.quantity = quantity;
  }
  final String? cover = jsonConvert.convert<String>(json['cover']);
  if (cover != null) {
    cartDataInvalidCartItems.cover = cover;
  }
  final int? bookSaleType = jsonConvert.convert<int>(json['bookSaleType']);
  if (bookSaleType != null) {
    cartDataInvalidCartItems.bookSaleType = bookSaleType;
  }
  final int? bookSaleTypeId = jsonConvert.convert<int>(json['bookSaleTypeId']);
  if (bookSaleTypeId != null) {
    cartDataInvalidCartItems.bookSaleTypeId = bookSaleTypeId;
  }
  return cartDataInvalidCartItems;
}

Map<String, dynamic> $CartDataInvalidCartItemsToJson(
    CartDataInvalidCartItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bookId'] = entity.bookId;
  data['bookName'] = entity.bookName;
  data['bookIsbn'] = entity.bookIsbn;
  data['edition'] = entity.edition;
  data['bestPrice'] = entity.bestPrice;
  data['price'] = entity.price;
  data['quantity'] = entity.quantity;
  data['cover'] = entity.cover;
  data['bookSaleType'] = entity.bookSaleType;
  data['bookSaleTypeId'] = entity.bookSaleTypeId;
  return data;
}
