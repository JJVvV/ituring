import 'package:html/parser.dart' show parse;
import 'package:ituring/http/http_manager.dart';

class HomeRepository {
  static Future<dynamic> getHome() async {
    Map<String, dynamic> result = await httpManager.request('/Page/Home');
    // var data = $BookHomeDataEntityFromJson(result);
    return result;
  }

  static Future<dynamic> getTags() async {
    Map<String, dynamic> result = await httpManager.request(
        '/Page/EditableArea?editableareaname=%E7%83%AD%E9%97%A8%E6%A0%87%E7%AD%BE');
    var document = parse(result['content']);
    List<Map<String, String>> tags =
        document.querySelectorAll('[tagid]').map((item) {
      return {'id': item.attributes['tagid']!, 'name': item.innerHtml};
    }).toList();

    return tags;
  }
}
