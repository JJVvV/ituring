import 'package:ituring/generated/json/base/json_convert_content.dart';
import 'package:ituring/http/repository/profile_data_entity.dart';

ProfileDataEntity $ProfileDataEntityFromJson(Map<String, dynamic> json) {
  final ProfileDataEntity profileDataEntity = ProfileDataEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    profileDataEntity.id = id;
  }
  final String? dEmail = jsonConvert.convert<String>(json['dEmail']);
  if (dEmail != null) {
    profileDataEntity.dEmail = dEmail;
  }
  final String? nickName = jsonConvert.convert<String>(json['nickName']);
  if (nickName != null) {
    profileDataEntity.nickName = nickName;
  }
  final dynamic? publicProvince =
      jsonConvert.convert<dynamic>(json['publicProvince']);
  if (publicProvince != null) {
    profileDataEntity.publicProvince = publicProvince;
  }
  final dynamic? publicCity = jsonConvert.convert<dynamic>(json['publicCity']);
  if (publicCity != null) {
    profileDataEntity.publicCity = publicCity;
  }
  final dynamic? memo = jsonConvert.convert<dynamic>(json['memo']);
  if (memo != null) {
    profileDataEntity.memo = memo;
  }
  final dynamic? htmlMemo = jsonConvert.convert<dynamic>(json['htmlMemo']);
  if (htmlMemo != null) {
    profileDataEntity.htmlMemo = htmlMemo;
  }
  final double? yinzi = jsonConvert.convert<double>(json['yinzi']);
  if (yinzi != null) {
    profileDataEntity.yinzi = yinzi;
  }
  final String? website = jsonConvert.convert<String>(json['website']);
  if (website != null) {
    profileDataEntity.website = website;
  }
  final dynamic? mobilePhone =
      jsonConvert.convert<dynamic>(json['mobilePhone']);
  if (mobilePhone != null) {
    profileDataEntity.mobilePhone = mobilePhone;
  }
  final bool? banWeiXin = jsonConvert.convert<bool>(json['banWeiXin']);
  if (banWeiXin != null) {
    profileDataEntity.banWeiXin = banWeiXin;
  }
  final String? kindleEmail = jsonConvert.convert<String>(json['kindleEmail']);
  if (kindleEmail != null) {
    profileDataEntity.kindleEmail = kindleEmail;
  }
  final bool? isFromWelcome = jsonConvert.convert<bool>(json['isFromWelcome']);
  if (isFromWelcome != null) {
    profileDataEntity.isFromWelcome = isFromWelcome;
  }
  final bool? banEmailMessage =
      jsonConvert.convert<bool>(json['banEmailMessage']);
  if (banEmailMessage != null) {
    profileDataEntity.banEmailMessage = banEmailMessage;
  }
  final bool? banWeixinMessage =
      jsonConvert.convert<bool>(json['banWeixinMessage']);
  if (banWeixinMessage != null) {
    profileDataEntity.banWeixinMessage = banWeixinMessage;
  }
  final bool? isAdmin = jsonConvert.convert<bool>(json['isAdmin']);
  if (isAdmin != null) {
    profileDataEntity.isAdmin = isAdmin;
  }
  final ProfileDataSpaceInfo? spaceInfo =
      jsonConvert.convert<ProfileDataSpaceInfo>(json['spaceInfo']);
  if (spaceInfo != null) {
    profileDataEntity.spaceInfo = spaceInfo;
  }
  return profileDataEntity;
}

Map<String, dynamic> $ProfileDataEntityToJson(ProfileDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['dEmail'] = entity.dEmail;
  data['nickName'] = entity.nickName;
  data['publicProvince'] = entity.publicProvince;
  data['publicCity'] = entity.publicCity;
  data['memo'] = entity.memo;
  data['htmlMemo'] = entity.htmlMemo;
  data['yinzi'] = entity.yinzi;
  data['website'] = entity.website;
  data['mobilePhone'] = entity.mobilePhone;
  data['banWeiXin'] = entity.banWeiXin;
  data['kindleEmail'] = entity.kindleEmail;
  data['isFromWelcome'] = entity.isFromWelcome;
  data['banEmailMessage'] = entity.banEmailMessage;
  data['banWeixinMessage'] = entity.banWeixinMessage;
  data['isAdmin'] = entity.isAdmin;
  data['spaceInfo'] = entity.spaceInfo?.toJson();
  return data;
}

ProfileDataSpaceInfo $ProfileDataSpaceInfoFromJson(Map<String, dynamic> json) {
  final ProfileDataSpaceInfo profileDataSpaceInfo = ProfileDataSpaceInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    profileDataSpaceInfo.id = id;
  }
  final int? articleCount = jsonConvert.convert<int>(json['articleCount']);
  if (articleCount != null) {
    profileDataSpaceInfo.articleCount = articleCount;
  }
  final int? voteCount = jsonConvert.convert<int>(json['voteCount']);
  if (voteCount != null) {
    profileDataSpaceInfo.voteCount = voteCount;
  }
  final int? favCount = jsonConvert.convert<int>(json['favCount']);
  if (favCount != null) {
    profileDataSpaceInfo.favCount = favCount;
  }
  final int? commentCount = jsonConvert.convert<int>(json['commentCount']);
  if (commentCount != null) {
    profileDataSpaceInfo.commentCount = commentCount;
  }
  final String? age = jsonConvert.convert<String>(json['age']);
  if (age != null) {
    profileDataSpaceInfo.age = age;
  }
  final bool? voted = jsonConvert.convert<bool>(json['voted']);
  if (voted != null) {
    profileDataSpaceInfo.voted = voted;
  }
  final String? memo = jsonConvert.convert<String>(json['memo']);
  if (memo != null) {
    profileDataSpaceInfo.memo = memo;
  }
  final String? htmlMemo = jsonConvert.convert<String>(json['htmlMemo']);
  if (htmlMemo != null) {
    profileDataSpaceInfo.htmlMemo = htmlMemo;
  }
  final List<String>? websites =
      jsonConvert.convertListNotNull<String>(json['websites']);
  if (websites != null) {
    profileDataSpaceInfo.websites = websites;
  }
  final String? userNickName =
      jsonConvert.convert<String>(json['userNickName']);
  if (userNickName != null) {
    profileDataSpaceInfo.userNickName = userNickName;
  }
  final int? followerCount = jsonConvert.convert<int>(json['followerCount']);
  if (followerCount != null) {
    profileDataSpaceInfo.followerCount = followerCount;
  }
  final int? followedCount = jsonConvert.convert<int>(json['followedCount']);
  if (followedCount != null) {
    profileDataSpaceInfo.followedCount = followedCount;
  }
  final int? personalCategoryCount =
      jsonConvert.convert<int>(json['personalCategoryCount']);
  if (personalCategoryCount != null) {
    profileDataSpaceInfo.personalCategoryCount = personalCategoryCount;
  }
  final int? productCount = jsonConvert.convert<int>(json['productCount']);
  if (productCount != null) {
    profileDataSpaceInfo.productCount = productCount;
  }
  final String? avatarImageKey =
      jsonConvert.convert<String>(json['avatarImageKey']);
  if (avatarImageKey != null) {
    profileDataSpaceInfo.avatarImageKey = avatarImageKey;
  }
  final bool? isShowYinziButton =
      jsonConvert.convert<bool>(json['isShowYinziButton']);
  if (isShowYinziButton != null) {
    profileDataSpaceInfo.isShowYinziButton = isShowYinziButton;
  }
  final int? bookCount = jsonConvert.convert<int>(json['bookCount']);
  if (bookCount != null) {
    profileDataSpaceInfo.bookCount = bookCount;
  }
  final int? categoryCount = jsonConvert.convert<int>(json['categoryCount']);
  if (categoryCount != null) {
    profileDataSpaceInfo.categoryCount = categoryCount;
  }
  return profileDataSpaceInfo;
}

Map<String, dynamic> $ProfileDataSpaceInfoToJson(ProfileDataSpaceInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['articleCount'] = entity.articleCount;
  data['voteCount'] = entity.voteCount;
  data['favCount'] = entity.favCount;
  data['commentCount'] = entity.commentCount;
  data['age'] = entity.age;
  data['voted'] = entity.voted;
  data['memo'] = entity.memo;
  data['htmlMemo'] = entity.htmlMemo;
  data['websites'] = entity.websites;
  data['userNickName'] = entity.userNickName;
  data['followerCount'] = entity.followerCount;
  data['followedCount'] = entity.followedCount;
  data['personalCategoryCount'] = entity.personalCategoryCount;
  data['productCount'] = entity.productCount;
  data['avatarImageKey'] = entity.avatarImageKey;
  data['isShowYinziButton'] = entity.isShowYinziButton;
  data['bookCount'] = entity.bookCount;
  data['categoryCount'] = entity.categoryCount;
  return data;
}
