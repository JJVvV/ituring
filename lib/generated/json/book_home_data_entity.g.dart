import 'package:ituring/generated/json/base/json_convert_content.dart';
import 'package:ituring/http/repository/book_home_data_entity.dart';

BookHomeDataEntity $BookHomeDataEntityFromJson(Map<String, dynamic> json) {
  final BookHomeDataEntity bookHomeDataEntity = BookHomeDataEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataEntity.name = name;
  }
  final List<BookHomeDataBlockContents>? blockContents = jsonConvert
      .convertListNotNull<BookHomeDataBlockContents>(json['blockContents']);
  if (blockContents != null) {
    bookHomeDataEntity.blockContents = blockContents;
  }
  final List<BookHomeDataOnPublishBooks>? onPublishBooks = jsonConvert
      .convertListNotNull<BookHomeDataOnPublishBooks>(json['onPublishBooks']);
  if (onPublishBooks != null) {
    bookHomeDataEntity.onPublishBooks = onPublishBooks;
  }
  return bookHomeDataEntity;
}

Map<String, dynamic> $BookHomeDataEntityToJson(BookHomeDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['blockContents'] = entity.blockContents?.map((v) => v.toJson()).toList();
  data['onPublishBooks'] =
      entity.onPublishBooks?.map((v) => v.toJson()).toList();
  return data;
}

BookHomeDataBlockContents $BookHomeDataBlockContentsFromJson(
    Map<String, dynamic> json) {
  final BookHomeDataBlockContents bookHomeDataBlockContents =
      BookHomeDataBlockContents();
  final int? blockContentType =
      jsonConvert.convert<int>(json['blockContentType']);
  if (blockContentType != null) {
    bookHomeDataBlockContents.blockContentType = blockContentType;
  }
  final int? tagType = jsonConvert.convert<int>(json['tagType']);
  if (tagType != null) {
    bookHomeDataBlockContents.tagType = tagType;
  }
  final BookHomeDataBlockContentsTag? tag =
      jsonConvert.convert<BookHomeDataBlockContentsTag>(json['tag']);
  if (tag != null) {
    bookHomeDataBlockContents.tag = tag;
  }
  final BookHomeDataBlockContentsEditableArea? editableArea = jsonConvert
      .convert<BookHomeDataBlockContentsEditableArea>(json['editableArea']);
  if (editableArea != null) {
    bookHomeDataBlockContents.editableArea = editableArea;
  }
  final List<dynamic>? banners =
      jsonConvert.convertListNotNull<dynamic>(json['banners']);
  if (banners != null) {
    bookHomeDataBlockContents.banners = banners;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookHomeDataBlockContents.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataBlockContents.name = name;
  }
  final bool? showMore = jsonConvert.convert<bool>(json['showMore']);
  if (showMore != null) {
    bookHomeDataBlockContents.showMore = showMore;
  }
  final dynamic? url = jsonConvert.convert<dynamic>(json['url']);
  if (url != null) {
    bookHomeDataBlockContents.url = url;
  }
  final dynamic? cssClass = jsonConvert.convert<dynamic>(json['cssClass']);
  if (cssClass != null) {
    bookHomeDataBlockContents.cssClass = cssClass;
  }
  final int? displayMode = jsonConvert.convert<int>(json['displayMode']);
  if (displayMode != null) {
    bookHomeDataBlockContents.displayMode = displayMode;
  }
  return bookHomeDataBlockContents;
}

Map<String, dynamic> $BookHomeDataBlockContentsToJson(
    BookHomeDataBlockContents entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blockContentType'] = entity.blockContentType;
  data['tagType'] = entity.tagType;
  data['tag'] = entity.tag?.toJson();
  data['editableArea'] = entity.editableArea?.toJson();
  data['banners'] = entity.banners;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['showMore'] = entity.showMore;
  data['url'] = entity.url;
  data['cssClass'] = entity.cssClass;
  data['displayMode'] = entity.displayMode;
  return data;
}

BookHomeDataBlockContentsTag $BookHomeDataBlockContentsTagFromJson(
    Map<String, dynamic> json) {
  final BookHomeDataBlockContentsTag bookHomeDataBlockContentsTag =
      BookHomeDataBlockContentsTag();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookHomeDataBlockContentsTag.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataBlockContentsTag.name = name;
  }
  final List<BookHomeDataBlockContentsTagBookItems>? bookItems =
      jsonConvert.convertListNotNull<BookHomeDataBlockContentsTagBookItems>(
          json['bookItems']);
  if (bookItems != null) {
    bookHomeDataBlockContentsTag.bookItems = bookItems;
  }
  final List<dynamic>? articleItems =
      jsonConvert.convertListNotNull<dynamic>(json['articleItems']);
  if (articleItems != null) {
    bookHomeDataBlockContentsTag.articleItems = articleItems;
  }
  final List<dynamic>? userItems =
      jsonConvert.convertListNotNull<dynamic>(json['userItems']);
  if (userItems != null) {
    bookHomeDataBlockContentsTag.userItems = userItems;
  }
  return bookHomeDataBlockContentsTag;
}

Map<String, dynamic> $BookHomeDataBlockContentsTagToJson(
    BookHomeDataBlockContentsTag entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['bookItems'] = entity.bookItems?.map((v) => v.toJson()).toList();
  data['articleItems'] = entity.articleItems;
  data['userItems'] = entity.userItems;
  return data;
}

BookHomeDataBlockContentsTagBookItems
    $BookHomeDataBlockContentsTagBookItemsFromJson(Map<String, dynamic> json) {
  final BookHomeDataBlockContentsTagBookItems
      bookHomeDataBlockContentsTagBookItems =
      BookHomeDataBlockContentsTagBookItems();
  final List<dynamic>? authors =
      jsonConvert.convertListNotNull<dynamic>(json['authors']);
  if (authors != null) {
    bookHomeDataBlockContentsTagBookItems.authors = authors;
  }
  final List<dynamic>? translators =
      jsonConvert.convertListNotNull<dynamic>(json['translators']);
  if (translators != null) {
    bookHomeDataBlockContentsTagBookItems.translators = translators;
  }
  final String? authorNameString =
      jsonConvert.convert<String>(json['authorNameString']);
  if (authorNameString != null) {
    bookHomeDataBlockContentsTagBookItems.authorNameString = authorNameString;
  }
  final String? translatorNameString =
      jsonConvert.convert<String>(json['translatorNameString']);
  if (translatorNameString != null) {
    bookHomeDataBlockContentsTagBookItems.translatorNameString =
        translatorNameString;
  }
  final String? bookStatus = jsonConvert.convert<String>(json['bookStatus']);
  if (bookStatus != null) {
    bookHomeDataBlockContentsTagBookItems.bookStatus = bookStatus;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookHomeDataBlockContentsTagBookItems.id = id;
  }
  final String? coverKey = jsonConvert.convert<String>(json['coverKey']);
  if (coverKey != null) {
    bookHomeDataBlockContentsTagBookItems.coverKey = coverKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataBlockContentsTagBookItems.name = name;
  }
  final String? isbn = jsonConvert.convert<String>(json['isbn']);
  if (isbn != null) {
    bookHomeDataBlockContentsTagBookItems.isbn = isbn;
  }
  final String? xAbstract = jsonConvert.convert<String>(json['abstract']);
  if (xAbstract != null) {
    bookHomeDataBlockContentsTagBookItems.xAbstract = xAbstract;
  }
  final List<BookHomeDataBlockContentsTagBookItemsBookEditionPrices>?
      bookEditionPrices = jsonConvert.convertListNotNull<
              BookHomeDataBlockContentsTagBookItemsBookEditionPrices>(
          json['bookEditionPrices']);
  if (bookEditionPrices != null) {
    bookHomeDataBlockContentsTagBookItems.bookEditionPrices = bookEditionPrices;
  }
  return bookHomeDataBlockContentsTagBookItems;
}

Map<String, dynamic> $BookHomeDataBlockContentsTagBookItemsToJson(
    BookHomeDataBlockContentsTagBookItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['authors'] = entity.authors;
  data['translators'] = entity.translators;
  data['authorNameString'] = entity.authorNameString;
  data['translatorNameString'] = entity.translatorNameString;
  data['bookStatus'] = entity.bookStatus;
  data['id'] = entity.id;
  data['coverKey'] = entity.coverKey;
  data['name'] = entity.name;
  data['isbn'] = entity.isbn;
  data['abstract'] = entity.xAbstract;
  data['bookEditionPrices'] =
      entity.bookEditionPrices?.map((v) => v.toJson()).toList();
  return data;
}

BookHomeDataBlockContentsTagBookItemsBookEditionPrices
    $BookHomeDataBlockContentsTagBookItemsBookEditionPricesFromJson(
        Map<String, dynamic> json) {
  final BookHomeDataBlockContentsTagBookItemsBookEditionPrices
      bookHomeDataBlockContentsTagBookItemsBookEditionPrices =
      BookHomeDataBlockContentsTagBookItemsBookEditionPrices();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookHomeDataBlockContentsTagBookItemsBookEditionPrices.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataBlockContentsTagBookItemsBookEditionPrices.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    bookHomeDataBlockContentsTagBookItemsBookEditionPrices.key = key;
  }
  return bookHomeDataBlockContentsTagBookItemsBookEditionPrices;
}

Map<String, dynamic>
    $BookHomeDataBlockContentsTagBookItemsBookEditionPricesToJson(
        BookHomeDataBlockContentsTagBookItemsBookEditionPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookHomeDataBlockContentsEditableArea
    $BookHomeDataBlockContentsEditableAreaFromJson(Map<String, dynamic> json) {
  final BookHomeDataBlockContentsEditableArea
      bookHomeDataBlockContentsEditableArea =
      BookHomeDataBlockContentsEditableArea();
  final dynamic? name = jsonConvert.convert<dynamic>(json['name']);
  if (name != null) {
    bookHomeDataBlockContentsEditableArea.name = name;
  }
  final dynamic? content = jsonConvert.convert<dynamic>(json['content']);
  if (content != null) {
    bookHomeDataBlockContentsEditableArea.content = content;
  }
  return bookHomeDataBlockContentsEditableArea;
}

Map<String, dynamic> $BookHomeDataBlockContentsEditableAreaToJson(
    BookHomeDataBlockContentsEditableArea entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['content'] = entity.content;
  return data;
}

BookHomeDataOnPublishBooks $BookHomeDataOnPublishBooksFromJson(
    Map<String, dynamic> json) {
  final BookHomeDataOnPublishBooks bookHomeDataOnPublishBooks =
      BookHomeDataOnPublishBooks();
  final String? authorNameString =
      jsonConvert.convert<String>(json['authorNameString']);
  if (authorNameString != null) {
    bookHomeDataOnPublishBooks.authorNameString = authorNameString;
  }
  final String? translatorNameString =
      jsonConvert.convert<String>(json['translatorNameString']);
  if (translatorNameString != null) {
    bookHomeDataOnPublishBooks.translatorNameString = translatorNameString;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookHomeDataOnPublishBooks.id = id;
  }
  final String? coverKey = jsonConvert.convert<String>(json['coverKey']);
  if (coverKey != null) {
    bookHomeDataOnPublishBooks.coverKey = coverKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataOnPublishBooks.name = name;
  }
  final String? isbn = jsonConvert.convert<String>(json['isbn']);
  if (isbn != null) {
    bookHomeDataOnPublishBooks.isbn = isbn;
  }
  final dynamic? xAbstract = jsonConvert.convert<dynamic>(json['abstract']);
  if (xAbstract != null) {
    bookHomeDataOnPublishBooks.xAbstract = xAbstract;
  }
  final List<BookHomeDataOnPublishBooksBookEditionPrices>? bookEditionPrices =
      jsonConvert
          .convertListNotNull<BookHomeDataOnPublishBooksBookEditionPrices>(
              json['bookEditionPrices']);
  if (bookEditionPrices != null) {
    bookHomeDataOnPublishBooks.bookEditionPrices = bookEditionPrices;
  }
  return bookHomeDataOnPublishBooks;
}

Map<String, dynamic> $BookHomeDataOnPublishBooksToJson(
    BookHomeDataOnPublishBooks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['authorNameString'] = entity.authorNameString;
  data['translatorNameString'] = entity.translatorNameString;
  data['id'] = entity.id;
  data['coverKey'] = entity.coverKey;
  data['name'] = entity.name;
  data['isbn'] = entity.isbn;
  data['abstract'] = entity.xAbstract;
  data['bookEditionPrices'] =
      entity.bookEditionPrices?.map((v) => v.toJson()).toList();
  return data;
}

BookHomeDataOnPublishBooksBookEditionPrices
    $BookHomeDataOnPublishBooksBookEditionPricesFromJson(
        Map<String, dynamic> json) {
  final BookHomeDataOnPublishBooksBookEditionPrices
      bookHomeDataOnPublishBooksBookEditionPrices =
      BookHomeDataOnPublishBooksBookEditionPrices();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookHomeDataOnPublishBooksBookEditionPrices.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookHomeDataOnPublishBooksBookEditionPrices.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    bookHomeDataOnPublishBooksBookEditionPrices.key = key;
  }
  return bookHomeDataOnPublishBooksBookEditionPrices;
}

Map<String, dynamic> $BookHomeDataOnPublishBooksBookEditionPricesToJson(
    BookHomeDataOnPublishBooksBookEditionPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}
