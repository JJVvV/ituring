import 'dart:convert';

import 'package:ituring/generated/json/base/json_field.dart';
import 'package:ituring/generated/json/book_detail_data_entity.g.dart';

@JsonSerializable()
class BookDetailDataEntity {
  dynamic presaleDiscountEndTime;
  int? voteCount;
  int? favCount;
  int? commentCount;
  int? viewCount;
  late String authorNameString;
  String? translatorNameString;
  bool? supportEpub;
  String? epubKey;
  String? epubName;
  int? epubFileSize;
  bool? supportMobi;
  String? mobiKey;
  String? mobiName;
  int? mobiFileSize;
  bool? supportPdf;
  dynamic pdfKey;
  dynamic pdfName;
  int? pdfFileSize;
  bool? supportPushMobi;
  bool? supportPaper;
  bool? supportPOD;
  String? publishDate;
  bool? isGift;
  List<List>? categories;
  dynamic languageName;
  dynamic contentTable;
  BookDetailDataDeputyEditor? deputyEditor;
  String? bookCollectionName;
  bool? userVote;
  bool? userFav;
  BookDetailDataContributor? contributor;
  BookDetailDataBriefIntro? briefIntro;
  dynamic originalBookInfo;
  BookDetailDataExternalSalesInfo? externalSalesInfo;
  BookDetailDataPaperEditionInfo? paperEditionInfo;
  List<BookDetailDataSameCollectionBooks>? sameCollectionBooks;
  List<BookDetailDataRelatedBooks>? relatedBooks;
  List<dynamic>? relatedArticles;
  List<dynamic>? relatedLiveCourses;
  bool? hasGiftBook;
  int? giftPoints;
  dynamic sampleFileKey;
  String? extension;
  dynamic linkText;
  dynamic linkUrl;
  List<BookDetailDataTags>? tags;
  int? tupubBookId;
  dynamic miniBookId;
  BookDetailDataEbook? ebook;
  String? pressName;
  String? encrypt;
  dynamic audioContent;
  List<BookDetailDataResources>? resources;
  List<dynamic>? extendedResources;
  dynamic firstSaleDiscount;
  int? hasBuyFirstSaleBook;
  bool? hasBuy;
  double? weight;
  int? bookStatus;
  int? onSaleEdition;
  bool? presale;
  bool? ebookWaitingForPay;
  bool? ownTheEbook;
  bool? hasBoughtEbook;
  bool? hasStock;
  List<BookDetailDataSalesInfos>? salesInfos;
  dynamic videoKey;
  bool? canSalePaper;
  bool? canSaleEbook;
  bool? canSaleAudio;
  bool? canBeSaled;
  int? id;
  String? coverKey;
  late String name;
  String? isbn;
  @JSONField(name: "abstract")
  String? xAbstract;
  List<BookDetailDataBookEditionPrices>? bookEditionPrices;

  BookDetailDataEntity();

  factory BookDetailDataEntity.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataCategoriesBookDetailDataCategories {
  int? id;
  String? name;
  dynamic key;

  BookDetailDataCategoriesBookDetailDataCategories();

  factory BookDetailDataCategoriesBookDetailDataCategories.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataCategoriesBookDetailDataCategoriesFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataCategoriesBookDetailDataCategoriesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataDeputyEditor {
  int? id;
  String? name;
  dynamic key;

  BookDetailDataDeputyEditor();

  factory BookDetailDataDeputyEditor.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataDeputyEditorFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataDeputyEditorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataContributor {
  @JSONField(name: "Author")
  List<BookDetailDataContributorAuthor>? author;

  BookDetailDataContributor();

  factory BookDetailDataContributor.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataContributorFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataContributorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataContributorAuthor {
  dynamic id;
  String? name;
  String? key;

  BookDetailDataContributorAuthor();

  factory BookDetailDataContributorAuthor.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataContributorAuthorFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataContributorAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataBriefIntro {
  String? highlight;
  String? authorInfo;
  String? specialNotes;
  @JSONField(name: "abstract")
  String? xAbstract;
  String? bookContact;

  BookDetailDataBriefIntro();

  factory BookDetailDataBriefIntro.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataBriefIntroFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataBriefIntroToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataExternalSalesInfo {
  String? saleAmazonUrl;
  String? saleDangdangUrl;
  String? saleJingdongUrl;
  String? saleChinapubUrl;
  String? saleTaobaoUrl;

  BookDetailDataExternalSalesInfo();

  factory BookDetailDataExternalSalesInfo.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataExternalSalesInfoFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataExternalSalesInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataPaperEditionInfo {
  String? bookPrintName;
  String? pageSizeName;
  int? pageNumber;

  BookDetailDataPaperEditionInfo();

  factory BookDetailDataPaperEditionInfo.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataPaperEditionInfoFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataPaperEditionInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataSameCollectionBooks {
  List<BookDetailDataSameCollectionBooksAuthors>? authors;
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
  List<BookDetailDataSameCollectionBooksBookEditionPrices>? bookEditionPrices;

  BookDetailDataSameCollectionBooks();

  factory BookDetailDataSameCollectionBooks.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataSameCollectionBooksFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataSameCollectionBooksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataSameCollectionBooksAuthors {
  int? id;
  String? name;
  dynamic key;

  BookDetailDataSameCollectionBooksAuthors();

  factory BookDetailDataSameCollectionBooksAuthors.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataSameCollectionBooksAuthorsFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataSameCollectionBooksAuthorsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataSameCollectionBooksBookEditionPrices {
  int? id;
  String? name;
  String? key;

  BookDetailDataSameCollectionBooksBookEditionPrices();

  factory BookDetailDataSameCollectionBooksBookEditionPrices.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataSameCollectionBooksBookEditionPricesFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataSameCollectionBooksBookEditionPricesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataRelatedBooks {
  List<BookDetailDataRelatedBooksAuthors>? authors;
  List<BookDetailDataRelatedBooksTranslators>? translators;
  String? authorNameString;
  String? translatorNameString;
  String? bookStatus;
  int? id;
  String? coverKey;
  String? name;
  String? isbn;
  @JSONField(name: "abstract")
  String? xAbstract;
  List<BookDetailDataRelatedBooksBookEditionPrices>? bookEditionPrices;

  BookDetailDataRelatedBooks();

  factory BookDetailDataRelatedBooks.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataRelatedBooksFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataRelatedBooksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataRelatedBooksAuthors {
  dynamic id;
  String? name;
  dynamic key;

  BookDetailDataRelatedBooksAuthors();

  factory BookDetailDataRelatedBooksAuthors.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataRelatedBooksAuthorsFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataRelatedBooksAuthorsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataRelatedBooksTranslators {
  int? id;
  String? name;
  dynamic key;

  BookDetailDataRelatedBooksTranslators();

  factory BookDetailDataRelatedBooksTranslators.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataRelatedBooksTranslatorsFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataRelatedBooksTranslatorsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataRelatedBooksBookEditionPrices {
  int? id;
  String? name;
  String? key;

  BookDetailDataRelatedBooksBookEditionPrices();

  factory BookDetailDataRelatedBooksBookEditionPrices.fromJson(
          Map<String, dynamic> json) =>
      $BookDetailDataRelatedBooksBookEditionPricesFromJson(json);

  Map<String, dynamic> toJson() =>
      $BookDetailDataRelatedBooksBookEditionPricesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataTags {
  int? id;
  late String name;
  dynamic key;

  BookDetailDataTags();

  factory BookDetailDataTags.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataTagsFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataEbook {
  int? id;
  bool? listed;
  bool? readyForPush;
  List<BookDetailDataEbookChapters>? chapters;

  BookDetailDataEbook();

  factory BookDetailDataEbook.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataEbookFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataEbookToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataEbookChapters {
  int? id;
  bool? isFree;
  String? subject;
  int? lockType;
  bool? isCompleted;

  BookDetailDataEbookChapters();

  factory BookDetailDataEbookChapters.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataEbookChaptersFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataEbookChaptersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataResources {
  int? id;
  String? name;
  int? size;
  String? sizeString;
  String? extension;
  String? url;
  String? guid;

  BookDetailDataResources();

  factory BookDetailDataResources.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataResourcesFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataResourcesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataSalesInfos {
  int? edition;
  bool? canBeSaled;
  double? price;
  int? discount;
  double? discountPrice;

  BookDetailDataSalesInfos();

  factory BookDetailDataSalesInfos.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataSalesInfosFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataSalesInfosToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BookDetailDataBookEditionPrices {
  int? id;
  String? name;
  String? key;

  BookDetailDataBookEditionPrices();

  factory BookDetailDataBookEditionPrices.fromJson(Map<String, dynamic> json) =>
      $BookDetailDataBookEditionPricesFromJson(json);

  Map<String, dynamic> toJson() => $BookDetailDataBookEditionPricesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
