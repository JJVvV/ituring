import 'dart:convert';

import 'package:ituring/generated/json/base/json_field.dart';
import 'package:ituring/generated/json/profile_data_entity.g.dart';

@JsonSerializable()
class ProfileDataEntity {
  int? id;
  String? dEmail;
  String? nickName;
  dynamic publicProvince;
  dynamic publicCity;
  dynamic memo;
  dynamic htmlMemo;
  double? yinzi;
  String? website;
  dynamic mobilePhone;
  bool? banWeiXin;
  String? kindleEmail;
  bool? isFromWelcome;
  bool? banEmailMessage;
  bool? banWeixinMessage;
  bool? isAdmin;
  ProfileDataSpaceInfo? spaceInfo;

  ProfileDataEntity();

  factory ProfileDataEntity.fromJson(Map<String, dynamic> json) =>
      $ProfileDataEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProfileDataEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProfileDataSpaceInfo {
  int? id;
  int? articleCount;
  int? voteCount;
  int? favCount;
  int? commentCount;
  String? age;
  bool? voted;
  String? memo;
  String? htmlMemo;
  List<String>? websites;
  String? userNickName;
  int? followerCount;
  int? followedCount;
  int? personalCategoryCount;
  int? productCount;
  String? avatarImageKey;
  bool? isShowYinziButton;
  int? bookCount;
  int? categoryCount;

  ProfileDataSpaceInfo();

  factory ProfileDataSpaceInfo.fromJson(Map<String, dynamic> json) =>
      $ProfileDataSpaceInfoFromJson(json);

  Map<String, dynamic> toJson() => $ProfileDataSpaceInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
