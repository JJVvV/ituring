import 'package:ituring/generated/json/base/json_field.dart';
import 'package:ituring/generated/json/book_home_data_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BookHomeDataEntity {

	String? name;
	List<BookHomeDataBlockContents>? blockContents;
	List<BookHomeDataOnPublishBooks>? onPublishBooks;

  BookHomeDataEntity();

  factory BookHomeDataEntity.fromJson(Map<String, dynamic> json) => $BookHomeDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataBlockContents {

	int? blockContentType;
	int? tagType;
	BookHomeDataBlockContentsTag? tag;
	BookHomeDataBlockContentsEditableArea? editableArea;
	List<dynamic>? banners;
	int? id;
	String? name;
	bool? showMore;
	dynamic url;
	dynamic cssClass;
	int? displayMode;

  BookHomeDataBlockContents();

  factory BookHomeDataBlockContents.fromJson(Map<String, dynamic> json) => $BookHomeDataBlockContentsFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataBlockContentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataBlockContentsTag {

	int? id;
	String? name;
	List<BookHomeDataBlockContentsTagBookItems>? bookItems;
	List<dynamic>? articleItems;
	List<dynamic>? userItems;

  BookHomeDataBlockContentsTag();

  factory BookHomeDataBlockContentsTag.fromJson(Map<String, dynamic> json) => $BookHomeDataBlockContentsTagFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataBlockContentsTagToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataBlockContentsTagBookItems {

	List<dynamic>? authors;
	List<dynamic>? translators;
	String? authorNameString;
	String? translatorNameString;
	String? bookStatus;
	int? id;
	String? coverKey;
	String? name;
	String? isbn;
	@JSONField(name: "abstract")
	String? xAbstract;
	List<BookHomeDataBlockContentsTagBookItemsBookEditionPrices>? bookEditionPrices;

  BookHomeDataBlockContentsTagBookItems();

  factory BookHomeDataBlockContentsTagBookItems.fromJson(Map<String, dynamic> json) => $BookHomeDataBlockContentsTagBookItemsFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataBlockContentsTagBookItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataBlockContentsTagBookItemsBookEditionPrices {

	int? id;
	String? name;
	String? key;

  BookHomeDataBlockContentsTagBookItemsBookEditionPrices();

  factory BookHomeDataBlockContentsTagBookItemsBookEditionPrices.fromJson(Map<String, dynamic> json) => $BookHomeDataBlockContentsTagBookItemsBookEditionPricesFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataBlockContentsTagBookItemsBookEditionPricesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataBlockContentsEditableArea {

	dynamic name;
	dynamic content;

  BookHomeDataBlockContentsEditableArea();

  factory BookHomeDataBlockContentsEditableArea.fromJson(Map<String, dynamic> json) => $BookHomeDataBlockContentsEditableAreaFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataBlockContentsEditableAreaToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataOnPublishBooks {

	String? authorNameString;
	String? translatorNameString;
	int? id;
	String? coverKey;
	String? name;
	String? isbn;
	@JSONField(name: "abstract")
	dynamic xAbstract;
	List<BookHomeDataOnPublishBooksBookEditionPrices>? bookEditionPrices;

  BookHomeDataOnPublishBooks();

  factory BookHomeDataOnPublishBooks.fromJson(Map<String, dynamic> json) => $BookHomeDataOnPublishBooksFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataOnPublishBooksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookHomeDataOnPublishBooksBookEditionPrices {

	int? id;
	String? name;
	String? key;

  BookHomeDataOnPublishBooksBookEditionPrices();

  factory BookHomeDataOnPublishBooksBookEditionPrices.fromJson(Map<String, dynamic> json) => $BookHomeDataOnPublishBooksBookEditionPricesFromJson(json);

  Map<String, dynamic> toJson() => $BookHomeDataOnPublishBooksBookEditionPricesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
