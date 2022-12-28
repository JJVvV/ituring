import 'package:ituring/generated/json/base/json_field.dart';
import 'package:ituring/generated/json/books_data_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BooksDataEntity {

	List<BooksDataBookItems>? bookItems;
	BooksDataPagination? pagination;
	List<dynamic>? banners;
	dynamic tagName;

  BooksDataEntity();

  factory BooksDataEntity.fromJson(Map<String, dynamic> json) => $BooksDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $BooksDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BooksDataBookItems {

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
	List<BooksDataBookItemsBookEditionPrices>? bookEditionPrices;

  BooksDataBookItems();

  factory BooksDataBookItems.fromJson(Map<String, dynamic> json) => $BooksDataBookItemsFromJson(json);

  Map<String, dynamic> toJson() => $BooksDataBookItemsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BooksDataBookItemsBookEditionPrices {

	int? id;
	String? name;
	String? key;

  BooksDataBookItemsBookEditionPrices();

  factory BooksDataBookItemsBookEditionPrices.fromJson(Map<String, dynamic> json) => $BooksDataBookItemsBookEditionPricesFromJson(json);

  Map<String, dynamic> toJson() => $BooksDataBookItemsBookEditionPricesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BooksDataPagination {

	int? pageCount;
	int? totalItemCount;
	int? pageNumber;
	bool? hasPreviousPage;
	bool? hasNextPage;
	bool? isFirstPage;
	bool? isLastPage;

  BooksDataPagination();

  factory BooksDataPagination.fromJson(Map<String, dynamic> json) => $BooksDataPaginationFromJson(json);

  Map<String, dynamic> toJson() => $BooksDataPaginationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
