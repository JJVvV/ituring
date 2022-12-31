import 'package:ituring/generated/json/books_data_entity.g.dart';
import 'package:ituring/http/http_manager.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';
import 'package:ituring/http/repository/books_data_entity.dart';

class BooksTag {
  final String value;
  final String label;
  BooksTag(this.label, this.value);
}

class BooksParams {
  final String sort;
  final int page;
  String? tag;
  String? tab;

  BooksParams({
    required this.sort,
    required this.page,
    this.tag,
    this.tab,
  });

  Map<String, dynamic> toMap() {
    return {
      "sort": sort,
      "page": page,
      if (tag != null) "tag": tag,
      if (tab != null) "tab": tab,
    };
  }
}

class AuthorData {
  final String name;
  AuthorData({required this.name});
}

class BookData {
  final int id;
  final String name;
  final List<AuthorData> authors;
  final String coverKey;

  BookData({
    required this.id,
    required this.name,
    required this.authors,
    required this.coverKey,
  });
}

class Pagination {
  final bool hasNextPage;
  final bool hasPreviousPage;
  final int pageCount;
  final int pageNumber;
  final int totalItemCount;

  Pagination({
    required this.hasPreviousPage,
    required this.pageCount,
    required this.pageNumber,
    required this.totalItemCount,
    required this.hasNextPage,
  });
}

class BooksData {
  final List<BookData> bookItems;
  final Pagination pagination;
  BooksData({
    required this.bookItems,
    required this.pagination,
  });
}

class BooksRepository {
  static Future<BooksDataEntity?> getBooks(Map<String, dynamic> data) async {
    try {
      var resultJson = await httpManager.request('/Book', data: data);
      var result = $BooksDataEntityFromJson(resultJson);
      return result;
    } catch (e) {
      print(e);
    }
  }

  static Future<BookDetailDataEntity?> getBook(
      Map<String, dynamic> data) async {
    try {
      var result = await httpManager.request('/Book/${data['id']}');
      return BookDetailDataEntity.fromJson(result);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<BooksTag>> getTags() async {
    List<BooksTag> tabs = [
      BooksTag('全部', 'all'),
      BooksTag('纸质书', 'book'),
      BooksTag('电子书', 'ebook'),
      BooksTag('我的收藏', 'fav'),
      BooksTag('每周特价', 'tejia'),
      BooksTag('预售', 'Presale'),
      BooksTag('免费', 'free'),
      BooksTag('诚征记者', 'translator'),
      BooksTag('可兑换', 'gift'),
    ];
    return tabs;
  }
}
