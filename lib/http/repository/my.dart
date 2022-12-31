import 'package:ituring/generated/json/profile_data_entity.g.dart';
import 'package:ituring/http/http_manager.dart';
import 'package:ituring/http/repository/profile_data_entity.dart';

class MyRepository {
  static Future<ProfileDataEntity?> getProfile() async {
    try {
      var resultJson = await httpManager.request('/User/Profile');
      var result = $ProfileDataEntityFromJson(resultJson);
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
