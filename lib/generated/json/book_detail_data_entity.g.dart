import 'package:ituring/generated/json/base/json_convert_content.dart';
import 'package:ituring/http/repository/book_detail_data_entity.dart';

BookDetailDataEntity $BookDetailDataEntityFromJson(Map<String, dynamic> json) {
  final BookDetailDataEntity bookDetailDataEntity = BookDetailDataEntity();
  final dynamic? presaleDiscountEndTime =
      jsonConvert.convert<dynamic>(json['presaleDiscountEndTime']);
  if (presaleDiscountEndTime != null) {
    bookDetailDataEntity.presaleDiscountEndTime = presaleDiscountEndTime;
  }
  final int? voteCount = jsonConvert.convert<int>(json['voteCount']);
  if (voteCount != null) {
    bookDetailDataEntity.voteCount = voteCount;
  }
  final int? favCount = jsonConvert.convert<int>(json['favCount']);
  if (favCount != null) {
    bookDetailDataEntity.favCount = favCount;
  }
  final int? commentCount = jsonConvert.convert<int>(json['commentCount']);
  if (commentCount != null) {
    bookDetailDataEntity.commentCount = commentCount;
  }
  final int? viewCount = jsonConvert.convert<int>(json['viewCount']);
  if (viewCount != null) {
    bookDetailDataEntity.viewCount = viewCount;
  }
  final String? authorNameString =
      jsonConvert.convert<String>(json['authorNameString']);
  if (authorNameString != null) {
    bookDetailDataEntity.authorNameString = authorNameString;
  }
  final String? translatorNameString =
      jsonConvert.convert<String>(json['translatorNameString']);
  if (translatorNameString != null) {
    bookDetailDataEntity.translatorNameString = translatorNameString;
  }
  final bool? supportEpub = jsonConvert.convert<bool>(json['supportEpub']);
  if (supportEpub != null) {
    bookDetailDataEntity.supportEpub = supportEpub;
  }
  final String? epubKey = jsonConvert.convert<String>(json['epubKey']);
  if (epubKey != null) {
    bookDetailDataEntity.epubKey = epubKey;
  }
  final String? epubName = jsonConvert.convert<String>(json['epubName']);
  if (epubName != null) {
    bookDetailDataEntity.epubName = epubName;
  }
  final int? epubFileSize = jsonConvert.convert<int>(json['epubFileSize']);
  if (epubFileSize != null) {
    bookDetailDataEntity.epubFileSize = epubFileSize;
  }
  final bool? supportMobi = jsonConvert.convert<bool>(json['supportMobi']);
  if (supportMobi != null) {
    bookDetailDataEntity.supportMobi = supportMobi;
  }
  final String? mobiKey = jsonConvert.convert<String>(json['mobiKey']);
  if (mobiKey != null) {
    bookDetailDataEntity.mobiKey = mobiKey;
  }
  final String? mobiName = jsonConvert.convert<String>(json['mobiName']);
  if (mobiName != null) {
    bookDetailDataEntity.mobiName = mobiName;
  }
  final int? mobiFileSize = jsonConvert.convert<int>(json['mobiFileSize']);
  if (mobiFileSize != null) {
    bookDetailDataEntity.mobiFileSize = mobiFileSize;
  }
  final bool? supportPdf = jsonConvert.convert<bool>(json['supportPdf']);
  if (supportPdf != null) {
    bookDetailDataEntity.supportPdf = supportPdf;
  }
  final dynamic? pdfKey = jsonConvert.convert<dynamic>(json['pdfKey']);
  if (pdfKey != null) {
    bookDetailDataEntity.pdfKey = pdfKey;
  }
  final dynamic? pdfName = jsonConvert.convert<dynamic>(json['pdfName']);
  if (pdfName != null) {
    bookDetailDataEntity.pdfName = pdfName;
  }
  final int? pdfFileSize = jsonConvert.convert<int>(json['pdfFileSize']);
  if (pdfFileSize != null) {
    bookDetailDataEntity.pdfFileSize = pdfFileSize;
  }
  final bool? supportPushMobi =
      jsonConvert.convert<bool>(json['supportPushMobi']);
  if (supportPushMobi != null) {
    bookDetailDataEntity.supportPushMobi = supportPushMobi;
  }
  final bool? supportPaper = jsonConvert.convert<bool>(json['supportPaper']);
  if (supportPaper != null) {
    bookDetailDataEntity.supportPaper = supportPaper;
  }
  final bool? supportPOD = jsonConvert.convert<bool>(json['supportPOD']);
  if (supportPOD != null) {
    bookDetailDataEntity.supportPOD = supportPOD;
  }
  final String? publishDate = jsonConvert.convert<String>(json['publishDate']);
  if (publishDate != null) {
    bookDetailDataEntity.publishDate = publishDate;
  }
  final bool? isGift = jsonConvert.convert<bool>(json['isGift']);
  if (isGift != null) {
    bookDetailDataEntity.isGift = isGift;
  }
  final List<List>? categories =
      jsonConvert.convertListNotNull<List>(json['categories']);
  if (categories != null) {
    bookDetailDataEntity.categories = categories;
  }
  final dynamic? languageName =
      jsonConvert.convert<dynamic>(json['languageName']);
  if (languageName != null) {
    bookDetailDataEntity.languageName = languageName;
  }
  final dynamic? contentTable =
      jsonConvert.convert<dynamic>(json['contentTable']);
  if (contentTable != null) {
    bookDetailDataEntity.contentTable = contentTable;
  }
  final BookDetailDataDeputyEditor? deputyEditor =
      jsonConvert.convert<BookDetailDataDeputyEditor>(json['deputyEditor']);
  if (deputyEditor != null) {
    bookDetailDataEntity.deputyEditor = deputyEditor;
  }
  final String? bookCollectionName =
      jsonConvert.convert<String>(json['bookCollectionName']);
  if (bookCollectionName != null) {
    bookDetailDataEntity.bookCollectionName = bookCollectionName;
  }
  final bool? userVote = jsonConvert.convert<bool>(json['userVote']);
  if (userVote != null) {
    bookDetailDataEntity.userVote = userVote;
  }
  final bool? userFav = jsonConvert.convert<bool>(json['userFav']);
  if (userFav != null) {
    bookDetailDataEntity.userFav = userFav;
  }
  final BookDetailDataContributor? contributor =
      jsonConvert.convert<BookDetailDataContributor>(json['contributor']);
  if (contributor != null) {
    bookDetailDataEntity.contributor = contributor;
  }
  final BookDetailDataBriefIntro? briefIntro =
      jsonConvert.convert<BookDetailDataBriefIntro>(json['briefIntro']);
  if (briefIntro != null) {
    bookDetailDataEntity.briefIntro = briefIntro;
  }
  final dynamic? originalBookInfo =
      jsonConvert.convert<dynamic>(json['originalBookInfo']);
  if (originalBookInfo != null) {
    bookDetailDataEntity.originalBookInfo = originalBookInfo;
  }
  final BookDetailDataExternalSalesInfo? externalSalesInfo = jsonConvert
      .convert<BookDetailDataExternalSalesInfo>(json['externalSalesInfo']);
  if (externalSalesInfo != null) {
    bookDetailDataEntity.externalSalesInfo = externalSalesInfo;
  }
  final BookDetailDataPaperEditionInfo? paperEditionInfo = jsonConvert
      .convert<BookDetailDataPaperEditionInfo>(json['paperEditionInfo']);
  if (paperEditionInfo != null) {
    bookDetailDataEntity.paperEditionInfo = paperEditionInfo;
  }
  final List<BookDetailDataSameCollectionBooks>? sameCollectionBooks =
      jsonConvert.convertListNotNull<BookDetailDataSameCollectionBooks>(
          json['sameCollectionBooks']);
  if (sameCollectionBooks != null) {
    bookDetailDataEntity.sameCollectionBooks = sameCollectionBooks;
  }
  final List<BookDetailDataRelatedBooks>? relatedBooks = jsonConvert
      .convertListNotNull<BookDetailDataRelatedBooks>(json['relatedBooks']);
  if (relatedBooks != null) {
    bookDetailDataEntity.relatedBooks = relatedBooks;
  }
  final List<dynamic>? relatedArticles =
      jsonConvert.convertListNotNull<dynamic>(json['relatedArticles']);
  if (relatedArticles != null) {
    bookDetailDataEntity.relatedArticles = relatedArticles;
  }
  final List<dynamic>? relatedLiveCourses =
      jsonConvert.convertListNotNull<dynamic>(json['relatedLiveCourses']);
  if (relatedLiveCourses != null) {
    bookDetailDataEntity.relatedLiveCourses = relatedLiveCourses;
  }
  final bool? hasGiftBook = jsonConvert.convert<bool>(json['hasGiftBook']);
  if (hasGiftBook != null) {
    bookDetailDataEntity.hasGiftBook = hasGiftBook;
  }
  final int? giftPoints = jsonConvert.convert<int>(json['giftPoints']);
  if (giftPoints != null) {
    bookDetailDataEntity.giftPoints = giftPoints;
  }
  final dynamic? sampleFileKey =
      jsonConvert.convert<dynamic>(json['sampleFileKey']);
  if (sampleFileKey != null) {
    bookDetailDataEntity.sampleFileKey = sampleFileKey;
  }
  final String? extension = jsonConvert.convert<String>(json['extension']);
  if (extension != null) {
    bookDetailDataEntity.extension = extension;
  }
  final dynamic? linkText = jsonConvert.convert<dynamic>(json['linkText']);
  if (linkText != null) {
    bookDetailDataEntity.linkText = linkText;
  }
  final dynamic? linkUrl = jsonConvert.convert<dynamic>(json['linkUrl']);
  if (linkUrl != null) {
    bookDetailDataEntity.linkUrl = linkUrl;
  }
  final List<BookDetailDataTags>? tags =
      jsonConvert.convertListNotNull<BookDetailDataTags>(json['tags']);
  if (tags != null) {
    bookDetailDataEntity.tags = tags;
  }
  final int? tupubBookId = jsonConvert.convert<int>(json['tupubBookId']);
  if (tupubBookId != null) {
    bookDetailDataEntity.tupubBookId = tupubBookId;
  }
  final dynamic? miniBookId = jsonConvert.convert<dynamic>(json['miniBookId']);
  if (miniBookId != null) {
    bookDetailDataEntity.miniBookId = miniBookId;
  }
  final BookDetailDataEbook? ebook =
      jsonConvert.convert<BookDetailDataEbook>(json['ebook']);
  if (ebook != null) {
    bookDetailDataEntity.ebook = ebook;
  }
  final String? pressName = jsonConvert.convert<String>(json['pressName']);
  if (pressName != null) {
    bookDetailDataEntity.pressName = pressName;
  }
  final String? encrypt = jsonConvert.convert<String>(json['encrypt']);
  if (encrypt != null) {
    bookDetailDataEntity.encrypt = encrypt;
  }
  final dynamic? audioContent =
      jsonConvert.convert<dynamic>(json['audioContent']);
  if (audioContent != null) {
    bookDetailDataEntity.audioContent = audioContent;
  }
  final List<BookDetailDataResources>? resources = jsonConvert
      .convertListNotNull<BookDetailDataResources>(json['resources']);
  if (resources != null) {
    bookDetailDataEntity.resources = resources;
  }
  final List<dynamic>? extendedResources =
      jsonConvert.convertListNotNull<dynamic>(json['extendedResources']);
  if (extendedResources != null) {
    bookDetailDataEntity.extendedResources = extendedResources;
  }
  final dynamic? firstSaleDiscount =
      jsonConvert.convert<dynamic>(json['firstSaleDiscount']);
  if (firstSaleDiscount != null) {
    bookDetailDataEntity.firstSaleDiscount = firstSaleDiscount;
  }
  final int? hasBuyFirstSaleBook =
      jsonConvert.convert<int>(json['hasBuyFirstSaleBook']);
  if (hasBuyFirstSaleBook != null) {
    bookDetailDataEntity.hasBuyFirstSaleBook = hasBuyFirstSaleBook;
  }
  final bool? hasBuy = jsonConvert.convert<bool>(json['hasBuy']);
  if (hasBuy != null) {
    bookDetailDataEntity.hasBuy = hasBuy;
  }
  final double? weight = jsonConvert.convert<double>(json['weight']);
  if (weight != null) {
    bookDetailDataEntity.weight = weight;
  }
  final int? bookStatus = jsonConvert.convert<int>(json['bookStatus']);
  if (bookStatus != null) {
    bookDetailDataEntity.bookStatus = bookStatus;
  }
  final int? onSaleEdition = jsonConvert.convert<int>(json['onSaleEdition']);
  if (onSaleEdition != null) {
    bookDetailDataEntity.onSaleEdition = onSaleEdition;
  }
  final bool? presale = jsonConvert.convert<bool>(json['presale']);
  if (presale != null) {
    bookDetailDataEntity.presale = presale;
  }
  final bool? ebookWaitingForPay =
      jsonConvert.convert<bool>(json['ebookWaitingForPay']);
  if (ebookWaitingForPay != null) {
    bookDetailDataEntity.ebookWaitingForPay = ebookWaitingForPay;
  }
  final bool? ownTheEbook = jsonConvert.convert<bool>(json['ownTheEbook']);
  if (ownTheEbook != null) {
    bookDetailDataEntity.ownTheEbook = ownTheEbook;
  }
  final bool? hasBoughtEbook =
      jsonConvert.convert<bool>(json['hasBoughtEbook']);
  if (hasBoughtEbook != null) {
    bookDetailDataEntity.hasBoughtEbook = hasBoughtEbook;
  }
  final bool? hasStock = jsonConvert.convert<bool>(json['hasStock']);
  if (hasStock != null) {
    bookDetailDataEntity.hasStock = hasStock;
  }
  final List<BookDetailDataSalesInfos>? salesInfos = jsonConvert
      .convertListNotNull<BookDetailDataSalesInfos>(json['salesInfos']);
  if (salesInfos != null) {
    bookDetailDataEntity.salesInfos = salesInfos;
  }
  final dynamic? videoKey = jsonConvert.convert<dynamic>(json['videoKey']);
  if (videoKey != null) {
    bookDetailDataEntity.videoKey = videoKey;
  }
  final bool? canSalePaper = jsonConvert.convert<bool>(json['canSalePaper']);
  if (canSalePaper != null) {
    bookDetailDataEntity.canSalePaper = canSalePaper;
  }
  final bool? canSaleEbook = jsonConvert.convert<bool>(json['canSaleEbook']);
  if (canSaleEbook != null) {
    bookDetailDataEntity.canSaleEbook = canSaleEbook;
  }
  final bool? canSaleAudio = jsonConvert.convert<bool>(json['canSaleAudio']);
  if (canSaleAudio != null) {
    bookDetailDataEntity.canSaleAudio = canSaleAudio;
  }
  final bool? canBeSaled = jsonConvert.convert<bool>(json['canBeSaled']);
  if (canBeSaled != null) {
    bookDetailDataEntity.canBeSaled = canBeSaled;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataEntity.id = id;
  }
  final String? coverKey = jsonConvert.convert<String>(json['coverKey']);
  if (coverKey != null) {
    bookDetailDataEntity.coverKey = coverKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataEntity.name = name;
  }
  final String? isbn = jsonConvert.convert<String>(json['isbn']);
  if (isbn != null) {
    bookDetailDataEntity.isbn = isbn;
  }
  final String? xAbstract = jsonConvert.convert<String>(json['abstract']);
  if (xAbstract != null) {
    bookDetailDataEntity.xAbstract = xAbstract;
  }
  final List<BookDetailDataBookEditionPrices>? bookEditionPrices =
      jsonConvert.convertListNotNull<BookDetailDataBookEditionPrices>(
          json['bookEditionPrices']);
  if (bookEditionPrices != null) {
    bookDetailDataEntity.bookEditionPrices = bookEditionPrices;
  }
  return bookDetailDataEntity;
}

Map<String, dynamic> $BookDetailDataEntityToJson(BookDetailDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['presaleDiscountEndTime'] = entity.presaleDiscountEndTime;
  data['voteCount'] = entity.voteCount;
  data['favCount'] = entity.favCount;
  data['commentCount'] = entity.commentCount;
  data['viewCount'] = entity.viewCount;
  data['authorNameString'] = entity.authorNameString;
  data['translatorNameString'] = entity.translatorNameString;
  data['supportEpub'] = entity.supportEpub;
  data['epubKey'] = entity.epubKey;
  data['epubName'] = entity.epubName;
  data['epubFileSize'] = entity.epubFileSize;
  data['supportMobi'] = entity.supportMobi;
  data['mobiKey'] = entity.mobiKey;
  data['mobiName'] = entity.mobiName;
  data['mobiFileSize'] = entity.mobiFileSize;
  data['supportPdf'] = entity.supportPdf;
  data['pdfKey'] = entity.pdfKey;
  data['pdfName'] = entity.pdfName;
  data['pdfFileSize'] = entity.pdfFileSize;
  data['supportPushMobi'] = entity.supportPushMobi;
  data['supportPaper'] = entity.supportPaper;
  data['supportPOD'] = entity.supportPOD;
  data['publishDate'] = entity.publishDate;
  data['isGift'] = entity.isGift;
  data['categories'] = entity.categories;
  data['languageName'] = entity.languageName;
  data['contentTable'] = entity.contentTable;
  data['deputyEditor'] = entity.deputyEditor?.toJson();
  data['bookCollectionName'] = entity.bookCollectionName;
  data['userVote'] = entity.userVote;
  data['userFav'] = entity.userFav;
  data['contributor'] = entity.contributor?.toJson();
  data['briefIntro'] = entity.briefIntro?.toJson();
  data['originalBookInfo'] = entity.originalBookInfo;
  data['externalSalesInfo'] = entity.externalSalesInfo?.toJson();
  data['paperEditionInfo'] = entity.paperEditionInfo?.toJson();
  data['sameCollectionBooks'] =
      entity.sameCollectionBooks?.map((v) => v.toJson()).toList();
  data['relatedBooks'] = entity.relatedBooks?.map((v) => v.toJson()).toList();
  data['relatedArticles'] = entity.relatedArticles;
  data['relatedLiveCourses'] = entity.relatedLiveCourses;
  data['hasGiftBook'] = entity.hasGiftBook;
  data['giftPoints'] = entity.giftPoints;
  data['sampleFileKey'] = entity.sampleFileKey;
  data['extension'] = entity.extension;
  data['linkText'] = entity.linkText;
  data['linkUrl'] = entity.linkUrl;
  data['tags'] = entity.tags?.map((v) => v.toJson()).toList();
  data['tupubBookId'] = entity.tupubBookId;
  data['miniBookId'] = entity.miniBookId;
  data['ebook'] = entity.ebook?.toJson();
  data['pressName'] = entity.pressName;
  data['encrypt'] = entity.encrypt;
  data['audioContent'] = entity.audioContent;
  data['resources'] = entity.resources?.map((v) => v.toJson()).toList();
  data['extendedResources'] = entity.extendedResources;
  data['firstSaleDiscount'] = entity.firstSaleDiscount;
  data['hasBuyFirstSaleBook'] = entity.hasBuyFirstSaleBook;
  data['hasBuy'] = entity.hasBuy;
  data['weight'] = entity.weight;
  data['bookStatus'] = entity.bookStatus;
  data['onSaleEdition'] = entity.onSaleEdition;
  data['presale'] = entity.presale;
  data['ebookWaitingForPay'] = entity.ebookWaitingForPay;
  data['ownTheEbook'] = entity.ownTheEbook;
  data['hasBoughtEbook'] = entity.hasBoughtEbook;
  data['hasStock'] = entity.hasStock;
  data['salesInfos'] = entity.salesInfos?.map((v) => v.toJson()).toList();
  data['videoKey'] = entity.videoKey;
  data['canSalePaper'] = entity.canSalePaper;
  data['canSaleEbook'] = entity.canSaleEbook;
  data['canSaleAudio'] = entity.canSaleAudio;
  data['canBeSaled'] = entity.canBeSaled;
  data['id'] = entity.id;
  data['coverKey'] = entity.coverKey;
  data['name'] = entity.name;
  data['isbn'] = entity.isbn;
  data['abstract'] = entity.xAbstract;
  data['bookEditionPrices'] =
      entity.bookEditionPrices?.map((v) => v.toJson()).toList();
  return data;
}

BookDetailDataCategoriesBookDetailDataCategories
    $BookDetailDataCategoriesBookDetailDataCategoriesFromJson(
        Map<String, dynamic> json) {
  final BookDetailDataCategoriesBookDetailDataCategories
      bookDetailDataCategoriesBookDetailDataCategories =
      BookDetailDataCategoriesBookDetailDataCategories();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataCategoriesBookDetailDataCategories.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataCategoriesBookDetailDataCategories.name = name;
  }
  final dynamic? key = jsonConvert.convert<dynamic>(json['key']);
  if (key != null) {
    bookDetailDataCategoriesBookDetailDataCategories.key = key;
  }
  return bookDetailDataCategoriesBookDetailDataCategories;
}

Map<String, dynamic> $BookDetailDataCategoriesBookDetailDataCategoriesToJson(
    BookDetailDataCategoriesBookDetailDataCategories entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataDeputyEditor $BookDetailDataDeputyEditorFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataDeputyEditor bookDetailDataDeputyEditor =
      BookDetailDataDeputyEditor();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataDeputyEditor.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataDeputyEditor.name = name;
  }
  final dynamic? key = jsonConvert.convert<dynamic>(json['key']);
  if (key != null) {
    bookDetailDataDeputyEditor.key = key;
  }
  return bookDetailDataDeputyEditor;
}

Map<String, dynamic> $BookDetailDataDeputyEditorToJson(
    BookDetailDataDeputyEditor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataContributor $BookDetailDataContributorFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataContributor bookDetailDataContributor =
      BookDetailDataContributor();
  final List<BookDetailDataContributorAuthor>? author = jsonConvert
      .convertListNotNull<BookDetailDataContributorAuthor>(json['Author']);
  if (author != null) {
    bookDetailDataContributor.author = author;
  }
  return bookDetailDataContributor;
}

Map<String, dynamic> $BookDetailDataContributorToJson(
    BookDetailDataContributor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Author'] = entity.author?.map((v) => v.toJson()).toList();
  return data;
}

BookDetailDataContributorAuthor $BookDetailDataContributorAuthorFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataContributorAuthor bookDetailDataContributorAuthor =
      BookDetailDataContributorAuthor();
  final dynamic? id = jsonConvert.convert<dynamic>(json['id']);
  if (id != null) {
    bookDetailDataContributorAuthor.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataContributorAuthor.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    bookDetailDataContributorAuthor.key = key;
  }
  return bookDetailDataContributorAuthor;
}

Map<String, dynamic> $BookDetailDataContributorAuthorToJson(
    BookDetailDataContributorAuthor entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataBriefIntro $BookDetailDataBriefIntroFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataBriefIntro bookDetailDataBriefIntro =
      BookDetailDataBriefIntro();
  final String? highlight = jsonConvert.convert<String>(json['highlight']);
  if (highlight != null) {
    bookDetailDataBriefIntro.highlight = highlight;
  }
  final String? authorInfo = jsonConvert.convert<String>(json['authorInfo']);
  if (authorInfo != null) {
    bookDetailDataBriefIntro.authorInfo = authorInfo;
  }
  final String? specialNotes =
      jsonConvert.convert<String>(json['specialNotes']);
  if (specialNotes != null) {
    bookDetailDataBriefIntro.specialNotes = specialNotes;
  }
  final String? xAbstract = jsonConvert.convert<String>(json['abstract']);
  if (xAbstract != null) {
    bookDetailDataBriefIntro.xAbstract = xAbstract;
  }
  final String? bookContact = jsonConvert.convert<String>(json['bookContact']);
  if (bookContact != null) {
    bookDetailDataBriefIntro.bookContact = bookContact;
  }
  return bookDetailDataBriefIntro;
}

Map<String, dynamic> $BookDetailDataBriefIntroToJson(
    BookDetailDataBriefIntro entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['highlight'] = entity.highlight;
  data['authorInfo'] = entity.authorInfo;
  data['specialNotes'] = entity.specialNotes;
  data['abstract'] = entity.xAbstract;
  data['bookContact'] = entity.bookContact;
  return data;
}

BookDetailDataExternalSalesInfo $BookDetailDataExternalSalesInfoFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataExternalSalesInfo bookDetailDataExternalSalesInfo =
      BookDetailDataExternalSalesInfo();
  final String? saleAmazonUrl =
      jsonConvert.convert<String>(json['saleAmazonUrl']);
  if (saleAmazonUrl != null) {
    bookDetailDataExternalSalesInfo.saleAmazonUrl = saleAmazonUrl;
  }
  final String? saleDangdangUrl =
      jsonConvert.convert<String>(json['saleDangdangUrl']);
  if (saleDangdangUrl != null) {
    bookDetailDataExternalSalesInfo.saleDangdangUrl = saleDangdangUrl;
  }
  final String? saleJingdongUrl =
      jsonConvert.convert<String>(json['saleJingdongUrl']);
  if (saleJingdongUrl != null) {
    bookDetailDataExternalSalesInfo.saleJingdongUrl = saleJingdongUrl;
  }
  final String? saleChinapubUrl =
      jsonConvert.convert<String>(json['saleChinapubUrl']);
  if (saleChinapubUrl != null) {
    bookDetailDataExternalSalesInfo.saleChinapubUrl = saleChinapubUrl;
  }
  final String? saleTaobaoUrl =
      jsonConvert.convert<String>(json['saleTaobaoUrl']);
  if (saleTaobaoUrl != null) {
    bookDetailDataExternalSalesInfo.saleTaobaoUrl = saleTaobaoUrl;
  }
  return bookDetailDataExternalSalesInfo;
}

Map<String, dynamic> $BookDetailDataExternalSalesInfoToJson(
    BookDetailDataExternalSalesInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['saleAmazonUrl'] = entity.saleAmazonUrl;
  data['saleDangdangUrl'] = entity.saleDangdangUrl;
  data['saleJingdongUrl'] = entity.saleJingdongUrl;
  data['saleChinapubUrl'] = entity.saleChinapubUrl;
  data['saleTaobaoUrl'] = entity.saleTaobaoUrl;
  return data;
}

BookDetailDataPaperEditionInfo $BookDetailDataPaperEditionInfoFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataPaperEditionInfo bookDetailDataPaperEditionInfo =
      BookDetailDataPaperEditionInfo();
  final String? bookPrintName =
      jsonConvert.convert<String>(json['bookPrintName']);
  if (bookPrintName != null) {
    bookDetailDataPaperEditionInfo.bookPrintName = bookPrintName;
  }
  final String? pageSizeName =
      jsonConvert.convert<String>(json['pageSizeName']);
  if (pageSizeName != null) {
    bookDetailDataPaperEditionInfo.pageSizeName = pageSizeName;
  }
  final int? pageNumber = jsonConvert.convert<int>(json['pageNumber']);
  if (pageNumber != null) {
    bookDetailDataPaperEditionInfo.pageNumber = pageNumber;
  }
  return bookDetailDataPaperEditionInfo;
}

Map<String, dynamic> $BookDetailDataPaperEditionInfoToJson(
    BookDetailDataPaperEditionInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bookPrintName'] = entity.bookPrintName;
  data['pageSizeName'] = entity.pageSizeName;
  data['pageNumber'] = entity.pageNumber;
  return data;
}

BookDetailDataSameCollectionBooks $BookDetailDataSameCollectionBooksFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataSameCollectionBooks bookDetailDataSameCollectionBooks =
      BookDetailDataSameCollectionBooks();
  final List<BookDetailDataSameCollectionBooksAuthors>? authors =
      jsonConvert.convertListNotNull<BookDetailDataSameCollectionBooksAuthors>(
          json['authors']);
  if (authors != null) {
    bookDetailDataSameCollectionBooks.authors = authors;
  }
  final List<dynamic>? translators =
      jsonConvert.convertListNotNull<dynamic>(json['translators']);
  if (translators != null) {
    bookDetailDataSameCollectionBooks.translators = translators;
  }
  final String? authorNameString =
      jsonConvert.convert<String>(json['authorNameString']);
  if (authorNameString != null) {
    bookDetailDataSameCollectionBooks.authorNameString = authorNameString;
  }
  final String? translatorNameString =
      jsonConvert.convert<String>(json['translatorNameString']);
  if (translatorNameString != null) {
    bookDetailDataSameCollectionBooks.translatorNameString =
        translatorNameString;
  }
  final String? bookStatus = jsonConvert.convert<String>(json['bookStatus']);
  if (bookStatus != null) {
    bookDetailDataSameCollectionBooks.bookStatus = bookStatus;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataSameCollectionBooks.id = id;
  }
  final String? coverKey = jsonConvert.convert<String>(json['coverKey']);
  if (coverKey != null) {
    bookDetailDataSameCollectionBooks.coverKey = coverKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataSameCollectionBooks.name = name;
  }
  final String? isbn = jsonConvert.convert<String>(json['isbn']);
  if (isbn != null) {
    bookDetailDataSameCollectionBooks.isbn = isbn;
  }
  final String? xAbstract = jsonConvert.convert<String>(json['abstract']);
  if (xAbstract != null) {
    bookDetailDataSameCollectionBooks.xAbstract = xAbstract;
  }
  final List<BookDetailDataSameCollectionBooksBookEditionPrices>?
      bookEditionPrices = jsonConvert.convertListNotNull<
              BookDetailDataSameCollectionBooksBookEditionPrices>(
          json['bookEditionPrices']);
  if (bookEditionPrices != null) {
    bookDetailDataSameCollectionBooks.bookEditionPrices = bookEditionPrices;
  }
  return bookDetailDataSameCollectionBooks;
}

Map<String, dynamic> $BookDetailDataSameCollectionBooksToJson(
    BookDetailDataSameCollectionBooks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['authors'] = entity.authors?.map((v) => v.toJson()).toList();
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

BookDetailDataSameCollectionBooksAuthors
    $BookDetailDataSameCollectionBooksAuthorsFromJson(
        Map<String, dynamic> json) {
  final BookDetailDataSameCollectionBooksAuthors
      bookDetailDataSameCollectionBooksAuthors =
      BookDetailDataSameCollectionBooksAuthors();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataSameCollectionBooksAuthors.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataSameCollectionBooksAuthors.name = name;
  }
  final dynamic? key = jsonConvert.convert<dynamic>(json['key']);
  if (key != null) {
    bookDetailDataSameCollectionBooksAuthors.key = key;
  }
  return bookDetailDataSameCollectionBooksAuthors;
}

Map<String, dynamic> $BookDetailDataSameCollectionBooksAuthorsToJson(
    BookDetailDataSameCollectionBooksAuthors entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataSameCollectionBooksBookEditionPrices
    $BookDetailDataSameCollectionBooksBookEditionPricesFromJson(
        Map<String, dynamic> json) {
  final BookDetailDataSameCollectionBooksBookEditionPrices
      bookDetailDataSameCollectionBooksBookEditionPrices =
      BookDetailDataSameCollectionBooksBookEditionPrices();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataSameCollectionBooksBookEditionPrices.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataSameCollectionBooksBookEditionPrices.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    bookDetailDataSameCollectionBooksBookEditionPrices.key = key;
  }
  return bookDetailDataSameCollectionBooksBookEditionPrices;
}

Map<String, dynamic> $BookDetailDataSameCollectionBooksBookEditionPricesToJson(
    BookDetailDataSameCollectionBooksBookEditionPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataRelatedBooks $BookDetailDataRelatedBooksFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataRelatedBooks bookDetailDataRelatedBooks =
      BookDetailDataRelatedBooks();
  final List<BookDetailDataRelatedBooksAuthors>? authors = jsonConvert
      .convertListNotNull<BookDetailDataRelatedBooksAuthors>(json['authors']);
  if (authors != null) {
    bookDetailDataRelatedBooks.authors = authors;
  }
  final List<BookDetailDataRelatedBooksTranslators>? translators =
      jsonConvert.convertListNotNull<BookDetailDataRelatedBooksTranslators>(
          json['translators']);
  if (translators != null) {
    bookDetailDataRelatedBooks.translators = translators;
  }
  final String? authorNameString =
      jsonConvert.convert<String>(json['authorNameString']);
  if (authorNameString != null) {
    bookDetailDataRelatedBooks.authorNameString = authorNameString;
  }
  final String? translatorNameString =
      jsonConvert.convert<String>(json['translatorNameString']);
  if (translatorNameString != null) {
    bookDetailDataRelatedBooks.translatorNameString = translatorNameString;
  }
  final String? bookStatus = jsonConvert.convert<String>(json['bookStatus']);
  if (bookStatus != null) {
    bookDetailDataRelatedBooks.bookStatus = bookStatus;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataRelatedBooks.id = id;
  }
  final String? coverKey = jsonConvert.convert<String>(json['coverKey']);
  if (coverKey != null) {
    bookDetailDataRelatedBooks.coverKey = coverKey;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataRelatedBooks.name = name;
  }
  final String? isbn = jsonConvert.convert<String>(json['isbn']);
  if (isbn != null) {
    bookDetailDataRelatedBooks.isbn = isbn;
  }
  final String? xAbstract = jsonConvert.convert<String>(json['abstract']);
  if (xAbstract != null) {
    bookDetailDataRelatedBooks.xAbstract = xAbstract;
  }
  final List<BookDetailDataRelatedBooksBookEditionPrices>? bookEditionPrices =
      jsonConvert
          .convertListNotNull<BookDetailDataRelatedBooksBookEditionPrices>(
              json['bookEditionPrices']);
  if (bookEditionPrices != null) {
    bookDetailDataRelatedBooks.bookEditionPrices = bookEditionPrices;
  }
  return bookDetailDataRelatedBooks;
}

Map<String, dynamic> $BookDetailDataRelatedBooksToJson(
    BookDetailDataRelatedBooks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['authors'] = entity.authors?.map((v) => v.toJson()).toList();
  data['translators'] = entity.translators?.map((v) => v.toJson()).toList();
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

BookDetailDataRelatedBooksAuthors $BookDetailDataRelatedBooksAuthorsFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataRelatedBooksAuthors bookDetailDataRelatedBooksAuthors =
      BookDetailDataRelatedBooksAuthors();
  final dynamic? id = jsonConvert.convert<dynamic>(json['id']);
  if (id != null) {
    bookDetailDataRelatedBooksAuthors.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataRelatedBooksAuthors.name = name;
  }
  final dynamic? key = jsonConvert.convert<dynamic>(json['key']);
  if (key != null) {
    bookDetailDataRelatedBooksAuthors.key = key;
  }
  return bookDetailDataRelatedBooksAuthors;
}

Map<String, dynamic> $BookDetailDataRelatedBooksAuthorsToJson(
    BookDetailDataRelatedBooksAuthors entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataRelatedBooksTranslators
    $BookDetailDataRelatedBooksTranslatorsFromJson(Map<String, dynamic> json) {
  final BookDetailDataRelatedBooksTranslators
      bookDetailDataRelatedBooksTranslators =
      BookDetailDataRelatedBooksTranslators();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataRelatedBooksTranslators.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataRelatedBooksTranslators.name = name;
  }
  final dynamic? key = jsonConvert.convert<dynamic>(json['key']);
  if (key != null) {
    bookDetailDataRelatedBooksTranslators.key = key;
  }
  return bookDetailDataRelatedBooksTranslators;
}

Map<String, dynamic> $BookDetailDataRelatedBooksTranslatorsToJson(
    BookDetailDataRelatedBooksTranslators entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataRelatedBooksBookEditionPrices
    $BookDetailDataRelatedBooksBookEditionPricesFromJson(
        Map<String, dynamic> json) {
  final BookDetailDataRelatedBooksBookEditionPrices
      bookDetailDataRelatedBooksBookEditionPrices =
      BookDetailDataRelatedBooksBookEditionPrices();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataRelatedBooksBookEditionPrices.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataRelatedBooksBookEditionPrices.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    bookDetailDataRelatedBooksBookEditionPrices.key = key;
  }
  return bookDetailDataRelatedBooksBookEditionPrices;
}

Map<String, dynamic> $BookDetailDataRelatedBooksBookEditionPricesToJson(
    BookDetailDataRelatedBooksBookEditionPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataTags $BookDetailDataTagsFromJson(Map<String, dynamic> json) {
  final BookDetailDataTags bookDetailDataTags = BookDetailDataTags();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataTags.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataTags.name = name;
  }
  final dynamic? key = jsonConvert.convert<dynamic>(json['key']);
  if (key != null) {
    bookDetailDataTags.key = key;
  }
  return bookDetailDataTags;
}

Map<String, dynamic> $BookDetailDataTagsToJson(BookDetailDataTags entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}

BookDetailDataEbook $BookDetailDataEbookFromJson(Map<String, dynamic> json) {
  final BookDetailDataEbook bookDetailDataEbook = BookDetailDataEbook();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataEbook.id = id;
  }
  final bool? listed = jsonConvert.convert<bool>(json['listed']);
  if (listed != null) {
    bookDetailDataEbook.listed = listed;
  }
  final bool? readyForPush = jsonConvert.convert<bool>(json['readyForPush']);
  if (readyForPush != null) {
    bookDetailDataEbook.readyForPush = readyForPush;
  }
  final List<BookDetailDataEbookChapters>? chapters = jsonConvert
      .convertListNotNull<BookDetailDataEbookChapters>(json['chapters']);
  if (chapters != null) {
    bookDetailDataEbook.chapters = chapters;
  }
  return bookDetailDataEbook;
}

Map<String, dynamic> $BookDetailDataEbookToJson(BookDetailDataEbook entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['listed'] = entity.listed;
  data['readyForPush'] = entity.readyForPush;
  data['chapters'] = entity.chapters?.map((v) => v.toJson()).toList();
  return data;
}

BookDetailDataEbookChapters $BookDetailDataEbookChaptersFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataEbookChapters bookDetailDataEbookChapters =
      BookDetailDataEbookChapters();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataEbookChapters.id = id;
  }
  final bool? isFree = jsonConvert.convert<bool>(json['isFree']);
  if (isFree != null) {
    bookDetailDataEbookChapters.isFree = isFree;
  }
  final String? subject = jsonConvert.convert<String>(json['subject']);
  if (subject != null) {
    bookDetailDataEbookChapters.subject = subject;
  }
  final int? lockType = jsonConvert.convert<int>(json['lockType']);
  if (lockType != null) {
    bookDetailDataEbookChapters.lockType = lockType;
  }
  final bool? isCompleted = jsonConvert.convert<bool>(json['isCompleted']);
  if (isCompleted != null) {
    bookDetailDataEbookChapters.isCompleted = isCompleted;
  }
  return bookDetailDataEbookChapters;
}

Map<String, dynamic> $BookDetailDataEbookChaptersToJson(
    BookDetailDataEbookChapters entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['isFree'] = entity.isFree;
  data['subject'] = entity.subject;
  data['lockType'] = entity.lockType;
  data['isCompleted'] = entity.isCompleted;
  return data;
}

BookDetailDataResources $BookDetailDataResourcesFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataResources bookDetailDataResources =
      BookDetailDataResources();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataResources.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataResources.name = name;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    bookDetailDataResources.size = size;
  }
  final String? sizeString = jsonConvert.convert<String>(json['sizeString']);
  if (sizeString != null) {
    bookDetailDataResources.sizeString = sizeString;
  }
  final String? extension = jsonConvert.convert<String>(json['extension']);
  if (extension != null) {
    bookDetailDataResources.extension = extension;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    bookDetailDataResources.url = url;
  }
  final String? guid = jsonConvert.convert<String>(json['guid']);
  if (guid != null) {
    bookDetailDataResources.guid = guid;
  }
  return bookDetailDataResources;
}

Map<String, dynamic> $BookDetailDataResourcesToJson(
    BookDetailDataResources entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['size'] = entity.size;
  data['sizeString'] = entity.sizeString;
  data['extension'] = entity.extension;
  data['url'] = entity.url;
  data['guid'] = entity.guid;
  return data;
}

BookDetailDataSalesInfos $BookDetailDataSalesInfosFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataSalesInfos bookDetailDataSalesInfos =
      BookDetailDataSalesInfos();
  final int? edition = jsonConvert.convert<int>(json['edition']);
  if (edition != null) {
    bookDetailDataSalesInfos.edition = edition;
  }
  final bool? canBeSaled = jsonConvert.convert<bool>(json['canBeSaled']);
  if (canBeSaled != null) {
    bookDetailDataSalesInfos.canBeSaled = canBeSaled;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    bookDetailDataSalesInfos.price = price;
  }
  final int? discount = jsonConvert.convert<int>(json['discount']);
  if (discount != null) {
    bookDetailDataSalesInfos.discount = discount;
  }
  final double? discountPrice =
      jsonConvert.convert<double>(json['discountPrice']);
  if (discountPrice != null) {
    bookDetailDataSalesInfos.discountPrice = discountPrice;
  }
  return bookDetailDataSalesInfos;
}

Map<String, dynamic> $BookDetailDataSalesInfosToJson(
    BookDetailDataSalesInfos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['edition'] = entity.edition;
  data['canBeSaled'] = entity.canBeSaled;
  data['price'] = entity.price;
  data['discount'] = entity.discount;
  data['discountPrice'] = entity.discountPrice;
  return data;
}

BookDetailDataBookEditionPrices $BookDetailDataBookEditionPricesFromJson(
    Map<String, dynamic> json) {
  final BookDetailDataBookEditionPrices bookDetailDataBookEditionPrices =
      BookDetailDataBookEditionPrices();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookDetailDataBookEditionPrices.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bookDetailDataBookEditionPrices.name = name;
  }
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    bookDetailDataBookEditionPrices.key = key;
  }
  return bookDetailDataBookEditionPrices;
}

Map<String, dynamic> $BookDetailDataBookEditionPricesToJson(
    BookDetailDataBookEditionPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['key'] = entity.key;
  return data;
}
