import 'package:html/parser.dart' show parse;
import 'package:ituring/http/api.dart';
import 'package:ituring/http/http_manager.dart';

class HomeRepository {
  static Future<dynamic> getHome() async {
    Map<String, dynamic> result = await httpManager.request(Api.GET_HOME);
    // var data = $BookHomeDataEntityFromJson(result);
    return result;
  }

  static Future<dynamic> getTags() async {
    Map<String, dynamic> result = await httpManager.request(Api.GET_HOME_TAGS);
    var document = parse(result['content']);
    List<Map<String, String>> tags =
        document.querySelectorAll('[tagid]').map((item) {
      return {'id': item.attributes['tagid']!, 'name': item.innerHtml};
    }).toList();

    return tags;
  }
}
