import 'package:ituring/generated/json/base/json_convert_content.dart';
import 'package:ituring/http/repository/books_data_entity.dart';

BooksDataEntity $BooksDataEntityFromJson(Map<String, dynamic> json) {
  final BooksDataEntity booksDataEntity = BooksDataEntity();
  final List<BooksDataBookItems>? bookItems =
      jsonConvert.convertListNotNull<BooksDataBookItems>(json['bookItems']);
  if (bookItems != null) {
    booksDataEntity.bookItems = bookItems;
  }
  final BooksDataPagination? pagination =
      jsonConvert.convert<BooksDataPagination>(json['pagination']);
  if (pagination != null) {
    booksDataEntity.pagination = pagination;
  }
  final List<dynamic>? banners =
      jsonConvert.convertListNotNull<dynamic>(json['banners']);
  if (banners != null) {
    booksDataEntity.banners = banners;
  }
  final dynamic? tagName = jsonConvert.convert<dynamic>(json['tagName']);
  if (tagName != null) {
    booksDataEntity.tagName = tagName;
  }
  return booksDataEntity;
}

Map<String, dynamic> $BooksDataEntityToJson(BooksDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bookItems'] = entity.bookItems?.map((v) => v.toJson()).toList();
  data['pagination'] = entity.pagination?.toJson();
  data['banners'] = entity.banners;
  data['tagName'] = entity.tagName;
  return data;
}

BooksDataBookItems $BooksDataBookItemsFromJson(Map<String, dynamic> json) {
  final BooksDataBookItems booksDataBookItems = BooksDataBookItems();
  final List<dynamic>? authors =
      jsonConvert.convertListNotNull<dynamic>(json['authors']);
  if (authors != null) {
    booksDataBookItems.authors = authors;
  }
  final List<dynamic>? translators =
      jsonConvert.convertListNotNull<dynamic>(json['translators']);
  if (translators != null) {
    booksDataBookItems.translators = translators;
  }
  final String? authorNameString =
      jsonConvert.convert<String>(json['authorNameString']);
  if (authorNameString != null) {
    booksDataBookItems.authorNameString = authorNameString;
  }
  final String? translatorNameString =
      jsonConvert.convert<String>(json['translatorNameString']);
  if (translatorNameString != null) {
    booksDataBookItems.translatorNameString = translatorNameString;
  }
  final String? bookStatus = jsonConvert.convert<String>(json['bookStatus']);
  if (bookStatus != null) {
    booksDataBookItems.bookStatus = bookStatus;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    booksDataBookItems.id = id;
  }
  final String? coverKey = jsonConvert.convert<String>(json['coverKey']);
  if (coverKey != null) {
    booksDataBookItems.coverKey = coverKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    booksDataBookItems.name = name;
  }
  final String? isbn = jsonConvert.convert<String>(json['isbn']);
  if (isbn != null) {
    booksDataBookItems.isbn = isbn;
  }
  final String? xAbstract = jsonConvert.convert<String>(json['abstract']);
  if (xAbstract != null) {
    booksDataBookItems.xAbstract = xAbstract;
  }
  final List<BooksDataBookItemsBookEditionPrices>? bookEditionPrices =
      jsonConvert.convertListNotNull<BooksDataBookItemsBookEditionPrices>(
          json['bookEditionPrices']);
  if (bookEditionPrices != null) {
    booksDataBookItems.bookEditionPrices = bookEditionPrices;
  }
  return booksDataBookItems;
}

Map<String, dynamic> $BooksDataBookItemsToJson(BooksDataBookItems entity) {
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

BooksDataBookItemsBookEditionPrices
    $BooksDataBookItemsBookEditionPricesFromJson(Map<String, dynamic> json) {
  final BooksDataBookItemsBookEditionPrices
      booksDataBookItemsBookEditionPrices =
      BooksDataBookItemsBookEditionPrices();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    booksDataBookItemsBookEditionPrices.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    booksDataBookItemsBookEditionPrices.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    booksDataBookItemsBookEditionPrices.key = key;
  }
  return booksDataBookItemsBookEditionPrices;
}

Map<String, dynamic> $BooksDataBookItemsBookEditionPricesToJson(
    BooksDataBookItemsBookEditionPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BooksDataPagination $BooksDataPaginationFromJson(Map<String, dynamic> json) {
  final BooksDataPagination booksDataPagination = BooksDataPagination();
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    booksDataPagination.pageCount = pageCount;
  }
  final int? totalItemCount = jsonConvert.convert<int>(json['totalItemCount']);
  if (totalItemCount != null) {
    booksDataPagination.totalItemCount = totalItemCount;
  }
  final int? pageNumber = jsonConvert.convert<int>(json['pageNumber']);
  if (pageNumber != null) {
    booksDataPagination.pageNumber = pageNumber;
  }
  final bool? hasPreviousPage =
      jsonConvert.convert<bool>(json['hasPreviousPage']);
  if (hasPreviousPage != null) {
    booksDataPagination.hasPreviousPage = hasPreviousPage;
  }
  final bool? hasNextPage = jsonConvert.convert<bool>(json['hasNextPage']);
  if (hasNextPage != null) {
    booksDataPagination.hasNextPage = hasNextPage;
  }
  final bool? isFirstPage = jsonConvert.convert<bool>(json['isFirstPage']);
  if (isFirstPage != null) {
    booksDataPagination.isFirstPage = isFirstPage;
  }
  final bool? isLastPage = jsonConvert.convert<bool>(json['isLastPage']);
  if (isLastPage != null) {
    booksDataPagination.isLastPage = isLastPage;
  }
  return booksDataPagination;
}

Map<String, dynamic> $BooksDataPaginationToJson(BooksDataPagination entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pageCount'] = entity.pageCount;
  data['totalItemCount'] = entity.totalItemCount;
  data['pageNumber'] = entity.pageNumber;
  data['hasPreviousPage'] = entity.hasPreviousPage;
  data['hasNextPage'] = entity.hasNextPage;
  data['isFirstPage'] = entity.isFirstPage;
  data['isLastPage'] = entity.isLastPage;
  return data;
}
