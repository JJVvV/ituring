import 'package:ituring/generated/json/cart_data_entity.g.dart';
import 'package:ituring/http/http_manager.dart';
import 'package:ituring/http/repository/cart_data_entity.dart';

class CartRepository {
  static Future<CartDataEntity?> getCart() async {
    try {
      var resultJson = await httpManager.request('/Cart');
      var result = $CartDataEntityFromJson(resultJson);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
