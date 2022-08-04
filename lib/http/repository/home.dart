import 'package:ituring/http/api.dart';
import 'package:ituring/http/http_manager.dart';

class HomeRepository {
  static Future<dynamic> getHome() async {
    Map<String, dynamic> result = await httpManager.request(Api.GET_HOME);
    return result;
  }
}
